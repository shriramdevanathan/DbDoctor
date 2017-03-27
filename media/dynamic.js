/* First page Graphs and Javascript
Created By Nikil Vasudevan
*/
function setbg(color){
	document.getElementById("debugt").style.background=color
}

var tabis = getUrlVars()["selecttab"];
var initialtab;
if(tabis == "sc3"){
	initialtab=[3, "sc3"];
}else if(tabis == "sc2"){
	initialtab=[2, "sc2"];
}else{
	initialtab=[1, "sc1"];
}

function getUrlVars() {
	var vars = {};
	var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
		vars[key] = value;
	});
	return vars;
}

function cascadedstyle(el, cssproperty, csspropertyNS){
	if (el.currentStyle)
		return el.currentStyle[cssproperty]
	else if (window.getComputedStyle){
		var elstyle=window.getComputedStyle(el, "")
		return elstyle.getPropertyValue(csspropertyNS)
	}
}

var previoustab=""

function expandcontent(cid, aobject){
	if (document.getElementById){
		highlighttab(aobject)
		detectSourceindex(aobject)
		if (previoustab!="")
			document.getElementById(previoustab).style.display="none"
		document.getElementById(cid).style.display="block"
		previoustab=cid
		if (aobject.blur)
			aobject.blur()
		return false
	}
	else
	return true
}

function highlighttab(aobject){
	if (typeof tabobjlinks=="undefined")
		collecttablinks()
	for (i=0; i<tabobjlinks.length; i++)
		tabobjlinks[i].style.backgroundColor=initTabcolor
	var themecolor=aobject.getAttribute("theme")? aobject.getAttribute("theme") : initTabpostcolor
	aobject.style.backgroundColor=themecolor
}

function collecttablinks(){
	var tabobj=document.getElementById("tablist")
	tabobjlinks=tabobj.getElementsByTagName("A")
}

function detectSourceindex(aobject){
	for (i=0; i<tabobjlinks.length; i++){
		if (aobject==tabobjlinks[i]){
			tabsourceindex=i
			break
		}
	}
}

function do_onload(){
	var cookiename=(typeof persisttype!="undefined" && persisttype=="sitewide")? "tabcontent" : window.location.pathname
	var cookiecheck=window.get_cookie && get_cookie(cookiename).indexOf("|")!=-1
	collecttablinks()
	initTabcolor=cascadedstyle(tabobjlinks[1], "backgroundColor", "background-color")
	initTabpostcolor=cascadedstyle(tabobjlinks[0], "backgroundColor", "background-color")
	if (typeof enablepersistence!="undefined" && enablepersistence && cookiecheck){
		var cookieparse=get_cookie(cookiename).split("|")
		var whichtab=cookieparse[0]
		var tabcontentid=cookieparse[1]
		expandcontent(tabcontentid, tabobjlinks[whichtab])
	}
	else
	expandcontent(initialtab[1], tabobjlinks[initialtab[0]-1])
}

if (window.addEventListener)
	window.addEventListener("load", do_onload, false)
else if (window.attachEvent)
	window.attachEvent("onload", do_onload)
else if (document.getElementById)
	window.onload=do_onload

// Drawing the Graph 

var graphvalue;
function poll(){
	$.ajax({
		type: "POST", 
		data: {action: 'query'},
		cache: false,
		url: "db.php",
		async: false,
		success: function(data){
			graphvalue = eval('(' + data + ')');
        }
    });
}

var paramdetails;
function getAllDetails() {
	$.ajax({
		type: "POST", 
		data: {action: 'paramDetails',id:100,lgr:1},
		cache: false,
		url: "ldb.php",
		async: false,
		success: function(data){
			paramdetails = eval('(' + data + ')');
		}
	});

}
	
var thresholdValue;
function poll_threshold(){
	$.ajax({
		type: "POST", 
		data: {action: 'threshold',},
		cache: false,
		url: "db.php",
		async: false,
		success: function(data){
			thresholdValue = eval('(' + data + ')');
		}
	});
}
	
