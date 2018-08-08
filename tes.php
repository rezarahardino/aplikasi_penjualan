<?php
	ini_set('memory_limit', '-1');
	ini_set('max_execution_time', 5000);

	include"lib/conn.php";



	$barang = mysql_query("SELECT * FROM tb_barang_lama");
	$no = 1;
	while ($b = mysql_fetch_assoc($barang)) {

		$hasilkode = 'BRG' . str_pad($no, 10, "0", STR_PAD_LEFT);

		mysql_query("INSERT INTO tb_barang (kode_barang, 
											nama_barang, 
											deskripsi, 
											tgl_input, 
											harga_beli, 
											kategori_id, 
											jml_stok, 
											satuan)
									VALUES('$hasilkode', 
											'$b[nama_barang]', 
											'$b[deskripsi]', 
											'$b[tgl_input]', 
											'$b[harga_beli]', 
											'$b[kategori_id]', 
											$b[jml_stok], 
											'$b[satuan]')") or die(mysql_error());

		mysql_query("INSERT INTO tb_barang_harga(kode_barang, 
												tipe, 
												harga, 
												tgl_input, 
												status) 
											VALUES('$hasilkode', 
													1, 
													'$b[harga_jual_1]', 
													NOW(),
													'Y')") or die(mysql_error());

		mysql_query("INSERT INTO tb_barang_harga(kode_barang, 
												tipe, 
												harga, 
												tgl_input, 
												status) 
											VALUES('$hasilkode', 
													2, 
													'$b[harga_jual_2]', 
													NOW(), 
													'Y')") or die(mysql_error());

		mysql_query("INSERT INTO tb_barang_harga(kode_barang, 
												tipe, 
												harga, 
												tgl_input, 
												status) 
											VALUES('$hasilkode', 
													3, 
													'$b[harga_jual_3]', 
													NOW(), 
													'Y')") or die(mysql_error());

		$no++;
	}

?>