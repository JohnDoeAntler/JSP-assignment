<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

	<% if (user.getUsername() == null) { %>
		<div class="container-fluid d-flex vh-100 pr-0">
			<div class="row m-auto w-100">
				<div class="col-12 col-md-6 col-lg-4 p-0 disabled"></div>
				<div class="col h-100 pl-lg-5">
					<h1 class="title mb-1">About the system</h1>

					<hr class="vector-black mt-0">

					<p class="desc font-weight-light">
						Lorem ipsum dolor, sit amet consectetur adipisicing elit. Omnis consequatur et, esse veritatis expedita officia doloremque sed voluptates. Ducimus ut, quod maiores aperiam similique atque esse officia sint nesciunt dolore?
						Lorem ipsum dolor sit amet consectetur adipisicing elit. Distinctio sapiente quaerat excepturi neque? Quaerat laudantium eligendi ut provident quod asperiores voluptates quibusdam in recusandae perspiciatis praesentium, labore ipsa voluptas quis?
						Lorem ipsum dolor sit amet consectetur adipisicing elit. In totam voluptatem inventore vero quas, suscipit vitae autem voluptates porro non magnam sequi quam cumque aspernatur sunt quasi, incidunt quo beatae?
					</p>

					<img src="https://images.pexels.com/photos/60342/pexels-photo-60342.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260" class="rounded w-100" style="height: 40vh; object-fit: cover;" alt="">

					<p class="desc font-weight-light mt-2">
						Lorem ipsum dolor sit amet consectetur adipisicing elit. Debitis quas ex nostrum perferendis excepturi accusantium non soluta. Fugit iusto earum accusamus! Harum sit incidunt aliquam neque atque rem nesciunt debitis?
					</p>

					<img src="https://images.pexels.com/photos/1529881/pexels-photo-1529881.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260" class="rounded w-100" style="height: 20vh; object-fit: cover;" alt="">

					<p class="desc font-weight-light mt-2">
						Lorem ipsum dolor sit amet consectetur adipisicing elit. Debitis quas ex nostrum perferendis excepturi accusantium non soluta. Fugit iusto earum accusamus! Harum sit incidunt aliquam neque atque rem nesciunt debitis?
						Lorem ipsum dolor sit amet consectetur adipisicing elit. Explicabo atque, quas officia repellendus accusantium voluptatum at minima, harum corrupti architecto qui nobis aspernatur rem necessitatibus placeat laudantium? Consectetur, nihil eaque!
					</p>
				</div>
			</div>
		</div>
	<% } else { %>
		<div class="container-fluid vh-100 pr-0">
			<div class="row w-100">
				<div class="col-12 col-md-6 col-lg-4 p-0 disabled"></div>
				<div class="col vh-100 pl-lg-5 pr-0">
					<h1 class="title-regular mb-1 mt-5">Enrolled courses</h1>

					<hr class="vector-black mt-0">

					<p class="desc font-weight-light">
						Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam vel adipisci atque commodi mollitia provident voluptatum. Quasi numquam voluptas minima odit, praesentium reprehenderit porro adipisci corporis nesciunt veritatis aliquam quibusdam!
						Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti harum fugiat, ad perferendis ea inventore minus iusto perspiciatis officiis blanditiis non aliquam ex obcaecati laborum enim architecto repellat eaque. Dolore?
					</p>

					<%@page import="java.util.ArrayList"%>
					<%@page import="ict.bean.Course"%>
					<%@page import="ict.bean.StudentCourse"%>
					<%@page import="ict.db.CourseDb"%>
					<%@page import="ict.db.StudentCourseDb"%>
					<%@page import="ict.util.DatabaseConfig"%>

					<%
						ArrayList<Course> courses = new ArrayList<Course>(); 
						String role = (String) session.getAttribute("role");
						CourseDb db = new CourseDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD);

						switch (role) {
							case "admin":
								courses = db.get();
								break;
							case "student":
								ArrayList<StudentCourse> studentCourses = new StudentCourseDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD).get("student_id", user.getId());
								for (int i = 0; i < studentCourses.size(); i++) {
									courses.add(db.get(studentCourses.get(i).getCourseId()));
								}
								break;
							case "teacher":
								courses = db.get("teacher_id", user.getId());
								break;
						}
					%>

					<h4 class="title-regular">total enrolled courses: <%=courses.size()%></h4>
					
					<hr>

					<div style="height: 700px; overflow-y: auto;">
						<% for (int i = 0; i < courses.size(); i++) { %>
							<div class="w-100 p-4 text-white my-2" style="background-color: #101010; border-left: .5rem solid #00cccc;">
								<h4 class="title-regular mb-0"><%=courses.get(i).getFullname()%></h4>
								<small>Code: <%=courses.get(i).getShortname()%></small>
								<div class="my-2" style="width: 4rem; border: 3px solid #efefef;"></div>
								<p class="desc mb-0"><%=courses.get(i).getSummary()%></p>

								<hr class="white">

								<p class="d-inline desc">State: <%=courses.get(i).getHidden() ? "Hidden" : "Available"%></p>

								<h4 class="title-regular mb-0 d-inline float-right">
									<a class="hyperlink text-white" href="./course?action=view&id=<%=courses.get(i).getId()%>">
										See detail <i class="fas fa-arrow-circle-right"></i>
									</a>
								</h4>
								<div class="clearfix"></div>
							</div>
						<% } if (courses.size() == 0) { %>
							<h4 class="title-regular">No course was found.</h4>
						<% } %>
					</div>
				</div>
			</div>
		</div>
	<% } %>
</body>
<script>
	angular.module('app', []).controller('controller', ($scope) => {});
</script>

</html>