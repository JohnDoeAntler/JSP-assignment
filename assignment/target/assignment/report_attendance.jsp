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
				<h1 class="title-regular mb-1 mt-5">Attendance report</h1>

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
				<%@page import="ict.bean.User"%>

				<%@page import="ict.db.CourseDb"%>
				<%@page import="ict.db.StudentCourseDb"%>
				<%@page import="ict.db.ScheduleDb"%>
				<%@page import="ict.db.AttendanceDb"%>
				<%@page import="ict.db.StudentDb"%>

				<%@page import="ict.util.DatabaseConfig"%>
				<%@page import="java.text.SimpleDateFormat"%>
				<%@page import="java.sql.Timestamp"%>

				<h4 class="title-regular">Actions</h4>

				<% if (request.getParameter("filter") == null) { %>
					<a href="report_attendance.jsp?id=<%=request.getParameter("id")%>&filter=60">
						<button class="ml-0">Filter less than 60%</button>
					</a>
				<% } else { %>
					<a href="report_attendance.jsp?id=<%=request.getParameter("id")%>">
						<button class="ml-0">Show all</button>
					</a>
				<% } %>

				<button class="ml-0">Export as excel file</button>
				
				<hr>

				<%
					CourseDb cdb = new CourseDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD);
					ScheduleDb sdb = new ScheduleDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD);
					AttendanceDb adb = new AttendanceDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD);
					StudentCourseDb scdb = new StudentCourseDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD);
					StudentDb udb = new StudentDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD);

					ArrayList<Course> courses = new ArrayList<>();

					String id = request.getParameter("id");

					if (id == null) {
						switch ((String) session.getAttribute("role")) {
							case "admin":
								courses = cdb.get();
								break;
							case "student":
								ArrayList<StudentCourse> studentCourses = new StudentCourseDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD).get("student_id", user.getId());
								for (int i = 0; i < studentCourses.size(); i++) {
									courses.add(cdb.get(studentCourses.get(i).getCourseId()));
								}
								break;
							case "teacher":
								courses = cdb.get("teacher_id", user.getId());
								break;
						}
					} else {
						courses.add(cdb.get(id));
					}

					for (int k = 0; k < courses.size(); k++) {
						Course course = courses.get(k);
					%>

					<h4 class="title-regular">Reporting course: <%=course.getFullname()%></h4>

					<%
						ArrayList<StudentCourse> scs = scdb.get("course_id", course.getId());
						ArrayList<Schedule> ss = sdb.get("course_id", course.getId());

						double filter = request.getParameter("filter") == null ? 0.0 : Double.parseDouble(request.getParameter("filter"));

						if (scs.size() == 0) {
							%>
								<h4 class="title-regular">No student was found.</h4>
							<%
						}

						for (int i = 0; i < scs.size(); i++) {
							User student = udb.get(scs.get(i).getStudentId());

							int count = 0;
							int total = ss.size();

							for (int j = 0; j < ss.size(); j++) {
								if (adb.get("student_id", student.getId(), "schedule_id", ss.get(j).getId()).size() > 0){
									count++;
								} 
							}

							double rate = Math.round((double)count * 10000.0/(double) total) / 100.0;

							if (rate >= filter) {
								%>
									<div class="w-100 p-4 text-white my-2" style="background-color: #101010; border-left: .5rem solid #00cccc;">
										<h4 class="title-regular mb-0 d-inline">ID: <%=student.getUsername()%></h4>

										<h4 class="title-regular mb-0 d-inline float-right">
											<span>Attendance rate: <%=rate%>%</span>
										</h4>
										<div class="clearfix"></div>
									</div>
								<%
							}
						}
						%>
							<hr>
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