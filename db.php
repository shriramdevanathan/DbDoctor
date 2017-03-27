<?php
/* First Page PHP Scripts
Created By Nikil Vasudevan
*/
include("connect.php");

if(isset($_POST['action']) && !empty($_POST['action'])) {
    $action = $_POST['action'];
    switch($action) {
		case 'awrdata' : awrdata();break;
        case 'query' : query();break;
		case 'timedata' : timedata();break;
		case 'debugquery' : debugquery();break;
		case 'monitordata' : monitordata();break;
		case 'smonitordata' : smonitordata();break;
		case 'alertdata' : alertdata();break;
		case 'oddata' : oddata();break;
		case 'login' : login();break;
		case 'threshold' : threshold();break;
		case 'analyzeSchema' : analSchema();break;
		case 'helpindex' : helpindex();break;
    }
}else if (isset($_POST['donetpl']) || isset($_POST['donethr']) ) {	
	header("Location: index.php");
}else if (isset($_POST['submitpl'])) {	
	
	if($_POST['xunit'] != "sec"){
		$xtime = converttime($_POST['xtime'],$_POST['xunit']);
	}else {
		$xtime = $_POST['xtime'];
	}
	
	if($_POST['yunit'] != "sec"){
		$ytime = converttime($_POST['ytime'],$_POST['yunit']);
	}else {
		$ytime = $_POST['ytime'];	
	}
	
	if($_POST['zunit'] != "sec"){
		$ztime = converttime($_POST['ztime'],$_POST['zunit']);
	}else {
		$ztime = $_POST['ztime'];	
	}

	$conn = connect();
	
	$s = oci_parse($conn, "begin cs5226.PKG_DB_MON.PROC_WR_SCHED_INITIALIZE(:xtime, :ytime, :ztime); end;");
	oci_bind_by_name($s, ':xtime', $xtime);
	oci_bind_by_name($s, ':ytime', $ytime);
	oci_bind_by_name($s, ':ztime', $ztime);
	oci_execute($s);
	oci_free_statement($s);
	oci_close($conn);
	header("Location: index.php#page=config");	
}else if (isset($_POST['submitthr'])) {	

	$conn = connect();
	$s = oci_parse($conn, "begin cs5226.PKG_DB_MON.PROC_GET_THRESHOLD_ALL(:ret); end;");
	$rc = oci_new_cursor($conn);
	oci_bind_by_name($s, ':ret', $rc, -1, OCI_B_CURSOR);
	oci_execute($s);
	oci_execute($rc);
	
	while ($row = oci_fetch_row($rc)) {
		
		$id1 = $row[0]."v1";
		$id2 = $row[0]."v2";

		if(isset($_POST[$id1]) || isset($_POST[$id2]) ){ 
			$s = oci_parse($conn, "begin cs5226.PKG_DB_MON.PROC_SET_THRESHOLD(:paramid, :v1, :v2, :result); end;");
			oci_bind_by_name($s, ':paramid', $row[0]);
			oci_bind_by_name($s, ':v1', $_POST[$id1]);
			oci_bind_by_name($s, ':v2', $_POST[$id2]);
			oci_bind_by_name($s, ':result', $result,30);
			oci_execute($s);

		}

	}

	oci_free_statement($s);
	oci_free_statement($rc);
	oci_close($conn);
	
	header("Location: index.php#page=config");
		
}

function monitordata() {
	$conn = connect();
	$stid = oci_parse($conn, 'begin cs5226.PKG_DB_MON.PROC_RET_TABLES_TO_BE(:mtable); end;');
	$rc = oci_new_cursor($conn);
	oci_bind_by_name($stid, ':mtable', $rc, -1, OCI_B_CURSOR);
	oci_execute($stid);
	oci_execute($rc);
	//oci_fetch_all($rc, $res);
	while($row = oci_fetch_array($rc, OCI_ASSOC)) {
		foreach ($row as $c) {
			echo '<option value="'.$c.'">'.$c.'</option>';
		}
	}
	oci_free_statement($stid);
	oci_free_statement($rc);
	oci_close($conn);

}

function smonitordata(){
	$mdata = $_POST['mdata'];
	$conn = connect();
	$stmt = oci_parse($conn, "begin cs5226.PKG_DB_MON.PROC_CREATE_TABLES_TO_BE(:mdata,:sout); end;");
	oci_bind_by_name($stmt, ":mdata", $mdata);
	oci_bind_by_name($stmt, ':sout', $sout,30);
	oci_execute($stmt);
	oci_free_statement($stmt);
	oci_close($conn);
	echo $sout;
}

