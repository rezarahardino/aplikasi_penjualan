<?php
  include"../session_popup.php";
?>
<!DOCTYPE html>
<html>
<head>
    <!--<title>.:: Cetak Laporan ::.</title>-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="../favicon.ico" />

    <link rel="stylesheet" href="../css/w3.css">
    <link rel="stylesheet" href="../css/font-awesome.min.css">
    <link rel="stylesheet" href="../js/jquery-ui/jquery-ui.css">
    
    <style>
    .w3-theme {color:#fff !important;background-color:#4CAF50 !important;}
    .w3-btn {background-color:#4CAF50 ;margin-bottom:4px;}
    .w3-code{border-left:4px solid #4CAF50}
    @media only screen and (max-width: 601px) {.w3-top{position:static;} #main{margin-top:0px !important}}


    .tbl th.header { 
        background-image: url(../js/table.sorter/themes/blue/bg.gif);
        cursor: pointer; 
        font-weight: bold; 
        background-repeat: no-repeat; 
        background-position: center left; 
        padding-left: 20px; 
        margin-left: -1px; 
    }

    .tbl th.headerSortUp { 
      background-image: url(../js/table.sorter/themes/blue/asc.gif);
      cursor: pointer; 
        font-weight: bold; 
        background-repeat: no-repeat; 
        background-position: center left; 
        padding-left: 20px; 
        margin-left: -1px; 

    } 
    .tbl th.headerSortDown { 
      background-image: url(../js/table.sorter/themes/blue/desc.gif);
      cursor: pointer; 
        font-weight: bold; 
        background-repeat: no-repeat; 
        background-position: center left; 
        padding-left: 20px; 
        margin-left: -1px; 
    } 
    .ui-datepicker {
        font-family: "Trebuchet MS", "Helvetica", "Arial",  "Verdana", "sans-serif";
        font-size: 80.5%;
    }
    .ui-tooltip-content {
        font-size: 80.5%;
    }
    </style>
    <script src="../js/jquery-1.12.2.min.js"></script>
    <script src="../js/jquery-ui/jquery-ui.js"></script>
    <script src="../js/jquery.maskedinput.min.js"></script>
    <script src="../js/jquery.number.js"></script>
    <script src="../js/infusion-jquery/jquery.webcam.js"></script>
    <script src="../js/w3codecolors.js"></script>
    <script src="../js/jquery.freezeheader.js"></script>


    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            $("#table1").freezeHeader();
            /*$("#table1").freezeHeader({ 'height': '300px' });
            $("#table2").freezeHeader();
                
            $("#tbex1").freezeHeader();
            $("#tbex2").freezeHeader();
            $("#tbex3").freezeHeader();
            $("#tbex4").freezeHeader();*/
                
        });
    </script>
</head>
<body>
    <div class="w3-container">
    <?php
        include"../lib/fungsi_indotgl.php";
        include"../lib/fungsi_terbilang.php";
        include"../lib/all_function.php";
        
        if ($_GET['mod'] == "cetakkwitansi") {
            include"cetak_kwitansi.php";
        }
        elseif ($_GET['mod'] == "cetakbarang") {
            include"cetak_barang.php";
        }
		elseif ($_GET['mod'] == "cetakstok") {
            include"cetak_stok.php";
            
        }
        elseif ($_GET['mod'] == "lapblperiode") {
            if (isset($_GET['act']) AND ($_GET['act'] == 'pdf')) {
                include("cetak_bl_periode_pdf.php");
            } else {
                include"cetak_bl_periode.php";  
            }
            
        }
        elseif ($_GET['mod'] == "lappjperiode") {
            if (isset($_GET['act']) AND ($_GET['act'] == 'pdf')) {
                include("cetak_pj_periode_pdf.php");
            } else {
                include"cetak_pj_periode.php";
            }
        }
        
        elseif ($_GET['mod'] == "lappjtahunan") {
            include"cetak_pj_tahunan.php";
        }
        elseif ($_GET['mod'] == "lappjperhari") {
            include"cetak_pj_perhari.php";
        }
        elseif ($_GET['mod'] == "lapksperhari") {
            include"cetak_ks_perhari.php";
        }
        elseif ($_GET['mod'] == "lappjbarangperperiode") {
            include"cetak_pj_barang_perperiode.php";
        }
        elseif ($_GET['mod'] == "laphutangperhari") {
            include"cetak_hutang_perhari.php";
        }
        elseif ($_GET['mod'] == "laphutangperperiode") {
            include"cetak_hutang_perperiode.php";
        } elseif ($_GET['mod'] == "laplarisbrgbln") {
            if (isset($_GET['act']) AND ($_GET['act'] == 'pdf')) {
                include("cetak_larisbrg_bln_pdf.php");
            } else {
                include"cetak_larisbrg_bln.php";
            }
        } elseif ($_GET['mod'] == "lapjthtempo") {
            if (isset($_GET['act']) AND ($_GET['act'] == 'pdf')) {
                include("cetak_lap_jthtempo_pdf.php");
            } else {
                include"cetak_lap_jthtempo.php";
            }
        } elseif ($_GET['mod'] == "pjperkonsumen") {
            if (isset($_GET['act']) AND ($_GET['act'] == 'pdf')) {
                include("cetak_pj_perkonsumen_pdf.php");
            } else {
                include"cetak_pj_perkonsumen.php";
            }
        } elseif ($_GET['mod'] == "blpersupplier") {
            if (isset($_GET['act']) AND ($_GET['act'] == 'pdf')) {
                include("cetak_bl_persupplier_pdf.php");
            } else {
                include"cetak_bl_persupplier.php";
            }
        }

    ?>
    </div>

</body>
</html>