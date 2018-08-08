<?php
	$target_dir = "C:\xampp\htdocs\apspenjualan\Debug";
	chdir($target_dir);

	$target_file = "PJ_SparePart.exe";

	exit((shell_exec($target_file)!=NULL?'SUKSES':'GAGAL'));
?>