function debugquery() {

	$debugdata = $_POST['debugcd'];
	$conn = connect();
	$stmt = oci_parse($conn, "begin cs5226.PKG_DB_MON.PROC_EXEC_DEBUGGER(:dgdata, :result, :dbaffect); end;");
	$clob = oci_new_descriptor($conn, OCI_D_LOB);
	$rc = oci_new_cursor($conn);
	oci_bind_by_name($stmt, ':dgdata', $clob, -1, OCI_B_CLOB);
	oci_bind_by_name($stmt, ':result', $rc, -1, OCI_B_CURSOR);
	oci_bind_by_name($stmt, ':dbaffect', $dbout,50);
	$clob->WriteTemporary($debugdata);
	oci_execute($stmt, OCI_DEFAULT);
	oci_execute($rc);
	oci_commit($conn);
	oci_fetch_all($rc, $res);
	$clob->free();
	oci_free_statement($stmt);
	oci_free_statement($rc);
	oci_close($conn);
	
	if($dbout != NULL){
		$res["dout"] = $dbout;
	}
	echo json_encode($res);
	
}

function converttime($value,$unit){
	if($unit == "hr"){
		return ($value*60*60);			
	}else if($unit == "min"){
		return ($value*60);
	}
}

function  threshold () {

	$conn = connect();
	$s = oci_parse($conn, "begin cs5226.PKG_DB_MON.PROC_GET_THRESHOLD_ALL(:ret); end;");
	$rc = oci_new_cursor($conn);
	oci_bind_by_name($s, ':ret', $rc, -1, OCI_B_CURSOR);
	oci_execute($s);
	oci_execute($rc);
	
	while ($row = oci_fetch_row($rc)) {
	
		$data[$row[0]][0]=$row[1];
		$data[$row[0]][1]=$row[2];

	}

	oci_free_statement($s);
	oci_free_statement($rc);
	oci_close($conn);

	echo json_encode($data);

}


function query() {
	/*
	$conn = oci_connect('scott','oracle','//172.17.195.72:1521/CS5226'); 
	$query = 'select * from employee where salary > 10000'; 
	$stid = oci_parse($conn, $query); 
	$r = oci_execute($stid, OCI_DEFAULT);
	$data = array();
	while ($rows = oci_fetch_array($stid, OCI_ASSOC+OCI_RETURN_NULLS)){
		$data[] = $rows;
	}	
	echo json_encode( $data );
	oci_close($conn); */
	$conn = connect();
	/*
	$s = oci_parse($conn, "begin cs5226.PKG_DB_MON.PROC_GET_STAT_ALL(:ret); end;");



	$ret = oci_new_collection($conn, 'SNAP_DISP_OBJ');
	oci_bind_by_name($s, ':ret', $ret, -1, OCI_B_NTY);
	oci_execute($s);

	for ($i = 0; $i < $ret->size(); $i++) {
		$id = $ret->getElem($i);
	}
	oci_close($conn);
	*/


	$s = oci_parse($conn, "begin cs5226.PKG_DB_MON.PROC_GET_STAT_ALL(:ret); end;");
	$rc = oci_new_cursor($conn);
	oci_bind_by_name($s, ':ret', $rc, -1, OCI_B_CURSOR);
	oci_execute($s);
	oci_execute($rc);
	while ($row = oci_fetch_row($rc)) {
		if($row[1] != "NOT AVAILABLE"){
			$s = oci_parse($conn, "begin cs5226.PKG_DB_MON.PROC_GET_PARAM_NAME(:paramid, :retnm); end;");
			oci_bind_by_name($s, ':paramid', $row[0]);
			oci_bind_by_name($s, ':retnm', $pname,30);
			oci_execute($s);
			$row[2] = $pname;
			$data[] = $row;
		}
	}

	oci_free_statement($s);
	oci_free_statement($rc);
	oci_close($conn);

	echo json_encode($data);
}

function timedata(){
	$conn = connect();
	$stid = oci_parse($conn, 'begin cs5226.PKG_DB_MON.PROC_GET_XYZ(:xtime, :ytime, :ztime); end;');
	oci_bind_by_name($stid, ':xtime', $time[0],30);
	oci_bind_by_name($stid, ':ytime', $time[1],30);
	oci_bind_by_name($stid, ':ztime', $time[2],30);
	oci_execute($stid);

	oci_free_statement($stid);
	oci_close($conn);

	echo json_encode( $time );	

}

