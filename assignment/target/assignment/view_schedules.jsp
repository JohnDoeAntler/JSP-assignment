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
				<h1 class="title-regular mb-1 mt-5">View schedule</h1>

				<hr class="vector-black mt-0">

				<p class="desc font-weight-light">
					Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam vel adipisci atque commodi mollitia provident voluptatum. Quasi numquam voluptas minima odit, praesentium reprehenderit porro adipisci corporis nesciunt veritatis aliquam quibusdam!
					Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti harum fugiat, ad perferendis ea inventore minus iusto perspiciatis officiis blanditiis non aliquam ex obcaecati laborum enim architecto repellat eaque. Dolore?
				</p>

				<%@page import="java.util.ArrayList"%>
				<%@page import="java.util.HashMap"%>
				<%@page import="ict.bean.Course"%>
				<%@page import="ict.bean.Schedule"%>
				<%@page import="ict.bean.StudentCourse"%>
				<%@page import="ict.db.CourseDb"%>
				<%@page import="ict.db.ScheduleDb"%>
				<%@page import="ict.db.StudentCourseDb"%>
				<%@page import="ict.util.DatabaseConfig"%>
				<%@page import="java.text.SimpleDateFormat"%>

				<%
					String role = (String) session.getAttribute("role");
					ArrayList<Course> courses = new ArrayList<Course>(); 
					CourseDb db = new CourseDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD);

					HashMap<String, ArrayList<Schedule>> schedules = new HashMap<String, ArrayList<Schedule>>();
					ScheduleDb scheduleDb = new ScheduleDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD);

					SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");

					if (role.equalsIgnoreCase("admin")) {
						ArrayList<Schedule> list = scheduleDb.get();

						for (int j = 0; j < list.size(); j++) {
							String date = format.format(list.get(j).getDate().getTime());
							if (!schedules.containsKey(date)) {
								schedules.put(date, new ArrayList<>());
							}
							schedules.get(date).add(list.get(j));
						}
					} else {
						switch (role) {
							case "student":
								ArrayList<StudentCourse> studentCourses = new StudentCourseDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD).get("student_id", user.getId());
								for (int i = 0; i < studentCourses.size(); i++) {
									courses.add(db.get(studentCourses.get(i).getCourseId()));
								}
								System.out.println(courses.size());
								break;
							case "teacher":
								courses = db.get("teacher_id", user.getId());
								break;
						}

						for (int i = 0; i < courses.size(); i++) {
							ArrayList<Schedule> list = scheduleDb.get("course_id", courses.get(i).getId());
							System.out.println(list.size());
							for (int j = 0; j < list.size(); j++) {
								String date = format.format(list.get(j).getDate().getTime());
								if (!schedules.containsKey(date)) {
									schedules.put(date, new ArrayList<>());
								}
								schedules.get(date).add(list.get(j));
							}
						}
					}

					for (String date : schedules.keySet()) {
						%>
							<h4 class="title-regular"><%=date%></h4>
				
							<hr>
						<%
						ArrayList<Schedule> list = schedules.get(date);
						for (int i = 0; i < list.size(); i++) {
							%>
								<div class="w-100 p-4 text-white my-2" style="background-color: #101010; border-left: .5rem solid #00cccc;">
									<h4 class="title-regular mb-0"><%=db.get(list.get(i).getCourseId()).getFullname()%><span>(<%=new SimpleDateFormat("HH:mm").format(list.get(i).getFrom().getTime())%> - <%=new SimpleDateFormat("HH:mm").format(list.get(i).getTo().getTime())%>)</span></h4>

									<hr class="vector">

									<p class="d-inline desc">
										Consectetur elit velit adipisicing veniam dolor anim reprehenderit magna ex nisi do consectetur.
									</p>

									<h4 class="title-regular mb-0 d-inline float-right">
										<a class="hyperlink text-white" href="course?action=view&id=<%=list.get(i).getCourseId()%>">
											view course <i class="fas fa-arrow-circle-right"></i>
										</a>
									</h4>
									<div class="clearfix"></div>
								</div>
							<%
						}
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