function getGraph(id, data, name, v1, v2){
	var min = 0;
	var max = 100;	
	var meter = new RGraph.Meter(id, min, max, data);
	var grad1 = meter.context.createRadialGradient(meter.canvas.width / 2,meter.canvas.height - 25,0,meter.canvas.width / 2,meter.canvas.height - 25,200);
	grad1.addColorStop(0, 'green');
	grad1.addColorStop(1, 'white');
            
	var grad2 = meter.context.createRadialGradient(meter.canvas.width / 2, meter.canvas.height - 25,0,meter.canvas.width / 2, meter.canvas.height - 25,200);
	grad2.addColorStop(0, 'yellow');
	grad2.addColorStop(1, 'white');
            
	var grad3 = meter.context.createRadialGradient(meter.canvas.width / 2, meter.canvas.height - 25,0,meter.canvas.width / 2, meter.canvas.height - 25,200);
	grad3.addColorStop(0, 'red');
	grad3.addColorStop(1, 'white');
				
	meter.Set('chart.labels.position', 'inside');
	meter.Set('chart.title', name);
	meter.Set('chart.title.vpos', 0.5);
	meter.Set('chart.title.color', 'black');
	//meter.Set('chart.green.color', grad1);
	//meter.Set('chart.yellow.color', grad2);
	//meter.Set('chart.red.color', grad3);
	meter.Set('chart.red.start', v2);
	meter.Set('chart.red.end', 100);
	meter.Set('chart.yellow.start', v1);
	meter.Set('chart.yellow.end', v2);
	meter.Set('chart.green.start', 0);
	meter.Set('chart.green.end', v1);
	meter.Set('chart.border', false);
	meter.Set('chart.needle.linewidth', 5);
	meter.Set('chart.needle.tail', true);
	meter.Set('chart.tickmarks.big.num', 0);
	meter.Set('chart.tickmarks.small.num', 0);
	meter.Set('chart.segment.radius.start', 100);
	meter.Set('chart.needle.radius', 80);
	meter.Set('chart.linewidth.segments', 15);
	meter.Set('chart.strokestyle', 'white');
	meter.Set('chart.text.size', 14);
        
	return meter;
}
    
function drawGraph (e){
	poll();
	getAllDetails();
	var k = 1;
	poll_threshold();
	if(typeof thresholdValue != 'undefined' && typeof graphvalue != 'undefined'){
		for (var i in graphvalue){
			var row = graphvalue[i];          
			var value = row[1];
			var vname = row[2];
				
			var threshold1 = thresholdValue[row[0]][0];
			var threshold2 = thresholdValue[row[0]][1];
			thresholdValue[row[0]][2] = vname ;
				
			var cname = "meter_"+k;	
				
			RGraph.Clear(document.getElementById(cname));
			var graph = getGraph(cname, value, vname, threshold1, threshold2);
			graph.Draw();
				
			cname = "dmeter_"+k;	
				
			RGraph.Clear(document.getElementById(cname));
			var graph = getGraph(cname, value, vname, threshold1, threshold2);
			graph.Draw();
			
			cname = "ameter_"+k;
			nHref = "levelgraph.php?id="+row[0];
			document.getElementById(cname).href = nHref ;
				
			cname ="#mtitle_"+k;
			$(cname).html(vname);
						
			cname = "#relmeter_"+k;
			relvalue = "#meter_"+k+"_detail";
			$(cname).attr('rel', relvalue);
			
			if(typeof paramdetails != 'undefined'){
			
				cname = "#mdesc_"+k;
				desc = paramdetails[row[0]][1];
				if(desc != null){
					$(cname).html(desc);
				}
			
			}
				
			k++;
				
		}
	}

	setTimeout(drawGraph,5000);
}

