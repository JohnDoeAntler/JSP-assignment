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
	<jsp:useBean id="schedule" class="ict.bean.Schedule" scope="request"/>
	<%@ page import="ict.bean.Course" %>
	<%@ page import="ict.bean.Room" %>
	<%@ page import="ict.db.CourseDb" %>
	<%@ page import="ict.db.RoomDb" %>
	<%@ page import="ict.util.DatabaseConfig" %>

	<%
		Course course = new CourseDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD).get(schedule.getCourseId());
		Room room = new RoomDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD).get(schedule.getRoomId());
	%>

	<div class="container-fluid vh-100 pr-0">
		<div class="row w-100">
			<div class="col-12 col-md-6 col-lg-4 p-0 disabled"></div>
			<div class="col vh-100 pl-lg-5 pr-0">
				<h1 class="title-regular mb-1 mt-5">schedule information</h1>

				<hr class="vector-black mt-0">

				<p class="desc font-weight-light">
					Lorem ipsum dolor sit amet consectetur adipisicing elit. Totam temporibus eveniet neque non quis, tempora inventore accusantium hic assumenda necessitatibus voluptate iusto aspernatur! Consectetur nulla dolorem ipsam fugit amet sint.
					Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nihil voluptatem nostrum tempore nesciunt eius eligendi, dignissimos magnam, sequi vel ipsam quos, sapiente perferendis repellendus. Cupiditate suscipit ipsam accusantium temporibus rerum.
				</p>


				<h2 class="title-regular"><%=course.getShortname()%>'s course schedule</h4>

				<hr>

				<img src="https://images.pexels.com/photos/1038935/pexels-photo-1038935.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940" class="w-100" style="height: 200px; object-fit: cover;" alt="">

				<p class="desc mt-2">
					Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam quas natus at facilis repudiandae expedita? Nisi exercitationem nobis sunt, iure aperiam quam minima corrupti non asperiores saepe excepturi iste! Officiis! Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolor atque neque, modi consectetur excepturi, facilis esse, illo odio qui nemo totam perspiciatis laborum quae id explicabo suscipit blanditiis laudantium cupiditate.
				</p>
				
				<hr>

				<%@ page import="java.text.SimpleDateFormat"%>

				<div class="row">
					<div class="col-12 col-lg-4 pr-lg-1 my-2 my-lg-0">
						<div class="text-center text-white p-4" style="background-color: #101010;">
							<h4 class="title-regular mb-0">Date</h4>
							<p class="desc text-center">
								Ipsum magna eu commodo labore eiusmod cupidatat.
							</p>
							<hr class="vector">
							<p class="title-regular mb-0">
								<%=new SimpleDateFormat("MM/dd/yyyy").format(schedule.getDate().getTime())%>
							</p>
						</div>
					</div>
					<div class="col-12 col-lg-4 px-lg-1 my-2 my-lg-0">
						<div class="text-center text-white p-4" style="background-color: #101010;">
							<h4 class="title-regular mb-0">Duration</h4>
							<p class="desc text-center">
								Ad deserunt est aliqua pariatur.
							</p>
							<hr class="vector">
							<p class="title-regular mb-0">
								<%=new SimpleDateFormat("HH:mm").format(schedule.getFrom().getTime())%> - <%=new SimpleDateFormat("HH:mm").format(schedule.getTo().getTime())%>
							</p>
						</div>
					</div>
					<div class="col-12 col-lg-4 pl-lg-1 my-2 my-lg-0">
						<div class="text-center text-white p-4" style="background-color: #101010;">
							<h4 class="title-regular mb-0">Room</h4>
							<p class="desc text-center">
								Occaecat nulla nulla duis.
							</p>
							<hr class="vector">
							<p class="title-regular mb-0">
								<%=room.getName()%>
							</p>
						</div>
					</div>
				</div>

				<hr>

				<%@ page import="ict.db.AttendanceDb"%>
				<%@ page import="ict.db.StudentDb"%>
				<%@ page import="ict.bean.Attendance"%>
				<%@ page import="java.util.ArrayList" %>

				<% if (user.getUsername() != null) { 
					String role = (String) session.getAttribute("role");
					if ("admin".equalsIgnoreCase(role) || "teacher".equalsIgnoreCase(role)) { %>
						<h4 class="title-regular">Actions</h2>

						<button type="button" class="ml-0" data-toggle="modal" data-target="#edit_schedule">Edit Schedule</button>
						<button type="button" class="ml-0 border-danger" data-toggle="modal" data-target="#remove_schedule">remove Schedule</button>

						<jsp:include page="template/modal/edit_schedule.jsp">
							<jsp:param name="id" value="<%=schedule.getId()%>"/>
							<jsp:param name="date" value="<%=new SimpleDateFormat(\"MM/dd/yyyy\").format(schedule.getDate().getTime())%>"/>
							<jsp:param name="from" value="<%=new SimpleDateFormat(\"HH:mm\").format(schedule.getFrom().getTime())%>"/>
							<jsp:param name="to" value="<%=new SimpleDateFormat(\"HH:mm\").format(schedule.getTo().getTime())%>"/>
							<jsp:param name="course_id" value="<%=schedule.getCourseId()%>"/>
						</jsp:include>

						<jsp:include page="template/modal/remove_schedule.jsp">
							<jsp:param name="id" value="<%=schedule.getId()%>"/>
						</jsp:include>

						<hr>

						<h4 class="title-regular mb-0">Attendance list</h4>

						<div class="row">
							<%
								AttendanceDb attendanceDb = new AttendanceDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD);
								StudentDb studentDb = new StudentDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD);
								ArrayList<Attendance> attendances = attendanceDb.get("schedule_id", schedule.getId());
								for (int i = 0 ; i < attendances.size(); i ++) { %>

								<div class="col-12 col-lg-6 my-lg-2">
									<div class="w-100 p-4 text-white" style="background-color: #101010; border-left: .5rem solid #00cccc;">
										<h4 class="title-regular mb-0 d-inline"><%=studentDb.get(attendances.get(i).getStudentId()).getUsername()%> - <%=new SimpleDateFormat("HH:mm").format(attendances.get(i).getTime().getTime())%></h4>
										<h4 class="title-regular mb-0 d-inline float-right">
											<a class="hyperlink text-white" data-toggle="modal" data-target="#edit_attendance" ng-click="attendanceClick('<%=attendances.get(i).getId()%>', '<%=new SimpleDateFormat("HH:mm").format(attendances.get(i).getTime())%>')">
												Edit <i class="fas fa-edit"></i>
											</a>
										</h4>
										<div class="clearfix"></div>
									</div>
								</div>
							<%}%>
						</div>

						<jsp:include page="template/modal/edit_attendance.jsp"/>

					<% } else if ("student".equalsIgnoreCase(role)) { 
						AttendanceDb attendanceDb = new AttendanceDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD);
						ArrayList<Attendance> attendances = attendanceDb.get("schedule_id", schedule.getId());
						boolean isCommitted = false;
						for (int i = 0; i < attendances.size(); i++) {
							if (attendances.get(i).getStudentId().equalsIgnoreCase(user.getId())) { isCommitted = true; %>
								<button type="button" class="ml-0">Committed at <%=new SimpleDateFormat("HH:mm").format(attendances.get(i).getTime())%></button>
							<% }
						}

						if (!isCommitted) { %>
							<form action="attendance" method="post">
								<input type="hidden" name="action" value="create">
								<input type="hidden" name="student_id" value="<%=user.getId()%>">
								<input type="hidden" name="schedule_id" value="<%=schedule.getId()%>">
								<button type="submit" class="ml-0">Commit Attendance</button>
							</form>
						<% }
					}
				} %>
			</div>
		</div>
	</div>
</body>
<script>
	angular.module('app', []).controller('controller', ($scope) => {

		$scope.attendanceClick = (id, time) =>  {
			$scope.id = id;
			$scope.time = time;
		}

	});
</script>

</html>