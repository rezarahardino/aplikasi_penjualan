<link rel="stylesheet" type="text/css" href="../../css/pace.css">
<script src="../../js/pace.min.js"></script>
<?php
	date_default_timezone_set('Asia/Jakarta');
	session_start();
	include"../../lib/conn.php";
	include"../../lib/all_function.php";
	include"../../lib/fungsi_transaction.php";


	if(!isset($_SESSION['login_user'])){
		header('location: ../../login.php'); // Mengarahkan ke Home Page
	}

	if(isset($_GET['mod']) && isset($_GET['act']))
	{
		$mod = $_GET['mod'];
		$act = $_GET['act'];
	}
	else
	{
		$mod = "";
		$act = "";
	}

	if($mod == "returpenjualan" AND $act == "simpan")
	{

		$resCekRetur = mysql_query("SELECT * FROM tb_detail_penjualan 
									WHERE no_transaksi ='$_POST[no_transaksi]' 
									AND kode_barang = '$_POST[barang]'");
		if (mysql_num_rows($resCekRetur) > 0) {
			$r = mysql_fetch_assoc($resCekRetur);

			if($_POST['qty'] <= $r['qty'])
			{
				$q = mysql_query("SELECT MAX(RIGHT(nomor_retur,7)) AS noauto
						FROM tb_retur_penjualan") or die(mysql_error());
				$kode = mysql_fetch_assoc($q);

				if($kode['noauto'] <> NULL)
				{
					$nilaikode = $kode['noauto'];
		            $kode = (int) $nilaikode;

		            $kode = $kode + 1;

		            $nomor_retur = 'RPJ' . str_pad($kode, 7, "0", STR_PAD_LEFT);
				}
				else
				{
					$nomor_retur = "RPJ" . "0000001";
				}

				$resSimpan = mysql_query("INSERT INTO tb_retur_penjualan(no_transaksi, 
															kode_barang, 
															nomor_retur, 
															qty, 
															harga, 
															disc, 
															petugas, 
															keterangan, 
															timestmp)
													VALUES('$_POST[no_transaksi]', 
															'$_POST[barang]', 
															'$nomor_retur', 
															$_POST[qty], 
															$r[harga], 
															$r[disc], 
															'$_SESSION[login_id]', 
															'$_POST[keterangan]', 
															NOW())");

				if(!$resSimpan)
				{
					flash('example_message', '<p>Barang sudah di retur.</p>', 'w3-red' );
					echo"<script>
						window.history.back();
					</script>";	
					//echo"Barang sudah di retur!";
				}
				else
				{
					flash('example_message', '<p>Retur barang berhasil di simpan.</p>' );
					echo"<script>
						window.history.back();
					</script>";	
					//echo"Berhasil retur barang";
				}
			}
			else
			{
				flash('example_message', '<p>Retur barang berhasil di simpan.</p>', 'w3-yellow' );
				echo"<script>
					window.history.back();
				</script>";	
				//echo"Jumlah barang tidak sesuai...";
			}

		}
		else
		{
			flash('example_message', '<p>Tidak ditemukan barang yang di retur di transaksi.</p>', 'w3-yellow' );
			echo"<script>
				window.history.back();
			</script>";	
			//echo"Tidak ditemukan transaksi dan kode barang...";
		}

	}

	elseif ($mod == "returpenjualan" AND $act == "hapus") {
		mysql_query("DELETE FROM tb_retur_penjualan 
			WHERE no_transaksi = '$_GET[id]' AND kode_barang = '$_GET[kode]'") or die(mysql_error());
		flash('example_message', '<p>Berhasil menghapus data transaksi.</p>' );
		echo"<script>
			window.history.back();
		</script>";	
	}
?>