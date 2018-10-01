<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../../css/herodetail.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../../css/bootstrap.min.css">
  <link rel="stylesheet" href="../../css/common.css">
<script src="../../js/js_m.js">

</script>
<style type="text/css">
tr {
	text-align: center;
}

.detail tr td:nth-child(1) {
	text-align: right;
}

.detail tr td:nth-child(2) {
	text-align: left;
}
</style>
</head>
<body>

<div class="col-md-8">

	<h2 align="center">영웅등록</h2>
	<br>
	<form action="heroproc_m.jsp?flag=insert" enctype="multipart/form-data"
		name="insertFrm" method="post">
		<table style="width: 100%; border=0;" >
			<tr>
				<td width="20%"></td>

				<td style="width: 50%">
					<table style="width: 100%" class="detail">
						<tr>
							<td colspan="2"><h3 align="center">기본정보</h3></td>
						</tr>
						<tr>
							<td>NAME :</td>
							<td><input type="text" name="name" class="form-control"></td>
						</tr>
						<tr>
							<td>Gender :</td>
							<td><select name="gender" class="form-control">
									<option value="Male">Male</option>
									<option value="Female">Female</option>
							</select></td>
						</tr>
						<tr>
							<td>Race :</td>
							<td><select name="race"  class="form-control">
									<option value="Human">Human</option>
									<option value="Alien">Alien</option>
									<option value="Android">Android</option>
									<option value="Animal">Animal</option>
									<option value="Asgardian">Asgardian</option>
									<option value="Atlantean">Atlantean</option>
									<option value="Clone">Clone</option>
									<option value="Cyborg">Cyborg</option>
									<option value="Demi-God">Demi-God</option>
									<option value="Demon">Demon</option>
									<option value="God">God</option>
									<option value="Human">Human</option>
									<option value="Kryptonian">Kryptonian</option>
									<option value="Mutant">Mutant</option>
									<option value="Mixed">Mixed</option>
									<option value="Symbiote">Symbiote</option>
									<option value="Vampire">Vampire</option>
							</select></td>
						</tr>
						<tr>
							<td>height :</td>
							<td><input type="text" name="height"  class="form-control"></td>
						</tr>
						<tr>
							<td>weight :</td>
							<td><input type="text" name="weight"  class="form-control"></td>
						</tr>
						<tr>
							<td>Publisher :</td>
							<td><select name="publisher" class="form-control">
									<option value="Marvel Comics">Marvel Comics</option>
									<option value="DC Comics">DC Comics</option>
									<option value="Dark Horse Comics">Dark Horse Comics</option>
									<option value="South Park">South Park</option>
									<option value="George Lucas">George Lucas</option>
									<option value="Sony Pictures">Sony Pictures</option>
									<option value="J. K. Rowling">J. K. Rowling</option>
									<option value="Icon Comics">Icon Comics</option>
									<option value="Titan Books">Titan Books</option>
									<option value="Star Trek">Star Trek</option>
									<option value="Rebellion">Rebellion</option>
									<option value="Shueisha">Shueisha</option>
									<option value="Wildstorm">Wildstorm</option>
									<option value="Team Epic TV">Team Epic TV</option>
									<option value="ABC Studios">ABC Studios</option>
									<option value="HarperCollins">HarperCollins</option>
									<option value="Universal Studios">Universal Studios</option>
									<option value="Image Comics">Image Comics</option>
									<option value="SyFy">SyFy</option>
									<option value="Han-Barbera">Han-Barbera</option>
									<option value="IDW Publishing">IDW Publishing</option>
									<option value="Microsoft">Microsoft</option>
							</select></td>
						</tr>
						<tr>
							<td>Hair color :</td>
							<td><input type="text" name="hair_color" class="form-control"></td>
						</tr>
						<tr>
							<td>Eye Color:</td>
							<td><input type="text" name="eye_color" class="form-control"></td>
						</tr>
						<tr>
							<td>Skin Color:</td>
							<td><input type="text" name="skin_color" class="form-control"></td>
						</tr>
						<tr>
							<td>Alignment :</td>
							<td><select name="alignment" class="form-control">
									<option value="Good">Good</option>
									<option value="Neutral">Neutral</option>
							</select></td>
						</tr>
						<tr>
							<td>Power  :</td>
							<td><input type="button" class="form-control btn" value="Search Power" onclick="javascript:powerInsert()">
							</td>
						</tr>
						<tr>
						<td>List</td>
						<td><textarea readonly name="powerlist" cols="20" rows="20" class="form-control"></textarea></td>
						</tr>
						<tr>
							<td><input type="file" name="image" class="form-control"></td>
						</tr>
						<tr>
							<td width="20%"></td>
							<td style="width: 50%">
							<input type="button" value="목록"
								onclick="javascript:Back()" class="form-control"> <input type="button"
								value="완료" class="form-control"onclick="javascript:heroInsertOk()"></td>
						</tr>
					</table> <br> <input type="hidden" name="approval" value="0">
	</form>
</div>


  <script src="../js/jquery-3.3.1.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>


</body>
</html>