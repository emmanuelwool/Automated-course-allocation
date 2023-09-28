<?php
session_start();
//error_reporting(0);
include('includes/dbconnection.php');
if (strlen($_SESSION['tsasaid']==0)) {
  header('location:logout.php');
  } else{
    if(isset($_POST['submit']))
  {

$tsasaid=$_SESSION['tsasaid'];
 $cid=$_POST['sidd'];
 $teacherid=$_POST['eid'];
 $subject=$_POST['subject'];
 $start=$_POST['sstart'];
 $end=$_POST['send'];
 

$sql="insert into tblsuballocation(Teacherempid,Subid,session_start,session_end,semesterid)values(:teacherid,:subject,:sstart,:send,:cid)";
$query=$dbh->prepare($sql);
$query->bindParam(':teacherid',$teacherid,PDO::PARAM_STR);
$query->bindParam(':subject',$subject,PDO::PARAM_STR);
$query->bindParam(':sstart',$start,PDO::PARAM_STR);
$query->bindParam(':send',$end,PDO::PARAM_STR);
$query->bindParam(':cid',$cid,PDO::PARAM_STR);
 $query->execute();

   $LastInsertId=$dbh->lastInsertId();
   if ($LastInsertId>0) {
    echo '<script>alert("Subject allocation has been done.")</script>';
echo "<script>window.location.href ='subject-allocation.php'</script>";
  }
  else
    {
         echo '<script>alert("Something Went Wrong. Please try again")</script>';
    }

  
}
// Code for deleting product from cart
if(isset($_GET['delid']))
{
$rid=intval($_GET['delid']);
$sql="delete from tblsuballocation where ID=:rid";
$query=$dbh->prepare($sql);
$query->bindParam(':rid',$rid,PDO::PARAM_STR);
$query->execute();
 echo "<script>alert('Data deleted');</script>"; 
  echo "<script>window.location.href = 'subject-allocation.php'</script>";     


}

?>
<!DOCTYPE html>
<html lang="en">

<head>
   
    <title>TSAS : Subject Allocation</title>

       <!-- Styles -->
    <link href="../assets/css/lib/font-awesome.min.css" rel="stylesheet">
    <link href="../assets/css/lib/themify-icons.css" rel="stylesheet">
    <link href="../assets/css/lib/menubar/sidebar.css" rel="stylesheet">
    <link href="../assets/css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/css/lib/unix.css" rel="stylesheet">
    <link href="../assets/css/style.css" rel="stylesheet">
    <script src="../js/jquery-1.9.1.min.js"></script>
    <script>
/*function getteacher(val) {
$.ajax({
type: "POST",
url: "get_teacher.php",
data:'stid='+val,
success: function(data){
$("#teachereid").html(data);
}
});

$.ajax({
        type: "POST",
        url: "get_teacher.php",
        data:'sid='+val,
        success: function(data){
        $("#subject").html(data); 
        }
        });


}
*/
</script>

<script>
  $(document).ready(function(){

    $('#sid').change(function(){ 
        
var display = $("#sid option:selected").val();
$.ajax({
        method:"POST",
        url:"get_teacher.php",
        
        data:{sid:display},
       
        success:function(data){
           $("#subject").html(data);
        }
        
       });
   });
 });
</script>

</head>

<body>
<?php include_once('includes/sidebar.php');?>
   
    <?php include_once('includes/header.php');?>
    <div class="content-wrap">
        <div class="main">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8 p-r-0 title-margin-right">
                        <div class="page-header">
                            <div class="page-title col-lg-4">
                                <h1 >Subject Allocation</h1> 
                            </div>
                          <a href="allocate">  <button class="btn btn-primary  col-lg-2 m-4 py-4"> Allocate</button></a>
                        </div>
                    </div>
                    <!-- /# column -->
                    <div class="col-lg-4 p-l-0 title-margin-left">
                        <div class="page-header">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="dashboard.php">Dashboard</a></li>
                                    <li class="active">Subject Allocation</li> 
                                </ol>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                <div id="main-content">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="card alert">
                                <div class="card-header pr">
                                    <h4>Subject Allocation</h4>
                                    <form method="post" name="hjhgh">


                                    


                                        <div class="basic-form m-t-20">
                                            <div class="form-group">
                                                <label>Semester</label>
  <select class="form-control border-none input-flat bg-ash" name="sidd" id="sid"  required="true">
            <option value="">Select Semester</option>
            <?php
$sql="SELECT * from semesters";
$query = $dbh -> prepare($sql);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);

