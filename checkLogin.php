<?php
//��ʼ��session
session_start();
// ����Ѿ���¼����ֱ���˳�
if(isset($_SESSION['user'])) {
	//�ض��򵽹�������
	header("Location:browse.php");
	// ��¼���Ļ�����������
   exit;
}
require ('dbconnect.php');
// ��ò���
$nickname=$_POST['username'];
$password=$_POST['password'];
$passwords=md5($password);

// ����ʺź������Ƿ���ȷ,
$sql="select * from user where id='$nickname' and password='$passwords'";
$re=mysqli_query($conn,$sql);
$result=mysqli_fetch_array($re);
// ����û���¼��ȷ
if( !empty($result)) {
	// ���浱ǰ�Ự�û����ǳ�
    $_SESSION['user'] = $nickname;

	// ��¼�ɹ��ض��򵽹���ҳ��
	header("Location:browse.php");
}
else { 
	// ����ͷ�ļ�
	include('head.php');
    // ����Ա��¼ʧ��
	echo "<table width='100%' align=center><tr><td align=center>";
	echo "�û�ID���������<br>";
    echo "<font color=red>��¼ʧ�ܣ�</font><br><a href='login.php'>������</a>";
    echo "</td></tr></table>";
}
?>

