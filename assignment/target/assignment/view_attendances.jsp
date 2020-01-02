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
				<h1 class="title-regular mb-1 mt-5">View attendance log</h1>

				<hr class="vector-black mt-0">

				<p class="desc font-weight-light">
					Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam vel adipisci atque commodi mollitia provident voluptatum. Quasi numquam voluptas minima odit, praesentium reprehenderit porro adipisci corporis nesciunt veritatis aliquam quibusdam!
					Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti harum fugiat, ad perferendis ea inventore minus iusto perspiciatis officiis blanditiis non aliquam ex obcaecati laborum enim architecto repellat eaque. Dolore?
				</p>

				<%@page import="java.util.ArrayList"%>
				<%@page import="java.util.HashMap"%>
				<%@page import="java.util.Calendar"%>
				<%@page import="ict.bean.Course"%>
				<%@page import="ict.bean.StudentCourse"%>
				<%@page import="ict.bean.Schedule"%>
				<%@page import="ict.bean.Attendance"%>
				<%@page import="ict.db.CourseDb"%>
				<%@page import="ict.db.StudentCourseDb"%>
				<%@page import="ict.db.ScheduleDb"%>
				<%@page import="ict.db.AttendanceDb"%>
				<%@page import="ict.util.DatabaseConfig"%>
				<%@page import="java.text.SimpleDateFormat"%>
				<%@page import="java.sql.Timestamp"%>

				<%
					CourseDb cdb = new CourseDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD);
					ScheduleDb sdb = new ScheduleDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD);
					AttendanceDb adb = new AttendanceDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD);
					ArrayList<StudentCourse> studentCourses = null;

					if (request.getParameter("id") != null) {
						studentCourses = new ArrayList<>();
						studentCourses.add(new StudentCourse("", user.getId(), request.getParameter("id"), new Timestamp(Calendar.getInstance().getTime().getTime()), new Timestamp(Calendar.getInstance().getTime().getTime())));
					} else {
						studentCourses = new StudentCourseDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD).get("student_id", user.getId());
					}

					for (int i = 0; i < studentCourses.size(); i++) {
						Course course = cdb.get(studentCourses.get(i).getCourseId());
						ArrayList<Schedule> schedules = sdb.get("course_id", course.getId());
						%>
							<h4 class="title-regular"><%=course.getFullname()%></h4>
							
							<hr>
						<%
						for (int j = 0; j < schedules.size(); j++) {
							ArrayList<Attendance> tmp = adb.get("schedule_id", schedules.get(j).getId(), "student_id", user.getId());
							%>
								<div class="w-100 p-4 text-white my-2" style="background-color: #101010; border-left: .5rem solid #<%=tmp.size() > 0 ? "00cccc" : "cc0000"%>;">
									<h4 class="title-regular mb-0 d-inline"><%=new SimpleDateFormat("MM/dd/yyyy").format(schedules.get(j).getDate())%> - 

										<%
											if (tmp.size() > 0) {
												%>
													<%=new SimpleDateFormat("HH:mm").format(tmp.get(i).getTime().getTime())%> - PRESENT
												<%
											} else {
												%>
													--:-- - ABSENT
												<%
											}
										%>
									</h4>

									<h4 class="title-regular mb-0 d-inline float-right">
										<a class="hyperlink text-white" href="./schedule?action=view&id=<%=schedules.get(i).getId()%>">
											view schedule <i class="fas fa-arrow-circle-right"></i>
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