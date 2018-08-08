
<?php
    date_default_timezone_set('Asia/Jakarta');
    //include"../session_popup.php";
    //
    //
    $bln = $_GET['bln'];
    $thn = $_GET['thn'];

    $blna = strtoupper(getBulan($bln)).' '.$thn;

	//Import the PhpJasperLibrary
	include_once('../PhpJasperLibrary/tcpdf/tcpdf.php');
	include_once("../PhpJasperLibrary/PHPJasperXML.inc.php");
	//database connection details
	include"../lib/config.php";

	//display errors should be off in the php.ini file
	ini_set('display_errors', 0);
	//error_reporting(E_ERROR | E_WARNING | E_PARSE | E_NOTICE);
	//setting the path to the created jrxml file
	$xml = simplexml_load_file("rpt_larisbrg_bulan.jrxml");
	$PHPJasperXML = new PHPJasperXML();
	//$PHPJasperXML->debugsql=true;
	//$PHPJasperXML->arrayParameter=array("![CDATA[$F{tb_penjualan_no_transaksi}]" => 'TR171200004');
	//$PHPJasperXML->arrayParameter=array("parameter1"=>2);
	$PHPJasperXML->arrayParameter=array('bln' => '"'.$bln.'"', 'thn' => '"'.$thn.'"', 'nama_usaha' => $HEAD['AD_NAMA_USAHA'], 'alamat_usaha' => $HEAD['AD_ALAMAT_USAHA'], 'blna' => $blna);
	$PHPJasperXML->xml_dismantle($xml);
	$PHPJasperXML->transferDBtoArray($server,$user,$pass,$db);

	ob_start();

	$PHPJasperXML->outpage("I");    //page output method I:standard output D:Download file
	ob_end_flush(); 
	
?>
