<!DOCTYPE html>
<html >
  <head>
    <meta charset="">
    <title>Inventory Login</title>
    <link rel="stylesheet" href="">
    <meta charset="UTF-8">
    <script src=""></script>
  </head>
  <body>
    <center>
    <br>
    <br><br><br>
    <div id="logo"> 
      <h1><i>INVENTORY BARANG SERBA GUNA</i></h1>
    </div> 
  <section class="stark-login">
    <form method="POST">	
      <div id="fade-box">
        <input type="text" name="username" id="username" placeholder="Masukan Email" required><br><br>
        <input type="password" name="password" placeholder="Masukan Password" required><br><br>
        <button name="login">Log In</button> 
      </div>
    </form>
        <div class="hexagons">
        </div>      
  </section> 
  <div id="circle1">
    <div id="inner-cirlce1">
      <h2></h2>
    </div>
  </div>
    <script src="js/index.js"></script>
  </body>
</html>
<?php  
include "../class/class.php";
  if (isset($_POST['login'])) {
    $cek = $admin->login_admin($_POST['username'],$_POST['password']);
    if ($cek == true) {
      echo "<script>window.location='../index.php';</script>";
    }//jika salah atau tidak benar maka login ulang
    else{
      echo "<script>alert('Login Gagal, Password / Email Salah!');</script>";
    }
  }
?>
