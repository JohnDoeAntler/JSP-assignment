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

	<div class="container-fluid vh-100 pr-0">
		<div class="row w-100">
			<div class="col-12 col-md-6 col-lg-4 p-0 disabled"></div>
			<div class="col vh-100 pl-lg-5 pr-0">
				<h1 class="title-regular mb-1 mt-5">View users</h1>

				<hr class="vector-black mt-0">

				<p class="desc font-weight-light">
					Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam vel adipisci atque commodi mollitia provident voluptatum. Quasi numquam voluptas minima odit, praesentium reprehenderit porro adipisci corporis nesciunt veritatis aliquam quibusdam!
					Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti harum fugiat, ad perferendis ea inventore minus iusto perspiciatis officiis blanditiis non aliquam ex obcaecati laborum enim architecto repellat eaque. Dolore?
				</p>

				<hr>

				<h4 class="title-regular">Search User</h4>

				<div class="md-form md-bg mt-0">
					<input type="text" id="search" name="search" value="<%=request.getParameter("search") == null ? "" : request.getParameter("search")%>" ng-model="search" class="form-control">
					<label for="search">Search</label>
					<small class="desc">
						Cillum irure veniam exercitation tempor qui ut consequat et esse laboris.
					</small>
				</div>

				<hr>

				<div style="height: 600px; overflow-y: auto;">
					<div ng-repeat="user in users | filter: search | orderBy: 'role'" class="w-100 p-4 text-white my-2" style="background-color: #101010; border-left: .5rem solid #00cccc;">
						<h4 class="title-regular mb-0 d-inline">{{user.username}} # {{user.role}}</h4>

						<h4 class="title-regular mb-0 d-inline float-right">
							<a class="hyperlink text-white" href="#" data-toggle="modal" data-target="#edit_role" ng-click="click(user.id, user.role);">
								Edit role 
							</a>
						</h4>

						<h4 class="title-regular mb-0 d-inline float-right" ng-if="user.role == 'student'">&nbsp;-&nbsp;</h4>

						<h4 class="title-regular mb-0 d-inline float-right" ng-if="user.role == 'student'">
							<a class="hyperlink text-white" ng-href="edit_studentcourse.jsp?id={{user.id}}">
								Manage course 
							</a>
						</h4>
						
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="template/modal/edit_role.jsp"%>

	<%@page import="java.util.ArrayList"%>
	<%@page import="ict.bean.User"%>
	<%@page import="ict.db.StudentDb"%>
	<%@page import="ict.db.TeacherDb"%>
	<%@page import="ict.db.AdministratorDb"%>
	<%@page import="ict.util.DatabaseConfig"%>

</body>
<script>
	angular.module('app', []).controller('controller', ($scope) => {
		$scope.users = [
			<%
				StudentDb sdb = new StudentDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD);
				TeacherDb tdb = new TeacherDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD);
				AdministratorDb adb = new AdministratorDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD);

				ArrayList<User> students = (sdb.get());
				ArrayList<User> teachers = (tdb.get());
				ArrayList<User> administrators = (adb.get());

				String filter = request.getParameter("filter");

				for (int i = 0; i < students.size() && (filter == null || filter.equalsIgnoreCase("student")); i++) {
					%>
						{
							"id": "<%=students.get(i).getId()%>",
							"username": "<%=students.get(i).getUsername()%>",
							"role": "student"
						},
					<%
				}

				for (int i = 0; i < teachers.size() && (filter == null || filter.equalsIgnoreCase("teacher")); i++) {
					%>
						{
							"id": "<%=teachers.get(i).getId()%>",
							"username": "<%=teachers.get(i).getUsername()%>",
							"role": "teacher"
						},
					<%
				}

				for (int i = 0; i < administrators.size() && (filter == null || filter.equalsIgnoreCase("admin")); i++) {
					%>
						{
							"id": "<%=administrators.get(i).getId()%>",
							"username": "<%=administrators.get(i).getUsername()%>",
							"role": "admin"
						},
					<%
				}
			%>
		];

		$scope.click = (id, role) => {
			$scope.id = id;
			$scope.role = role;
		}
	});
</script>

</html>