<!--   
Second Page with Graph Loaded
Created By Nikil Vasudevan
-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Database Monitor</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="./media/style.css" rel="stylesheet" type="text/css" />
	<link href="./media/levelcontent.css" rel="stylesheet" type="text/css" />
	<link href="./media/tabs/tabs.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="./media/slider/css/anythingslider.css">
	<script language="javascript" type="text/javascript" src="./media/jquery-1.7.1.js"></script>
	<script language="javascript" type="text/javascript" src="./media/jquery.tools.min.js"></script>
	<script language="javascript" type="text/javascript" src="./media/ldynamic.js"></script>	
	<script language="javascript" src="./media/slider/js/jquery.anythingslider.js"></script>
	<script language="javascript" type="text/javascript" src="./media/jquery.blockUI.js"></script>
	<script language="javascript" src="./media/RGraph/libraries/RGraph.common.core.js" ></script>
    <script language="javascript" src="./media/RGraph/libraries/RGraph.common.effects.js" ></script>
    <script language="javascript" src="./media/RGraph/libraries/RGraph.common.context.js" ></script>
    <script language="javascript" src="./media/RGraph/libraries/RGraph.line.js" ></script>
    <script language="javascript" src="./media/RGraph/libraries/RGraph.common.annotate.js" ></script>
    <script language="javascript" src="./media/RGraph/libraries/RGraph.common.tooltips.js" ></script>
    <script language="javascript" src="./media/RGraph/libraries/RGraph.common.zoom.js" ></script>
    <script language="javascript" src="./media/RGraph/libraries/RGraph.common.resizing.js" ></script>
    <script language="javascript" src="./media/RGraph/libraries/RGraph.meter.js" ></script>
	<script language="javascript" src="./media/RGraph/libraries/RGraph.led.js" ></script>
    <!--[if lt IE 9]><script language="javascript" src="./media/RGraph/excanvas/excanvas.original.js"></script><![endif]-->	

	<script>
		$(function() {
			$("a[rel]").overlay({effect: 'apple'});
		});

		// Wait for window load
		$(window).load(function() {
			// Animate loader off screen
			       	$("#loading").fadeToggle("slow", "linear");
	        	$(this).toggleClass("active");
	        	return false;
		});


		$(function(){
			$('#slider').anythingSlider({
				resizeContents      : true,
				easing          : 'easeInOutBack',
				navigationFormatter : function(i, panel){
				return ['Monitor Level', 'Monitor Level 1', 'Monitor Level 1 Ind', 'Monitor Level 2', 'Monitor Level 2 Ind'][i - 1];
			}
			
			
			});
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
<div id="loading" >
			Generating Graph !!!!!
			<img src="media/load2.gif" alt="loader">
</div>

<object>
    <param name="banner" value="./media/banner.swf">
	
    <embed src="./media/banner.swf" width="100%" wmode="transparent">
    </embed>
</object>
<ol id="toc">
	<li><a href="index.php#page=monitor"><span>DB Monitor</span></a></li>
	<li><a href="index.php#page=config"><span>Configuration</span></a></li>
	<li><a href="index.php#page=demand"><span>On Demand Report</span></a></li>
	<li><a href="index.php#page=debug"><span>Debug Interface</span></a></li>
	<li><a href="index.php#page=awr"><span>ADDM Advisor</span></a></li>
	<li><a href="index.php#page=help" ><span>Tool Help</span></a></li>
</ol>
<div class="content" id="graph">
<script src="./media/chartsd/js/highstock.js"></script>
<script src="./media/chartsd/js/modules/exporting.js"></script>




	<ul id="slider">

		<li>
	
			<div id="s1">
				
				<div id="lmonitor"> <canvas id="smonitor" width="600" height="250">[No canvas support]</canvas></div>
				<div id="mled">
					<div class="cled" id="cled1" width="200">
						<div id="grcanvas">
							<canvas id="led1" width="200" height="60">[No canvas support]</canvas>			
						</div>
						<div id="graphdetails">
							<span id="graphtitle1">				
							</span>
						</div>
					</div>
					<div class="cled" id="cled2" width="200">
						<div id="grcanvas">
							<canvas id="led2" width="200" height="60">[No canvas support]</canvas>			
						</div>
						<div id="graphdetails">
							<span id="graphtitle2">			
							</span>
						</div>
					</div>
					<div class="cled" id="cled3" width="200">
						<div id="grcanvas">
							<canvas id="led3" width="200" height="60">[No canvas support]</canvas>			
						</div>
						<div id="graphdetails">
							<span id="graphtitle3">
							</span>
						</div>
					</div>
					<div class="cled" id="cled4" width="200">
						<div id="grcanvas">
							<canvas id="led4" width="100" height="60">[No canvas support]</canvas>			
						</div>
						<div id="graphdetails">
							<span id="graphtitle4">		
							</span>
						</div>
					</div>
				</div>
				<div id="mdetail">
					<div id="intitle">DB Dr's Advice</div>
					<ol id="madvice"></ol>
				</div>
					
			</div>
		
	
		</li>
	
		<li>
			<div id="s2">
				<div id="lmain">
				<div id="smonitor2" width="600" height="250">[No canvas support]</div>
				<div class="lside" id ="smonitor2t"></div>
				</div>
			</div>
		</li>

		<li>
			<div id="s3">
				<div id="lmain">
				<div id="smonitor2x" width="600" height="250">[No canvas support]</div>				
				<div class="lside" id="smonitor2xt" >
					<div id="basebutton" rel="abcd"><a href="#" class="bsbutton" rel="#baseover">Baseline Params</a></div>
				</div>	
								
				</div>
			</div>
		</li>
		<li>
			<div id="s4">
				<div id="lmain">		
				<div id="smonitor1" width="100" height="150"></div>
				<div class="lside" id="smonitor1t"></div>
					
				</div>
				
				
			</div>
		</li>

		<li>
			<div id="s5">
				<div id="lmain">
				<div id="smonitor1y" width="600" height="250">[No canvas support]</div>
				<div id="basebutton" rel="abcd"><a href="#" class="bsbutton" rel="#baseover">Baseline Params</a></div>
				<div class="lside" id="smonitor1yt"></div>	
				</div>				
			</div>
		</li>



	</ul>
	
	<div class="overlay" id="baseover">
		<div id="bschild"></div>
		<div id="bsresult"></div>
	</div>

	<script language="javascript" type="text/javascript">
	getAllGraph();
	</script>	
		


</div>
<div id="loginForm" style="display:none">
	<p align="left"><label>Username:</label><input type="text" id="usr" name="username" /></p>
	<p align="left"><label>Password:</label><input type="text" id="pass" name="password" /></p>
	<input id="logbutton" type="submit" name="logdb" value="Login" onclick="logValidate()" />
	<div id="logres"></div>
</div>

<div class="slider">
	<div id="alertmsg"></div>
	<div style="clear:both;"></div>
</div>
<a class="trigger" href="#" onClick="checkAlert()">Alerts !</a>
</div>
<p id="footer">
<a href="mailto:nikilv@nus.edu.sg">Tool Designed By DNS Team</a>
</p>
</body>
</html>