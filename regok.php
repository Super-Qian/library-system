<?php
//��ʼ��session
session_start();
// �������ݿ������ļ���ͷ�ļ�
require ('dbconnect.php');
include ('head.php');
?>
<?php
// �ж���֤��
$verfy = $_POST['verify'];
if ($verfy != $_SESSION['verfyCode']){
    header("Location:regtest.php");
    exit();
}
// ȡ����ҳ�Ĳ���
$name=$_POST['name'];
$password=$_POST['password'];
$email=$_POST['email'];
$tel=$_POST['tel'];
$address=$_POST['address'];

// ��������
$password=md5($password);

// �������ݿ⣬ע���û�
$sql="insert into user(name, password, email, tel, address) values('$name','$password','$email', '$tel','$address')";
mysqli_query($conn,$sql) or die ("ע���û�ʧ��: ".mysqli_error());

// ���ע���û����Զ�id���Ժ�ʹ�ô�id�ſɵ�¼
$result=mysqli_query($conn,"select last_insert_id()");
$re_arr=mysqli_fetch_array($result);
$id=$re_arr[0];

// ע��ɹ����Զ���¼��ע��session����
$_SESSION['user'] = $id;
echo "<table align=center><tr><td align=center>ע��ɹ���</td></tr>";
echo "<tr><td align=center><font color=red>����ע��id�ǣ�".$id;
echo "��������ס���Ժ��ô�id��¼��</font></td></tr></table>";

?>
