<?php
session_start();
error_reporting(0);
include('includes/dbconnection.php');

// For techaer
if(!empty($_POST["courseid"])) 
{
$courseid=$_POST["courseid"];
$sql=$dbh->prepare("SELECT * FROM tblteacher WHERE CourseID=:courseid");
$sql->bindParam(':courseid',$courseid,PDO::PARAM_STR);
$sql->execute();
$results=$sql->fetchAll(PDO::FETCH_OBJ);
?>
<option value="">Select Teacher</option>
<?php
foreach($results as $row)
{ 
?>
<option value="<?php  echo htmlentities($row->EmpID);?>"><?php  echo htmlentities($row->FirstName);?> <?php  echo htmlentities($row->LastName);?>(<?php  echo htmlentities($row->EmpID);?>)</option><?php }}

//For Subject
if(!empty($_POST["sid"])) 
{
$cid=$_POST["sid"];
$query=$dbh->prepare("SELECT * FROM tblsubject WHERE semesterid=:cid");
$query->bindParam(':cid',$cid,PDO::PARAM_STR);
$query->execute();
$resultss=$query->fetchAll(PDO::FETCH_OBJ);


?>
<option value="">Select Subject</option>
<?php
foreach($resultss as $rows)
{ 
?>
<option value="<?php  echo $rows->ID;?>"><?php  echo htmlentities($rows->SubjectShortname." ".$rows->SubjectCode." ".$rows->SubjectFullname);?></option><?php }}




?>
 
