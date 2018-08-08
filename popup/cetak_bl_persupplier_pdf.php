
<?php
    date_default_timezone_set('Asia/Jakarta');
    //include"../session_popup.php";
    //
    //
    $tgl = $_GET['tgl'];
    $sp = $_GET['sp'];

    $tgla = tglindo_garing($tgl);
    $tgl_cetak = date('d/m/Y');

	//Import the PhpJasperLibrary
	include_once('../PhpJasperLibrary/tcpdf/tcpdf.php');
	include_once("../PhpJasperLibrary/PHPJasperXML.inc.php");
	//database connection details
	include"../lib/config.php";

	//display errors should be off in the php.ini file
	ini_set('display_errors', 0);
	//error_reporting(E_ERROR | E_WARNING | E_PARSE | E_NOTICE);
	//setting the path to the created jrxml file
	$xml = simplexml_load_file("rpt_bl_perkonsumen.jrxml");
	$PHPJasperXML = new PHPJasperXML();
	//$PHPJasperXML->debugsql=true;
	//$PHPJasperXML->arrayParameter=array("![CDATA[$F{tb_penjualan_no_transaksi}]" => 'TR171200004');
	//$PHPJasperXML->arrayParameter=array("parameter1"=>2);
	$PHPJasperXML->arrayParameter=array('tgl' => '"'.$tgl.'"', 'sp' => '"'.$sp.'"', 'nama_usaha' => $HEAD['AD_NAMA_USAHA'], 'alamat_usaha' => $HEAD['AD_ALAMAT_USAHA'], 'tgla' => $tgla, 'tgl_cetak' => $tgl_cetak);
	$PHPJasperXML->xml_dismantle($xml);
	$PHPJasperXML->transferDBtoArray($server,$user,$pass,$db);

	ob_start();

	$PHPJasperXML->outpage("I");    //page output method I:standard output D:Download file
	ob_end_flush(); 
	
?>
