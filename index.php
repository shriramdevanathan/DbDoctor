<!--   
First Index Page Loaded
Created By Nikil Vasudevan
-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Database Monitor</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="./media/style.css" rel="stylesheet" type="text/css" />
	<link href="./media/tabs/tabs.css" rel="stylesheet" type="text/css" />
	<link href="./media/content.css" rel="stylesheet" type="text/css" />
	<script language="javascript" type="text/javascript" src="./media/jquery-1.7.1.js"></script>
	<script language="javascript" type="text/javascript" src="./media/jquery.tools.min.js"></script>
	<script language="javascript" type="text/javascript" src="./media/dynamic.js"></script>
	<script language="javascript" type="text/javascript" src="./media/datetimepicker_css.js"></script>
	<script language="javascript" type="text/javascript" src="./media/jquery.blockUI.js"></script>
	<script language="javascript" src="./media/RGraph/libraries/RGraph.common.core.js" ></script>
    <script language="javascript" src="./media/RGraph/libraries/RGraph.common.effects.js" ></script>
    <script language="javascript" src="./media/RGraph/libraries/RGraph.common.context.js" ></script>
    <script language="javascript" src="./media/RGraph/libraries/RGraph.common.annotate.js" ></script>
    <script language="javascript" src="./media/RGraph/libraries/RGraph.common.tooltips.js" ></script>
    <script language="javascript" src="./media/RGraph/libraries/RGraph.common.zoom.js" ></script>
    <script language="javascript" src="./media/RGraph/libraries/RGraph.common.resizing.js" ></script>
    <script language="javascript" src="./media/RGraph/libraries/RGraph.meter.js" ></script>
    <!--[if lt IE 9]><script language="javascript" src="./media/RGraph/excanvas/excanvas.original.js"></script><![endif]-->

	
	<script>
		$(function() {
			$("a[rel]").overlay({effect: 'apple'});
		});

		$(document).ready(function(){
			checkLogin();
	    	$(".trigger").click(function(){
	        	$(".slider").toggle("slow");
	        	$(this).toggleClass("active");
	        	return false;
	    	});
			
		});

	</script>
</head>
<body id="articles">
<div id="content">
<object>
    <param name="banner" value="./media/banner.swf">
	<param name="loop" value ="false">
    <embed src="./media/banner.swf" width="100%" wmode="transparent">
	
    </embed>
</object>
<ol id="toc">
	<li><a href="#monitor"><span>DB Monitor</span></a></li>
	<li><a href="#config"><span>Configuration</span></a></li>
	<li><a href="#demand"><span>On Demand Report</span></a></li>
	<li><a href="#debug"><span>Debug Interface</span></a></li>
	<li><a href="#awr" ><span>ADDM Advisor</span></a></li>
	<li><a href="#help" ><span>Tool Help</span></a></li>
