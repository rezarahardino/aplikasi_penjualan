<?php
	date_default_timezone_set("Asia/Jakarta");

	$tgl = trim($_GET['tgl']);

	error_reporting(0);
?>
<h4 class="w3-text-blue" style="padding-bottom:0;margin-bottom:0;"><b><?php echo isset($HEAD['AD_NAMA_USAHA']) ? $HEAD['AD_NAMA_USAHA'] : 'NAMA USAHA ANDA'; ?></b></h4>
<div class="w3-row">
	<div class="w3-col s6 w3-tiny"><?php echo isset($HEAD['AD_ALAMAT_USAHA']) ? $HEAD['AD_ALAMAT_USAHA'] : 'ALAMAT USAHA ANDA'; ?><br>
		Telp./HP <?php echo isset($HEAD['AD_NOMOR_HP']) ? $HEAD['AD_NOMOR_HP'] : 'ALAMAT USAHA ANDA'; ?>
	</div>
	<div class="w3-col s6 w3-tiny">
		&nbsp;
	</div>
</div>
<div style="border-bottom:3px solid #ccc;"></div>
<center><h5>LAPORAN PEMBELIAN PER-SUPPLIER<br>
			<small>TANGGAL : <b><?php echo date('d-m-Y', strtotime($tgl)); ?></b></small></h5>
</center>


<?php

echo"<table class='w3-table w3-striped w3-bordered w3-tiny w3-hoverable'>
	<thead>
		<tr class='w3-grey'>
						<th>NO</th>
						<th>NO. FAKTUR</th>
						<th>NAMA TOKO</th>
						
						<th>TANGGAL BELI</th>
						<th>NAMA KASIR</th>
						<th>PETUGAS</th>
						<th>TOTAL</th>
						
		</tr>
	</thead>
	<tbody>";

	

				$query = "SELECT * FROM tb_pembelian WHERE tgl_beli = '$tgl' 
						AND kode_supplier = '$_GET[sp]' ORDER BY tgl_beli DESC";
				

				$sql_kul = mysql_query($query);
				$fd_kul = mysql_num_rows($sql_kul);

				if($fd_kul > 0)
				{

					
					$tunai = 0;
					$hutang = 0;
					$no = 1;
					$total = 0;
					while ($m = mysql_fetch_assoc($sql_kul)) {
						$sub_total = $m['total_pembelian'] + $m['total_pembelian'];

					    $total = $total_pembelian + $sub_total;

					    $grand_total = total_pembelian($m['no_faktur']) * 5;
						echo"<tr>
						
							<td>$no</td>
							<td>$m[no_faktur]</td>
							<td>$m[nama_toko]</td>
							
							<td>$m[tgl_beli]</td>
							<td>$m[nama_kasir]</td>
							<td>".nama_petugas($m['petugas'])."</td>
							<td>".total_pembelian($m['no_faktur'])."</td>							
						
						</tr>";
							$total += $m['total'];
						$no++;
					}
	
                }
                //$total = $total_pembelian ++;
		
				

				echo"</tbody>

</table>";


?>

<br>
<div class="w3-row-padding w3-tiny">
	<div class="w3-col s4 w3-center">
		<br>
		<p>Karyawan Toko,</p>
		<br>
		<br>

		<p>( _________________________ )</p>
	</div>

	<div class="w3-col s4">
		&nbsp;

	</div>

	<div class="w3-col s4 w3-center">
		<p>Jakarta, <?php echo tglindo(date('Y-m-d')); ?>
		<br>Pemilik Toko,</p>
		<br>
		<br>

		<p>(<u> KOH LIEM </u>)</p>
	</div>

</div>