function isNumeric(value) {
  if (value == null || !value.toString().match(/^[-]?\d*\.?\d*$/)) return false;
  return true;
}

	
//validating the form 
var cancelAction = false;
function canAction(vals){
	cancelAction = vals;
}
function validateForm(){	
	if(!cancelAction){
		var x=document.forms["configform"]["xtime"].value
		var y=document.forms["configform"]["ytime"].value
		var z=document.forms["configform"]["ztime"].value
		
		var xunit=document.forms["configform"]["xunit"].value
		var yunit=document.forms["configform"]["yunit"].value
		var zunit=document.forms["configform"]["zunit"].value
		
		if (!isNumeric(x)) {
			alert("Check the xtime value ");			
			return false;
		}else if( !isNumeric(y)){
			alert("Check the ytime value");			
			return false;
		}else if( !isNumeric(z)){
			alert("Check the ytime value");			
			return false;
		}else if ( x == 0 || y == 0 || z == 0){
			alert("Check the time , time cannot be zero !!!!!");			
			return false;
		}else if ( parseInt(getTimeSecond(x,xunit)) <  parseInt(getTimeSecond(y,yunit)) ||  parseInt(getTimeSecond(y,yunit)) <  parseInt(getTimeSecond(z,zunit))) {
			alert("Check the xtime , ytime & ztime  value . X should be greater than Y and Y should be greater than Z");			
			return false;
		}
	}else{
		return true;
	}
}

function getTimeSecond(value,unit){
	if(unit == "hr"){
		return value*60*60;
	}else if(unit == "min"){
	 return value*60;
	}else {
	 return value;
	}
}

// Debug Form and data query function 

function getDebugData(qvalue){
    $.ajax({
        type: "POST", 
		data: {action: 'debugquery',debugcd: qvalue},
		cache: false,
		url: "db.php",
		async: false,
		success: function(qdata){
			querytable = eval('(' + qdata + ')');
			if( typeof querytable["dout"] == 'undefined'){
				var nrows = 0;
				var tab=document.createElement('table');
				tab.className="querytable";
				var tbo=document.createElement('tbody');
				var row, cell, j;
				row=document.createElement('tr');
				for(var key in querytable) {
					if (querytable.hasOwnProperty(key)){
						cell=document.createElement('th');
						cell.appendChild(document.createTextNode(key));
						row.appendChild(cell);
						
						if(nrows < querytable[key].length){
							nrows = querytable[key].length;
						}
					}
				}
				tbo.appendChild(row);
				for(j=0;j<nrows;j++){
					row=document.createElement('tr');
					for(var key in querytable) {
						if (querytable.hasOwnProperty(key)){
							cell=document.createElement('td');
							cell.appendChild(document.createTextNode(querytable[key][j]));
							row.appendChild(cell);
						}
					}
					tbo.appendChild(row);	
				}
				tab.appendChild(tbo);
				var root = document.getElementById('qresult');
				if(root.hasChildNodes()){
					var kid = root.firstChild;
					root.replaceChild(tab, kid);
				}else{
					root.appendChild(tab);
				}
				var cell = document.getElementById('qout');
				if ( cell.hasChildNodes() )
				{
					while ( cell.childNodes.length >= 1 )
					{
						cell.removeChild( cell.firstChild );       
					} 
				}
				$('html,body').animate({ scrollTop: $("#qresult").offset().top }, { duration: 'slow', easing: 'swing'});
			}else{
				var root = document.getElementById('qout');
				if(root.hasChildNodes()){
					var kid = root.firstChild;
					root.replaceChild(document.createTextNode(querytable["dout"]), kid);
				}else{
					root.appendChild(document.createTextNode(querytable["dout"]));
				}				
				var cell = document.getElementById('qresult');
				if ( cell.hasChildNodes() )
				{
					while ( cell.childNodes.length >= 1 )
					{
						cell.removeChild( cell.firstChild );       
					} 
				}
			}
		}
	});
}

function validateDebugForm(){	
	if(!cancelAction){
		if (document.getElementById("debugt").value == " ") {
			alert("Enter a Debug Query");			
			return false;
		}else{
			getDebugData(document.getElementById('debugt').value);
			return true;
		}
	}else{
		return true;
	}
}

// Function for Getting time data

function getTimeData(e){
    $.ajax({
        type: "POST", 
		data: {action: 'timedata'},
		cache: false,
		url: "db.php",
		async: false,
		success: function(tdata){
			timevalue = eval('(' + tdata + ')');
			$("#xt").val(timevalue[0]);
			$('#yt').val(timevalue[1]);
			$('#zt').val(timevalue[2]);
		}
	});
}