function awrdata(){

	$time1 = $_POST['t1'];
	$time2 = $_POST['t2'];
	$conn = connect();
	$stmt = oci_parse($conn, "begin cs5226.PKG_DB_MON.GET_AWR_TASK_REPORT(:time1, :time2, :report); end;");
	$clob = oci_new_descriptor($conn, OCI_D_LOB);
	oci_bind_by_name($stmt, ':time1', $time1);
	oci_bind_by_name($stmt, ':time2', $time2);
	oci_bind_by_name($stmt, ':report', $clob, -1, OCI_B_CLOB);
	
	oci_execute($stmt, OCI_DEFAULT);
	 
	echo txt2html($clob->load());

	$clob->free();
	oci_free_statement($stmt);
	
	oci_close($conn);
	
}


function stri_replace( $find, $replace, $string ) {

  $parts = explode( strtolower($find), strtolower($string) );

  $pos = 0;

  foreach( $parts as $key=>$part ){
    $parts[ $key ] = substr($string, $pos, strlen($part));
    $pos += strlen($part) + strlen($find);
  }

  return( join( $replace, $parts ) );
}


function txt2html($txt) {

  while( !( strpos($txt,'  ') === FALSE ) ) $txt = str_replace('  ',' ',$txt);
  $txt = str_replace(' >','>',$txt);
  $txt = str_replace('< ','<',$txt);

  $txt = htmlentities($txt);

  $txt = str_replace('&quot;','"',$txt);
  $txt = str_replace('&lt;','<',$txt);
  $txt = str_replace('&gt;','>',$txt);
  $txt = str_replace('&amp;','&',$txt);

  $txt = stri_replace("<a href=\"http://","<a target=\"_blank\" href=\"http://",$txt);
  $txt = stri_replace("<a href=http://","<a target=\"_blank\" href=http://",$txt);

  $eol = ( strpos($txt,"\r") === FALSE ) ? "\n" : "\r\n";
  $html = '<p>'.str_replace("$eol$eol","</p><p>",$txt).'</p>';
  $html = str_replace("$eol","<br />\n",$html);
  $html = str_replace("</p>","</p>\n\n",$html);
  $html = str_replace("<p></p>","<p>&nbsp;</p>",$html);

  $wipebr = Array("table","tr","td","blockquote","ul","ol","li");

  for($x = 0; $x < count($wipebr); $x++) {

    $tag = $wipebr[$x];
    $html = stri_replace("<$tag><br />","<$tag>",$html);
    $html = stri_replace("</$tag><br />","</$tag>",$html);

  }
  return $html;
}

function alertdata() {
	$conn = connect();
	$stmt = oci_parse($conn, "begin cs5226.PKG_DB_MON.GET_OUTSTANDING_ALERTS(:report); end;");
	$rc = oci_new_cursor($conn);
	oci_bind_by_name($stmt, ':report', $rc, -1, OCI_B_CURSOR);
	oci_execute($stmt);
	oci_execute($rc);
	while($row = oci_fetch_array($rc, OCI_ASSOC)) {
		
		if($row['REASON'] != "NO ALERTS"){
			echo '<div id="almsg"><div><span style="color:#AB072D">REASON:</span>'.$row['REASON'].'</div><div><span style="color:#AB072D">ACTION:</span>'.$row['SUGGESTED_ACTION'].'</div><div><span style="color:#AB072D">TYPE:</span>'.$row['MESSAGE_TYPE'].'</div></div>';
		}else{
			echo '<div id="noalr">  No Alerts !!! </div>';
		}
	}
	oci_free_statement($stmt);
	oci_free_statement($rc);
	oci_close($conn);
	
}

