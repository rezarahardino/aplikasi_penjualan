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

	if($mod == "returpembelian" AND $act == "simpan")
	{

		$resCekRetur = mysql_query("SELECT * FROM tb_detail_pembelian 
									WHERE no_faktur ='$_POST[no_faktur]' 
									AND kode_barang = '$_POST[barang]'");
		if (mysql_num_rows($resCekRetur) > 0) {
			$r = mysql_fetch_assoc($resCekRetur);

			if($_POST['qty'] <= $r['qty'])
			{
				$q = mysql_query("SELECT MAX(RIGHT(nomor_retur,7)) AS noauto
						FROM tb_retur_pembelian") or die(mysql_error());
				$kode = mysql_fetch_assoc($q);

				if($kode['noauto'] <> NULL)
				{
					$nilaikode = $kode['noauto'];
		            $kode = (int) $nilaikode;

		            $kode = $kode + 1;

		            $nomor_retur = 'RPB' . str_pad($kode, 7, "0", STR_PAD_LEFT);
				}
				else
				{
					$nomor_retur = "RPB" . "0000001";
				}

				$resSimpan = mysql_query("INSERT INTO tb_retur_pembelian(no_faktur, 
															kode_barang, 
															nomor_retur, 
															harga_beli, 
															qty, 
															petugas, 
															keterangan, 
															timestmp)
													VALUES('$_POST[no_faktur]', 
															'$_POST[barang]', 
															'$nomor_retur', 
															$r[harga_beli], 
															$_POST[qty], 
															'$_SESSION[login_id]', 
															'$_POST[keterangan]', 
															NOW())");

				if(!$resSimpan)
				{
					flash('example_message', '<p>Barang sudah pernah di retur.</p>', 'w3-red' );
					echo"<script>
						window.history.back();
					</script>";	
					//echo"Barang sudah pernah di retur!";
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
				flash('example_message', '<p>Jumal barang tidak sesuai.</p>', 'w3-yellow' );
				echo"<script>
					window.history.back();
				</script>";	
				//echo"Jumlah barang tidak sesuai...";
			}

		}
		else
		{
			flash('example_message', '<p>Tidak ditemukan transaksi dan kode barang.</p>', 'w3-yellow' );
			echo"<script>
				window.history.back();
			</script>";	
			//echo"Tidak ditemukan transaksi dan kode barang...";
		}

	}

	elseif ($mod == "returpembelian" AND $act == "hapus") {
		mysql_query("DELETE FROM tb_retur_pembelian 
			WHERE no_faktur = '$_GET[id]' AND kode_barang = '$_GET[kode]'") or die(mysql_error());
		flash('example_message', '<p>Berhasil menghapus data transaksi.</p>' );
		echo"<script>
			window.history.back();
		</script>";	
	}
?>