</ol>
<div class="content" id="monitor">

	<div class="graph-container">
		<div class="graph-image">
			<a id="relmeter_1" href="#" rel=""><canvas id="meter_1" width="385" height="250"></canvas></a>				
		</div>
	</div>
	<div class="graph-container">
		<div class="graph-image">
			<a id="relmeter_2"  href="#" rel=""><canvas id="meter_2" width="385" height="250"></canvas></a>				
		</div>
	</div>
	<div class="graph-container">
		<div class="graph-image">
			<a id="relmeter_3" href="#" rel=""><canvas id="meter_3" width="385" height="250"></canvas></a>				
		</div>
	</div>
	<div class="graph-container">
		<div class="graph-image">
			<a id="relmeter_4" href="#" rel=""><canvas id="meter_4" width="385" height="250"></canvas></a>				
		</div>
	</div>
	<div class="graph-container">
		<div class="graph-image">
			<a id="relmeter_5"  href="#" rel=""><canvas id="meter_5" width="385" height="250"></canvas></a>				
		</div>
	</div>
	<div class="graph-container">
		<div class="graph-image">
			<a id="relmeter_6"  href="#" rel=""><canvas id="meter_6" width="385" height="250"></canvas></a>				
		</div>
	</div>
	
	<div class="overlay" id="meter_1_detail">
		<div id="oimg"><canvas id="dmeter_1" width="400" height="250"></div>
		<div class="odetails">
			<div class="mtitle" id="mtitle_1"></div>
			<div id="mdesc_1"> </div><div>For a Detailed Analysis of the Monitor Click <a id="ameter_1" href="">here</a>	</div>
		</div>
	</div>
	
	<div class="overlay" id="meter_2_detail">
		<div id="oimg"><canvas id="dmeter_2" width="400" height="250"></div>
		<div class="odetails">
			<div class="mtitle" id="mtitle_2"></div>
			<div id="mdesc_2"> </div><div>For a Detailed Analysis of the Monitor Click <a href="" id="ameter_2">here</a>	</div>
		</div>
	</div>
	<div class="overlay" id="meter_3_detail">
		<div id="oimg"><canvas id="dmeter_3" width="400" height="250"></div>
		<div class="odetails">
			<div class="mtitle" id="mtitle_3"></div>
			<div id="mdesc_3"> </div><div>For a Detailed Analysis of the Monitor Click <a href="" id="ameter_3">here</a>	</div>
		</div>
	</div>
	<div class="overlay" id="meter_4_detail">
		<div id="oimg"><canvas id="dmeter_4" width="400" height="250"></div>
		<div class="odetails">
			<div class="mtitle" id="mtitle_4"></div>
			<div id="mdesc_4"> </div><div>For a Detailed Analysis of the Monitor Click <a href="" id="ameter_4">here</a>	</div>
		</div>
	</div>
	<div class="overlay" id="meter_5_detail">
		<div id="oimg"><canvas id="dmeter_5" width="400" height="250"></div>
		<div class="odetails">
			<div class="mtitle" id="mtitle_5"></div>
			<div id="mdesc_5"> </div><div>For a Detailed Analysis of the Monitor Click <a href="" id="ameter_5">here</a>	</div>
		</div>
	</div>
	<div class="overlay" id="meter_6_detail">
		<div id="oimg"><canvas id="dmeter_6" width="400" height="250"></div>
		<div class="odetails">
			<div class="mtitle" id="mtitle_6"></div>
			<div id="mdesc_6"> </div><div>For a Detailed Analysis of the Monitor Click <a href="" id="ameter_6">here</a>	</div>
		</div>
	</div>

	<script language="javascript" type="text/javascript">
	drawGraph();
	</script>	
	
	
</div>
<div class="content" id="config">
	<ul id="tablist">
		<li><a class="current" onClick="return expandcontent('sc1', this)">Sample Time Configuration</a></li>			
		<li><a onClick="return expandcontent('sc2', this)" >Threshold Configuration</a></li>	
		<li><a onClick="return expandcontent('sc3', this)" >Add Monitor / Analyze Schema</a></li>	
	</ul>
	<div id="sc1" class="tabcontent">
		<form name="configform" action="db.php" method="post" onsubmit="return validateForm()">
		
		<fieldset id="level1">
				<legend>
					Level 1 Sampling Rate 
				</legend>
				<label for="xtime">
					X Frequency
				</label>
				<input id="xt" type="text" name="xtime" maxlength="50" /> 
				
				<label for="xsu">
					X Unit Time
				</label>
					<select name="xunit">
						<option value="hr">Hour</option>
						<option value="min">Minutes</option>
						<option value="sec" selected="true" >Seconds</option>
					</select>
				
		</fieldset>
		<fieldset id="level2">
				<legend>
					Level 2 Sampling Rate 
				</legend>
				<label for="ytime">
					Y Frequency
				</label>
					<input id="yt" type="text" name="ytime" maxlength="50" /> 
				
				<label for="ysu">
					Y Unit time
				</label>
					<select name="yunit">
						<option value="hr">Hour</option>
						<option value="min">Minutes</option>
						<option value="sec" selected="true" >Seconds</option>
					</select>
		</fieldset> 
		<fieldset id="level3">
				<legend>
					Level 3 Sampling Rate 
				</legend>
				<label for="ztime">
					Z Frequency
				</label>
					<input id="zt" type="text" name="ztime" maxlength="50" /> 
				
				<label for="zsu">
					Z Unit time
				</label>
					<select name="zunit">
						<option value="hr">Hour</option>
						<option value="min">Minutes</option>
						<option value="sec" selected="true" >Seconds</option>
					</select>
		</fieldset> 
		
		<p>
			<input id="button1" type="submit" name="donetpl" value="EXIT" onclick="canAction(true)" />
			<input id="button2" type="submit" name="submitpl" value="SUBMIT" onclick="canAction(false)" />
		</p>
		</form>
		<script language="javascript" type="text/javascript">
		getTimeData();
		</script>
	</div>
	<div id="sc2" class="tabcontent">
		<form id="thresform1" name="thresform" action="db.php" method="post" onsubmit="return validateThreshForm()">
		
		<script language="javascript" type="text/javascript">
		genThresholdForm();
		</script>
		
		<p>	<input id="button3" type="submit" name="donethr" value="EXIT" onclick="canThresh(true)" />
			<input id="button4" type="submit" name="submitthr" value="SUBMIT" onclick="canThresh(false)" />
		</p>
		</form>

	</div>
	<div id="sc3" class="tabcontent">
		<fieldset id="anmontior">
			<legend>
				Add New Monitor
			</legend>
			
			<label for="addmon">
					Monitor
			</label>
			<select name="mdata" id="mdata">
			<option selected="selected">--Create Monitor--</option>
			</select>
			<script language="javascript" type="text/javascript">
			getMonitorData();
			</script>
			
			<input id="anmbutton" type="submit" name="submitm" value="Add Montior" onclick="validateMForm()" />
			<div id="msvalue"></div>
		</fieldset>
		<fieldset id="aschema">
			<legend>
				Analyze Schema
			</legend>
			<label for="anlsch">
					Schema
			</label>
					<input id="scha" type="text" name="asch" maxlength="50" /> 
			<input id="azbutton" type="submit" name="submitm" value="Analyze Schema" onclick="analyzeSchema()" />
			<div id="schemar"></div>		
		</fieldset>
	</div>