function oddata() {


	//$time2 = "08-04-2012 15:00:27";
	//$time1 = "08-04-2012 06:00:27";
	
	$time1 = $_POST['t1'];
	$time2 = $_POST['t2'];
	
	$conn = connect();
	
	$s = oci_parse($conn, "begin cs5226.PKG_DB_MON.PROC_GET_STAT_ALL(:ret); end;");
	$rc = oci_new_cursor($conn);
	oci_bind_by_name($s, ':ret', $rc, -1, OCI_B_CURSOR);
	oci_execute($s);
	oci_execute($rc);
	while ($row = oci_fetch_row($rc)) {
		if($row[1] != "NOT AVAILABLE"){
			$s = oci_parse($conn, "begin cs5226.PKG_DB_MON.PROC_GET_PARAM_NAME(:paramid, :retnm); end;");
			oci_bind_by_name($s, ':paramid', $row[0]);
			oci_bind_by_name($s, ':retnm', $pname,30);
			oci_execute($s);
			$id = $row[0];
			$param[$id] = $pname;
	
			$s = oci_parse($conn, "begin cs5226.PKG_DB_MON.PROC_GET_DETAIL_REPORT(:param,:time1,:time2,:ret); end;");
			$rc1 = oci_new_cursor($conn);
			oci_bind_by_name($s, ':ret', $rc1, -1, OCI_B_CURSOR);
			oci_bind_by_name($s, ':param', $id);
			oci_bind_by_name($s, ':time1', $time1);
			oci_bind_by_name($s, ':time2', $time2);
			oci_execute($s);
			oci_execute($rc1);
			$i = 0;
			$table[$id] = '<table border="1" cellpadding="2" cellspacing="2">';
			$table[$id] = $table[$id]. '<thead><tr><td width="100" align="center"><b>NO</b></td> <td width="200" align="center"><b>DATE</b></td><td width="200" align="center"><b>Value</b></td></tr></thead>';
			while ($row1 = oci_fetch_row($rc1)) {
				$table[$id] = $table[$id]."<tr>";
				$data[$id][$i] = $row1[1];
				$date[$id][$i] = $row1[0];
				$table[$id] = $table[$id]."<td width=\"100\" align=\"center\">$i</td><td width=\"200\" align=\"center\">$row1[0]</td><td width=\"200\" align=\"center\">$row1[1]</td>";
				$i++;
				$table[$id] = $table[$id]."</tr>";
			}
			$table[$id] = $table[$id]."</table>";
		}
	}
	
	$level = 1;

	$s = oci_parse($conn, "begin cs5226.PKG_DB_MON.PROC_GET_PARAM_DETAIL(:param,:level,:ret); end;");
	$rc2 = oci_new_cursor($conn);
	oci_bind_by_name($s, ':ret', $rc2, -1, OCI_B_CURSOR);
	oci_bind_by_name($s, ':param', $id);
	oci_bind_by_name($s, ':level', $level);
	oci_execute($s);
	oci_execute($rc2);
	
	
	while ($row2 = oci_fetch_row($rc2)) {
		
		$paramdata[$row2[0]][0]=$row2[1];
		$paramdata[$row2[0]][1]=$row2[2];

	}
	

	oci_free_statement($s);
	oci_free_statement($rc);
	oci_free_statement($rc1);
	oci_free_statement($rc2);
	oci_close($conn);
		
	foreach ($param as $id => $name) {		
		generateGraph($data[$id],$date[$id],$name,$id);	
	}
	
	generatePdf($param,$table,$paramdata);
	echo " Download the Report from <a href = './report/report.pdf' >here </a> \n <iframe src='./report/report.pdf#navpanes=0&toolbar=0&zoom=100' width='100%' height='500' ></iframe>";
}

function generateGraph($datay1,$date,$name,$id){

	require_once ('./media/jpgraph/src/jpgraph.php');
	require_once ('./media/jpgraph/src/jpgraph_line.php');

	$graph = new Graph(650,350);
	$graph->SetScale("textlin");

	$theme_class=new UniversalTheme;

	$graph->SetTheme($theme_class);
	$graph->img->SetAntiAliasing(false);
	$graph->title->Set($name);
	$graph->SetBox(false);

	$graph->img->SetAntiAliasing();

	$graph->yaxis->HideZeroLabel();
	$graph->yaxis->HideLine(false);
	$graph->yaxis->HideTicks(false,false);

	$graph->xgrid->Show();
	$graph->xgrid->SetLineStyle("solid");
	$graph->xaxis->SetTickLabels($date);
	$graph->xgrid->SetColor('#E3E3E3');

	// Create the first line
	$p1 = new LinePlot($datay1);
	$graph->Add($p1);
	$p1->SetColor("#6495ED");
	$p1->SetLegend('Line 1');

	$graph->legend->SetFrameWeight(1);

	$filename = "./report/".$id.".png";
	@unlink($filename); 
	$graph->Stroke($filename);

}


