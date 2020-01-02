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
				<h1 class="title-regular mb-1 mt-5">Manage course</h1>

				<hr class="vector-black mt-0">

				<p class="desc font-weight-light">
					Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam vel adipisci atque commodi mollitia provident voluptatum. Quasi numquam voluptas minima odit, praesentium reprehenderit porro adipisci corporis nesciunt veritatis aliquam quibusdam!
					Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti harum fugiat, ad perferendis ea inventore minus iusto perspiciatis officiis blanditiis non aliquam ex obcaecati laborum enim architecto repellat eaque. Dolore?
				</p>

				<hr>

				<h4 class="title-regular">Actions</h4>

				<button data-toggle="modal" data-target="#add_studentcourse">Add course relationship</button>

				<jsp:include page="template/modal/add_studentcourse.jsp">
					<jsp:param name="id" value="<%=request.getParameter(\"id\")%>"/>
				</jsp:include>

				<hr>

				<%@page import="java.util.ArrayList"%>
				<%@page import="ict.bean.Course"%>
				<%@page import="ict.bean.StudentCourse"%>
				<%@page import="ict.db.CourseDb"%>
				<%@page import="ict.db.StudentCourseDb"%>
				<%@page import="ict.util.DatabaseConfig"%>

				<%
					CourseDb db = new CourseDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD);

					ArrayList<StudentCourse> studentCourses = new StudentCourseDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD).get("student_id", request.getParameter("id"));

					for (int i = 0; i < studentCourses.size(); i++) {
						Course course = db.get(studentCourses.get(i).getCourseId());
						%>
							<div class="w-100 p-4 text-white my-2" style="background-color: #101010; border-left: .5rem solid #00cccc;">
								<h4 class="title-regular mb-0 d-inline"><%=course.getFullname()%></h4>

								<h4 class="title-regular mb-0 d-inline float-right">
									<a href="studentcourse?action=remove&id=<%=studentCourses.get(i).getId()%>" class="hyperlink text-white">
										Remove
									</a>
								</h4>
								<div class="clearfix"></div>
							</div>	
						<%
					}
				%>
			</div>
		</div>
	</div>
</body>
<script>
	angular.module('app', []).controller('controller', ($scope) => {});
</script>

</html>