</div>
<div class="content" id="demand">
	<div style="text-align:center; width:100px height:100px;">
     <label for="rtime1">Enter Start Date and Time here </label>
     <input type="Text" id="rtime1" maxlength="25" size="25"/>
     <img src="./media/images2/cal.gif" onclick="javascript:NewCssCal('rtime1','ddMMyyyy','dropdown',true,'24',true,'past')" style="cursor:pointer"/>
	 <label for="rtime2">Enter Start Date and Time here </label>
     <input type="Text" id="rtime2" maxlength="25" size="25"/>
     <img src="./media/images2/cal.gif" onclick="javascript:NewCssCal('rtime2','ddMMyyyy','dropdown',true,'24',true,'past')" style="cursor:pointer"/>
	 <input id="odbutton" type="submit" name="submitdb" value="Generate Report" onclick="loadDReport()" />
   </div>
	<div id="odreport"></div>
</div>
<div class="content" id="debug">
	<textarea id="debugt" type="text" name="debugcd" cols="100" row="20" onfocus="this.value=''; setbg('#e5fff3');this.onfocus=null;" onblur="setbg('white');">Enter your Query here...... </textarea>
	<input id="qbutton" type="submit" name="submitdb" value="Run Query" onclick="validateDebugForm()" />
	<div id="qout"></div>
	<div id="qresult"></div>
</div>
<div class="content" id="awr">
   <div style="text-align:center; width:100px height:100px;">
     <label for="time1">Enter Start Date and Time here </label>
     <input type="Text" id="time1" maxlength="25" size="25"/>
     <img src="./media/images2/cal.gif" onclick="javascript:NewCssCal('time1','ddMMyyyy','dropdown',true,'24',true,'past')" style="cursor:pointer"/>
	 <label for="time2">Enter Start Date and Time here </label>
     <input type="Text" id="time2" maxlength="25" size="25"/>
     <img src="./media/images2/cal.gif" onclick="javascript:NewCssCal('time2','ddMMyyyy','dropdown',true,'24',true,'past')" style="cursor:pointer"/>
	 <input id="awrbutton" type="submit" name="submitdb" value="Get AWR" onclick="loadReport()" />
   </div>
	<div id="awreport"></div>
</div>
<div class="content" id="help">
	<div class="colmask leftmenu">
		<div class="colleft">
			<div class="col1">
				<div id="hedata">
				
				</div>			
			</div>
			<div class="col2">
				<ul id="helplist">
	
				</ul> 				
			</div>
		</div>
	</div>
	<script language="javascript" type="text/javascript">
	getHelpIndex();
	</script>

</div>
<div class="slider">
	<div id="alertmsg"></div>
	<div style="clear:both;"></div>
</div>
<a class="trigger" href="#" onClick="checkAlert()">Alerts !</a>
<div id="loginForm" style="display:none;clear:both;">
	<p align="left"><label>Username:</label><input type="text" id="usr" name="username" /></p>
	<p align="left"><label>Password:</label><input type="text" id="pass" name="password" /></p>
	<input id="logbutton" type="submit" name="logdb" value="Login" onclick="logValidate()" />
	<div id="logres"></div>
</div>

<script src="./media/tabs/activatables.js" type="text/javascript"></script>
<script type="text/javascript">
activatables('page', ['monitor', 'config', 'demand' , 'debug', 'awr', 'help']);
</script>
</div>
<p id="footer">
<a href="mailto:nikilv@nus.edu.sg">Tool Designed By DNS Team</a>
</p>
</body>
</html>