function generatePdf($param,$table,$paramdata) {

	require_once('./media/pdf/config/lang/eng.php');
	require_once('./media/pdf/tcpdf.php');

	$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
	// add a page
	$resolution= array(250, 350);
	
	$pdf->SetCreator(PDF_CREATOR);
	$pdf->SetAuthor('Nikil Vasudevan');
	$pdf->SetTitle('On Demand Report');
	$pdf->SetSubject('On Demand Report');
	$pdf->SetKeywords('On Demand Report');

	$pdf->SetPrintHeader(false);
	$pdf->SetPrintFooter(false);



	$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);


	$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
	$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
	$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);


	$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

	$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

	$pdf->setLanguageArray($l);

	$pdf->setFontSubsetting(true);

	$pdf->SetFont('dejavusans', '', 14, '', true);
	
	
	
	foreach ($param as $id => $name) {


		$pdf->AddPage('P', $resolution);

		$pdf->setJPEGQuality(100);
		
		$content =  $paramdata[$id][0] .":". $paramdata[$id][1] ;
		
		$pdf->Image('./report/'.$id.".png" , '','', '', '', '', '', '', true, 300);
		
		$pdf->SetY(120);
		
			
		//$pdf->writeHTML($content, true, false, false, false, '');
		
		$pdf->Write(0, $content, '', 0, 'J', true, 0, false, true, 0);
		$pdf->SetY(130);
		$pdf->SetFont('dejavusans', '', 10, '', true);
		$pdf->writeHTML($table[$id], true, false, false, false, '');
		$pdf->SetFont('dejavusans', '', 14, '', true);

	}

	//$pdf->writeHTMLCell($w=0, $h=0, $x='', $y='', $html, $border=0, $ln=1, $fill=0, $reseth=true, $align='', $autopadding=true);

	$pdf->Output('./report/report.pdf', 'F');

}

function login() {
	$usr = $_POST['usr'];
	$pass = $_POST['pass'];

	$conn = connect();
	
	if (!preg_match('/^[a-zA-Z0-9_]+$/',$usr)) {

		echo "fail here";

	}else {

		$s = oci_parse($conn, "begin cs5226.PKG_DB_MON.PROC_VALIDATE_LOGIN(:user, :pass, :result); end;");
		oci_bind_by_name($s, ':user', $usr);
		oci_bind_by_name($s, ':pass', $pass);
		oci_bind_by_name($s, ':result', $result,30);
		oci_execute($s);
		oci_free_statement($s);
		oci_close($conn);
		
		if($result == 'OK'){
			$hour = time() + 3600;
			setcookie("user", $usr, $hour);
			echo "success";
		}else{
			echo "fail";		
		}
	}
}

function analSchema() {
	$id = $_POST['id'];
	$conn = connect();
	$s = oci_parse($conn, "begin cs5226.PKG_DB_MON.PROC_ANALYZE_SCHEMA(:id, :result); end;");
	oci_bind_by_name($s, ':id', $id);
	oci_bind_by_name($s, ':result', $result,30);
	oci_execute($s);
	oci_free_statement($s);
	oci_close($conn);
	echo json_encode($result);
}

function helpindex() {
	$id = $_POST['id'];
	$conn = connect();
	if($id == -1){
		$s = oci_parse($conn, "begin cs5226.PKG_DB_MON.GET_HELP_LIST(:ret); end;");
		$rc = oci_new_cursor($conn);
		oci_bind_by_name($s, ':ret', $rc, -1, OCI_B_CURSOR);
		oci_execute($s);
		oci_execute($rc);
		while ($row = oci_fetch_row($rc)) {
			$data[] = $row;			
		}

		oci_free_statement($s);
		oci_free_statement($rc);
		oci_close($conn);

		echo json_encode($data);	
	}else{
		$stmt = oci_parse($conn, "begin cs5226.PKG_DB_MON.GET_HELP(:id, :name, :report); end;");
		$clob = oci_new_descriptor($conn, OCI_D_LOB);
		oci_bind_by_name($stmt, ':id', $id);
		oci_bind_by_name($stmt, ':name', $name,30);
		oci_bind_by_name($stmt, ':report', $clob, -1, OCI_B_CLOB);
		
		oci_execute($stmt, OCI_DEFAULT);
		 
		echo json_encode($clob->load());

		$clob->free();
		oci_free_statement($stmt);		
		oci_close($conn);	
	}
}

?>