// Function for Getting Monitor data

function getMonitorData(e){
    $.ajax({
        type: "POST", 
		data: {action: 'monitordata'},
		cache: false,
		url: "db.php",
		async: false,
		success: function(html){
			$("#mdata").html(html);
		}
	});
}

function validateMForm(){
	var e = document.getElementById("mdata");
	var mvalue = e.options[e.selectedIndex].value;

    $.ajax({
        type: "POST", 
		data: {action: 'smonitordata',mdata: mvalue},
		cache: false,
		url: "db.php",
		async: false,
		success: function(html){
			$("#msvalue").html(html);
		}
	});
	getMonitorData();
}

function loadReport() {
	$.blockUI({ css: { 
		border: 'none', 
		padding: '15px', 
		backgroundColor: '#000', 
		'-webkit-border-radius': '10px', 
		'-moz-border-radius': '10px', 
		opacity: .5, 
		color: '#fff' 
	} }); 
	setTimeout(bloadReport, 200); 
}	
	
function bloadReport(){
	var time1 = document.getElementById("time1").value;
	var time2 = document.getElementById("time2").value;
	    $.ajax({
        type: "POST", 
		data: {action: 'awrdata',t1:time1,t2:time2},
		cache: false,
		url: "db.php",
		async: false,
		success: function(html){
			$("#awreport").html(html);
			$.unblockUI();
		}
	});
	

}

var click = 0;

function checkAlert(){

	if(!click){
		click = 1;
		$.ajax({
			type: "POST", 
			data: {action: 'alertdata',},
			cache: false,
			url: "db.php",
			async: false,
			success: function(html){
				$("#alertmsg").html(html);
			}
		});
	}else{
		click = 0;
	}
}

function loadDReport() {
	$.blockUI({ css: { 
		border: 'none', 
		padding: '15px', 
		backgroundColor: '#000', 
		'-webkit-border-radius': '10px', 
		'-moz-border-radius': '10px', 
		opacity: .5, 
		color: '#fff' 
	} }); 
	setTimeout(bloadDReport, 200); 
}	



function bloadDReport() {
	var time1 = document.getElementById("rtime1").value;
	var time2 = document.getElementById("rtime2").value;
	    $.ajax({
        type: "POST", 
		data: {action: 'oddata',t1:time1,t2:time2},
		cache: false,
		url: "db.php",
		async: false,
		success: function(html){
			$("#odreport").html(html);
			$('html,body').animate({ scrollTop: $("#odreport").offset().top }, { duration: 'slow', easing: 'swing'});
			$.unblockUI();
		}
	});


}

function checkLogin() {
	var user = getCookie("user");
	if (user == null || user =="") {
		$.blockUI({ message: $('#loginForm') });
	}
}

function getCookie(c_name){
	var i,x,y,ARRcookies=document.cookie.split(";");
	for (i=0;i<ARRcookies.length;i++){
		x=ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
		y=ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
		x=x.replace(/^\s+|\s+$/g,"");
		if (x==c_name){
			return unescape(y);
		}
	}
}

function logValidate() {

    $.ajax({
        type: "POST", 
		data: {action: 'login',usr:document.getElementById('usr').value,pass:document.getElementById('pass').value},
		cache: false,
		url: "db.php",
		async: false,
		success: function(data){
			if(data == "success"){
				var user = getCookie("user");
				if (user == null || user =="") {
					$('#logres').html("wrong user name and password")
				}else {
					$.unblockUI();
				}
				
			}else {
				$('#logres').html("wrong user name and password");
			}
		}
	}); 

}

function deleteCookie(c_name) {
    document.cookie = encodeURIComponent(c_name) + "=deleted; expires=" + new Date(0).toUTCString();
}

function genThresholdForm(){

	if(typeof thresholdValue != 'undefined'){
		for (var i in thresholdValue){
			var row = thresholdValue[i];
			if(typeof row[2] != 'undefined'){
				var fieldset = createFieldset(i,row[2],row[0],row[1]);
				document.getElementById("thresform1").appendChild(fieldset);
			}
		}
	}
}

