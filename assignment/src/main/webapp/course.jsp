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
	<jsp:useBean id="course" class="ict.bean.Course" scope="request"/>

	<div class="container-fluid vh-100 pr-0">
		<div class="row w-100">
			<div class="col-12 col-md-6 col-lg-4 p-0 disabled"></div>
			<div class="col vh-100 pl-lg-5 pr-0">
				<h1 class="title-regular mb-1 mt-5">course information</h1>

				<hr class="vector-black mt-0">

				<p class="desc font-weight-light">
					Lorem ipsum dolor, sit amet consectetur adipisicing elit. Dicta perspiciatis itaque amet, aut ipsam, consectetur repudiandae cumque blanditiis debitis facilis dolor, et sunt voluptate magnam id reprehenderit deserunt. Quas, odit?
					Lorem ipsum dolor sit amet consectetur adipisicing elit. Autem optio aliquid, error quasi alias sint soluta ex quam eos. Quasi neque vero fugiat assumenda atque a, quidem tempora doloribus cum.
				</p>

				<h2 class="title-regular"><%=course.getFullname()%></h2>
				<h4 class="title-regular"><%=course.getShortname()%></h4>
				<hr>

				<img src="https://images.pexels.com/photos/1105766/pexels-photo-1105766.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940" class="w-100" style="height: 200px; object-fit: cover;" alt="">

				<p class="desc mt-2">
					Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam quas natus at facilis repudiandae expedita? Nisi exercitationem nobis sunt, iure aperiam quam minima corrupti non asperiores saepe excepturi iste! Officiis! Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolor atque neque, modi consectetur excepturi, facilis esse, illo odio qui nemo totam perspiciatis laborum quae id explicabo suscipit blanditiis laudantium cupiditate.
				</p>
				
				<hr>

				<h4 class="title-regular">summary</h4>

				<p class="desc font-weight-light"><%=course.getSummary()%></p>
				
				<hr>

				<% if ("admin".equalsIgnoreCase((String) session.getAttribute("role"))
				||	"teacher".equalsIgnoreCase((String) session.getAttribute("role"))) { %>
					<h4 class="title-regular">Actions</h2>

					<button type="button" class="ml-0" data-toggle="modal" data-target="#edit_course">Edit Course</button>
					<jsp:include page="template/modal/edit_course.jsp">
						<jsp:param name="id" value="<%=course.getId()%>"/>
						<jsp:param name="fullname" value="<%=course.getFullname()%>"/>
						<jsp:param name="shortname" value="<%=course.getShortname()%>"/>
						<jsp:param name="summary" value="<%=course.getSummary()%>"/>
						<jsp:param name="hidden" value="<%=course.getHidden()%>"/>
						<jsp:param name="teacher_id" value="<%=course.getTeacherId()%>"/>
					</jsp:include>

					<a href="create_schedule.jsp?id=<%=course.getId()%>">
						<button type="button" class="ml-0">Add Schedule</button>
					</a>
					<a href="report_attendance.jsp?id=<%=course.getId()%>">
						<button type="button" class="ml-0">Generate attendance report</button>
					</a>

					<hr>
				<% } else { %>
					<h4 class="title-regular">Actions</h2>

					<a href="view_attendances.jsp?id=<%=course.getId()%>">
						<button type="button" class="ml-0">Generate attendance report</button>
					</a>

					<hr>
				<% } %>

				<h4 class="title-regular">schedule</h4>

				<div class="container-fluid p-0">
					<div class="row">
						<%@ page import="java.util.ArrayList"%>
						<%@ page import="ict.bean.Schedule"%>
						<%@ page import="ict.db.ScheduleDb"%>
						<%@ page import="ict.db.RoomDb"%>
						<%@ page import="ict.util.DatabaseConfig"%>
						<%@ page import="java.text.SimpleDateFormat"%>

						<% ArrayList<Schedule> schedules = new ScheduleDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD).get("course_id", request.getParameter("id")); RoomDb roomDb = new RoomDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD); for (int i = 0; i < schedules.size(); i++) { %>
							<div class="col-12 col-lg-4 my-2">
								<div class="p-4 w-100" style="background-color: #101010; border-bottom: .5rem solid #00aaaa;">
									<h4 class="title-regular text-white mb-0 d-inline">Date: <%=new SimpleDateFormat("MM/dd/yy").format(schedules.get(i).getDate())%></h4>

									<p class="desc font-weight-bold text-white mb-0">Time: <%=new SimpleDateFormat("HH:mm").format(schedules.get(i).getFrom().getTime())%> - <%=new SimpleDateFormat("HH:mm").format(schedules.get(i).getTo().getTime())%></p>
									<hr class="white">
									<p class="d-inline desc text-light mb-0">
										Room: <%=roomDb.get(schedules.get(i).getRoomId()).getName()%>.
									</p>

									<h4 class="title-regular mb-0 d-inline float-right">
										<a class="hyperlink text-white" href="schedule?action=view&id=<%=schedules.get(i).getId()%>">
											VIEW <i class="fas fa-arrow-circle-right"></i>
										</a>
									</h4>
								</div>
							</div>
						<% } if (schedules.size() == 0) { %>
							<h4 class="title-regular">No schedule was found.</h4>
						<% } %>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	angular.module('app', []).controller('controller', ($scope) => {});
</script>

</html>