$cnt=1;
if($query->rowCount() > 0)
{
foreach($results as $row)
{               ?>
            <option value="<?php echo $row->semesterid;?>"><?php if($row->name==1){ echo "1st Semester";}else{ echo "2nd Semester";};?></option><?php $cnt=$cnt+1;}} ?>
        </select>
        
                                            </div>
                                        </div>


                                        <div class="basic-form m-t-20">
                                            <div class="form-group">
                                                <label>Teacher</label>
  <select class="form-control border-none input-flat bg-ash" name="eid" id="eid" onChange="getteacher(this.value);" required="true">
            <option value="">Select Teacher</option>
            <?php
$sql="SELECT * from tblteacher";
$query = $dbh -> prepare($sql);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);

$cnt=1;
if($query->rowCount() > 0)
{
foreach($results as $row)
{               ?>
            <option value="<?php  echo htmlentities($row->EmpID);?>"><?php  echo ($row->FirstName." ".$row->LastName);?></option><?php $cnt=$cnt+1;}} ?>
        </select>
        
                                            </div>
                                        </div>



                                      



<div class="basic-form m-t-20">
 <div class="form-group">
 <label>Subject</label>
<select class="form-control border-none input-flat bg-ash" name="subject" id="subject" required="true">
</select>
</div>
</div>

<div class="basic-form m-t-20">
 <div class="form-group">
 <label>Session Start</label>
<input type="date" name="sstart">
</div>
</div>

<div class="basic-form m-t-20">
 <div class="form-group" id="exampleFormControlInput1">
 <label>Session Start</label>
<input type="date" name="send">
</div>
</div>

                                        
                                       
                                   
                                </div>
                                <button class="btn btn-default btn-lg m-b-10 bg-warning border-none m-r-5 sbmt-btn" onclick="myFunction()" type="submit" name="submit">Save</button>
                                <button class="btn btn-default btn-lg m-b-10 m-l-5 sbmt-btn" type="reset">Reset</button> 
                            </form>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="card alert">
                                <div class="card-header pr">
                                    <h4>Subject Allocation Details</h4>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table student-data-table m-t-20">
                                            <thead>
                                                <tr>
                                                    <th>S.No</th>
                                                    <th>Employee Name</th>
                                                    
                                                    <th>Subject Name</th>
                                                    <th>Accept</th>
                                                    <th>Decline</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php
$sql="SELECT tblsuballocation.ID as suballid,tblsuballocation.Teacherempid,tblsuballocation.Subid,tblsuballocation.AllocationDate,tblsuballocation.accept_decline,tblteacher.EmpID,tblteacher.FirstName,tblteacher.LastName,tblsubject.ID,tblsubject.SubjectFullname,tblsubject.SubjectShortname,tblsubject.SubjectCode from tblsuballocation join tblteacher on tblteacher.EmpID=tblsuballocation.Teacherempid join tblsubject on tblsubject.ID=tblsuballocation.Subid";
$query = $dbh -> prepare($sql);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);

$cnt=1;
if($query->rowCount() > 0)
{
foreach($results as $row)
{               ?>
                                                <tr>
                                                    <td><?php echo htmlentities($cnt);?></td>
                                                    <td>
                                                        <?php  echo htmlentities($row->FirstName);?> <?php  echo htmlentities($row->LastName);?>(<?php  echo htmlentities($row->Teacherempid);?>)
                                                    </td>
                                                    
                                                   <td>
                                                        <?php  echo htmlentities($row->SubjectFullname);?>(<?php  echo htmlentities($row->SubjectCode);?>)
                                                    </td>

                                                    <td>
                                                        <?php if($row->accept_decline==1){
                                                            echo "<i class='fa fa-check' style='color:blue' aria-hidden='true'></i>";
                                                        }
                                                        ?>
                                                    </td>

                                                    <td>
                                                        <?php if($row->accept_decline==2){
                                                            echo "<i class='fa fa-times' style='color:red' aria-hidden='true'></i>";
                                                        }
                                                        ?>
                                                    </td>
                                                    
                                                    <td>
                                                   <span><a href="subject-allocation.php?delid=<?php echo ($row->ID);?>"  onclick="return confirm('Do you really want to Delete ?');" class="btn btn-danger">DELETE </a></span>
                                                    </td>
                                                </tr>
                                                 <?php $cnt=$cnt+1;}} ?> 
                                            
                                             

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /# column -->

                    </div>
                    <!-- /# row -->

                    <?php include_once('includes/footer.php');?>
                </div>
            </div>
        </div>
    </div>







    <!-- jquery vendor -->
    <script src="../assets/js/lib/jquery.min.js"></script>
    <script src="../assets/js/lib/jquery.nanoscroller.min.js"></script>
    <!-- nano scroller -->
    <script src="../assets/js/lib/menubar/sidebar.js"></script>
    <script src="../assets/js/lib/preloader/pace.min.js"></script>
    <!-- sidebar -->
    <script src="../assets/js/lib/bootstrap.min.js"></script>
    <!-- bootstrap -->
    <script src="../assets/js/scripts.js"></script>
    <!-- scripit init-->





</body>

</html><?php }  ?>