function createFieldset(id,name,v1,v2) {
    var fieldset = document.createElement("fieldset");
    var legend = fieldset.appendChild( document.createElement("legend") );
    legend.appendChild( document.createTextNode(name) );

	fieldset.setAttribute("class", "thresform");
	var element1 = document.createElement("input");
	
	var lab=document.createElement('label');
	lab.setAttribute("class", "labthres");
	var words=document.createTextNode("Threshold Value 1")
	lab.appendChild(words);
	fieldset.appendChild(lab);
 
   
	var nid = id+"v1";
    element1.setAttribute("type", "text");
    element1.setAttribute("value", v1);
    element1.setAttribute("name", nid);
	
	fieldset.appendChild(element1);
	
	var lab=document.createElement('label');
	lab.setAttribute("class", "labthres");
	var words=document.createTextNode("Threshold Value 2")
	lab.appendChild(words);
	fieldset.appendChild(lab);
	
	var element2 = document.createElement("input");
 
   	nid = id+"v2";
    element2.setAttribute("type", "text");
    element2.setAttribute("value", v2);
    element2.setAttribute("name", nid);
	
	
	fieldset.appendChild(element2);

    return fieldset;
}

//validating the form 
var cancelThreshold = false;
function canThresh(vals){
	cancelThreshold = vals;
}
function validateThreshForm(){	
	if(!cancelThreshold){
	
		if(typeof thresholdValue != 'undefined'){
			for (var i in thresholdValue){
				var row = thresholdValue[i];
				var id1 = i+"v1";
				var id2 = i+"v2";
				if(typeof row[2] != 'undefined'){
					var x1=document.forms["thresform"][id1].value;
					var x2=document.forms["thresform"][id2].value;
					if (!isNumeric(x1) || !isNumeric(x2) || x1 ==0 || x2 == 0  || x2 < x1) {
						alert("check " + row[2] + " value");
						return false;
					
					}
				}
			}
		}
		

	}else{
		return true;
	}
}


function analyzeSchema(){
	$.blockUI({ css: { 
		border: 'none', 
		padding: '15px', 
		backgroundColor: '#000', 
		'-webkit-border-radius': '10px', 
		'-moz-border-radius': '10px', 
		opacity: .5, 
		color: '#fff' 
	} }); 	
	setTimeout(getAlData, 200);  
}

function getAlData() {
	var analschema = document.getElementById("scha").value;
	if(typeof analschema == 'undefined' || analschema == ""){
		$.unblockUI();
		alert("Enter a Proper Schema");
	}else{
		$.ajax({
			type: "POST", 
			data: {action: 'analyzeSchema',id:analschema},
			cache: false,
			url: "db.php",
			async: false,
			success: function(data){
				$("#schemar").html(eval('(' + data + ')'));
				$.unblockUI();
			}
		});
	}
}
var helpList;

function getHelpIndex() {
	readIndex();
	if(typeof helpList != 'undefined'){
		for (var i in helpList){
			var helprow = helpList[i]
			$("#helplist").append('<li><a href="#" onClick="getHelpData('+helprow[0]+')"><span>'+helprow[1]+'</span></a></li>');
		}
	}
}

function readIndex() {
	$.ajax({
		type: "POST", 
		data: {action: 'helpindex',id:-1},
		cache: false,
		url: "db.php",
		async: false,
		success: function(data){
			helpList = eval('(' + data + ')');			
		}
	});
}
var helpdata;
function getHelpData(id) {
	readIndexData(id);
	if(typeof helpdata != 'undefined'){
		//for (var i in helpdata){
			//var helprow = helpdata[i]
			$("#hedata").html(helpdata);
		//}
	}

}

function readIndexData(id) {
	$.ajax({
		type: "POST", 
		data: {action: 'helpindex',id:id},
		cache: false,
		url: "db.php",
		async: false,
		success: function(hdata){
			helpdata = eval('(' + hdata + ')');			
		}
	});
}
