<?php
//初始化session
session_start();
// 包含数据库连接文件和头文件
require ('dbconnect.php');
include ('head.php');
?>
<?php
// 判断验证码
$verfy = $_POST['verify'];
if ($verfy != $_SESSION['verfyCode']){
    header("Location:regtest.php");
    exit();
}
// 取得网页的参数
$name=$_POST['name'];
$password=$_POST['password'];
$email=$_POST['email'];
$tel=$_POST['tel'];
$address=$_POST['address'];

// 加密密码
$password=md5($password);

// 连接数据库，注册用户
$sql="insert into user(name, password, email, tel, address) values('$name','$password','$email', '$tel','$address')";
mysqli_query($conn,$sql) or die ("注册用户失败: ".mysqli_error());

// 获得注册用户的自动id，以后使用此id才可登录
$result=mysqli_query($conn,"select last_insert_id()");
$re_arr=mysqli_fetch_array($result);
$id=$re_arr[0];

// 注册成功，自动登录，注册session变量
$_SESSION['user'] = $id;
echo "<table align=center><tr><td align=center>注册成功！</td></tr>";
echo "<tr><td align=center><font color=red>您的注册id是：".$id;
echo "，请您记住，以后用此id登录！</font></td></tr></table>";

?>
