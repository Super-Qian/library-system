<?
//��ʼ��session
session_start();
include ('head.php');
require ('dbconnect.php');
// ���û�е�¼���˳�
if(!isset($_SESSION['Adm'])) {
   echo "<p align=center>";
   echo "<font color=#FF0000 size=5><strong><big>";
   echo "����Աû�е�¼,��<a href='AdminLogin.php'>��¼</a>!";
   echo "</big></strong></font></p>";
   exit();
}
?>

<?
	$return=$_POST['return'];
	$renew=$_POST['renew'];
	$user_id=$_POST['user_id'];
	$book_id=$_POST['book_id'];	
    $bookbox = $_POST['bookbox'];
	// ����
	if (isset($_POST['return'])){
		// �鿴��Щ�鱾��Ҫ�黹
		for($i=0;$i<count($bookbox);$i++){
			// �����bookû��ѡ�ϣ�ִ����һѭ��
			if ($bookbox[$i]==""){
				next;
			}
			else {
				$book_id=$bookbox[$i];
				// ����sql��仹��
				// ��lend����ɾ���ý����¼
				$returnsql="delete from lend where book_id='$book_id' and user_id='$user_id'";
				mysqli_query($conn,$returnsql) or die ("ɾ�������¼ʧ�ܣ�".mysqli_error());
				// ��lend_log���м�¼����ʱ��
				// ��õ�ǰ����
				$now = date("Y-m-d");
				$logsql="update lend_log set return_time='$now' where book_id='$book_id' and user_id='$user_id'";
				mysqli_query($conn,$logsql) or die ("��¼����ʱ��ʧ�ܣ�".mysqli_error());
				// ��book��������һ���ִ�������
				$booksql="update book set leave_number=leave_number+1 where id='$book_id'";
				mysqli_query($conn,$booksql) or die ("����ʣ��������ʧ�ܣ�".mysqli_error());
				?>
				<p align="center">&nbsp;</p>
				<p align="center">&nbsp;</p>
				<p align="center"><font color="red">����Ǽ���ɣ�</p>
				<?
			}
		}
	}
	// ����
	if (isset($_POST['renew'])){
		// �鿴��Щ�鱾��Ҫ�黹
		for($i=0;$i<count($bookbox);$i++){
			// �����bookû��ѡ�ϣ�ִ����һѭ��
			if ($bookbox[$i]==""){
				next;
			}
			else {
				$book_id=$bookbox[$i];
				// ��õ�ǰ����
				$now = date("Y-m-d");
				// ����sql�������
				// ����ֻ��Ҫ��lend������������ʱ�����
				$renewsql="update lend set renew_time='$now' where book_id='$book_id' and user_id='$user_id'";
				mysqli_query($conn,$renewsql) or die ("����ʧ�ܣ�".mysqli_error());
				?>
				<p align="center">&nbsp;</p>
				<p align="center">&nbsp;</p>
				<p align="center"><font color="red">������ɣ�</p>
				<?
			}
		}
	}
?>
