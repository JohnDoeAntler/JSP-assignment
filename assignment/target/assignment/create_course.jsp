<!DOCTYPE html>
<html lang="en" ng-app="app">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Document</title>

	<%@ include file="./template/header.jsp"%>
</head>

<body class="dot" ng-controller="controller">

	<jsp:include page="./template/navigation-bar.jsp"/>
	<jsp:useBean id="user" class="ict.bean.User" scope="session"/>

	<div class="container-fluid vh-100 pr-0 d-flex">
		<div class="row w-100 my-auto">
			<div class="col-12 col-md-6 col-lg-4 p-0 disabled"></div>
			<div class="col pl-lg-5 pr-0">
				<h1 class="title-regular mb-1 mt-5">Setup class</h1>

				<hr class="vector-black mt-0">

				<p class="desc font-weight-light">
					Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam vel adipisci atque commodi mollitia provident voluptatum. Quasi numquam voluptas minima odit, praesentium reprehenderit porro adipisci corporis nesciunt veritatis aliquam quibusdam!
					Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti harum fugiat, ad perferendis ea inventore minus iusto perspiciatis officiis blanditiis non aliquam ex obcaecati laborum enim architecto repellat eaque. Dolore?
				</p>

				<hr>

				<form action="course" method="POST">
					<input type="hidden" name="action" value="create">

					<div class="md-form md-bg mt-0">
						<input type="text" id="shortname" name="shortname" class="form-control" autofocus required>
						<label for="shortname">Short name</label>
						<small class="desc">
							Elit sint fugiat labore ullamco eu ea occaecat elit sit.
						</small>
					</div>
					
					<div class="md-form md-bg mt-0">
						<input type="text" id="fullname" name="fullname" class="form-control" required>
						<label for="fullname">Fullname</label>
						<small class="desc">
							Aute nisi sunt qui labore esse deserunt minim non magna deserunt.
						</small>
					</div>
	
					<div class="md-form md-bg">
						<textarea id="summary" name="summary" class="form-control md-textarea" length="120" rows="3" required></textarea>
						<label for="summary">Summary</label>
					</div>

					<%
						if (((String) session.getAttribute("role")).equalsIgnoreCase("teacher")) {
							%>
								<input type="hidden" name="teacher_id" value="<%=user.getId()%>">
							<%
						} else  {
							%>
								<style>
									input[type=time]+label {
										padding-left:.75rem !important;
										font-weight:500 !important;
										transform:translateY(-3px) scale(.8) !important;
									}

									select.form-control+label {
										padding-left:.75rem !important;
										font-weight:500 !important;
										transform:translateY(-3px) scale(.8) !important;
									}

									select.form-control {
										box-sizing:border-box;
										padding:10px 5px;
										background:50% 100% no-repeat,50% 100% no-repeat #f5f5f5 !important;
										background-image:linear-gradient(to bottom,#4285f4,#4285f4),linear-gradient(to bottom,#ced4da,#ced4da) !important;
										background-size:0 2px,100% 1px !important;
										border:0;
										border-top-left-radius:.3rem !important;
										border-top-right-radius:.3rem !important;
										transition:background-size .3s cubic-bezier(.64,.09,.08,1)
									}
								</style>

								<div class="md-form md-bg">
									<select class="form-control" name="teacher_id" id="teacher_id" required>
										<%@ page import="ict.db.TeacherDb"%>
										<%@ page import="ict.bean.User"%>
										<%@ page import="java.util.ArrayList"%>
										<%@ page import="ict.util.DatabaseConfig"%>
										<%
											ArrayList<User> users = new TeacherDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD).get();

											for (int i = 0; i < users.size(); i++) {
												%>
													<option value="<%=users.get(i).getId()%>"><%=users.get(i).getUsername()%></option>
												<%
											}
										%>
									</select>
									<label for="teacher_id">Teacher</label>
								</div>
							<%
						}
					%>

					<div class="custom-control custom-switch">
						<input type="checkbox" class="custom-control-input" id="hidden" name="hidden" value="true">
						<label class="custom-control-label" for="hidden">Hidden</label>
					</div>
					<small class="desc">
						Commodo nisi id esse commodo ea consectetur amet.
					</small>
	
					<hr>
	
					<button type="submit" class="">Submit</button>
	
					<button type="reset" class="">Reset</button>
				</form>
			</div>
		</div>
	</div>
</body>
<script>
	angular.module('app', []).controller('controller', ($scope) => {});
</script>

</html>