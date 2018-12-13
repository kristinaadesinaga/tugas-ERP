<div class="row">
  <div class="col-md-12">
    <center>
    <h2>Inventory Barang Serbaguna.com</h2>   
    
  </div>
</div></center>
<hr /><center>
<h3>Welcome to Inventory Barang serbaguna.com </h3></center><br><br><br><br><br>
<?php  
	$penjualan = $dashboard->penjualan_hariini();
	$pembelian = $dashboard->pembelian_hariini();
?>
<center>
	<div class="col-md-25 col-sm-15 col-xs-15">           
		<div class="panel panel-back noti-box">
            
                <i class="fa fa-download"></i>
            </span>
        	<div class="text-box" >
                <p class="main-text"><?php echo $pembelian; ?> New</p>
                <p class="text-muted">Pembelian Hari Ini</p>
            </div>
        </div>
	</div>
</div></center>