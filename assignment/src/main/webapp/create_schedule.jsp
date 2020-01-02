<!DOCTYPE html>
<html lang="en" ng-app="app">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Document</title>

	<%@ include file="./template/header.jsp"%>

	<link rel="stylesheet" href="./style/datepicker.css">
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
	<script src="./script/datepicker.js"></script>

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
</head>

<body class="dot" ng-controller="controller">

	<jsp:include page="./template/navigation-bar.jsp"/>
	<jsp:useBean id="user" class="ict.bean.User" scope="session"/>

	<div class="container-fluid vh-100 pr-0 d-flex">
		<div class="row w-100 my-auto">
			<div class="col-12 col-md-6 col-lg-4 p-0 disabled"></div>
			<div class="col pl-lg-5 pr-0">
				<h1 class="title-regular mb-1 mt-5">Add schedule</h1>

				<hr class="vector-black mt-0">

				<p class="desc font-weight-light">
					Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam vel adipisci atque commodi mollitia provident voluptatum. Quasi numquam voluptas minima odit, praesentium reprehenderit porro adipisci corporis nesciunt veritatis aliquam quibusdam!
					Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti harum fugiat, ad perferendis ea inventore minus iusto perspiciatis officiis blanditiis non aliquam ex obcaecati laborum enim architecto repellat eaque. Dolore?
				</p>

				<hr>

				<form action="schedule" method="POST">
					<input type="hidden" name="action" value="create">

					<input type="hidden" name="course_id" value="<%=request.getParameter("id")%>">

					<div class="md-form md-bg mt-0">
						<input type="text" id="date" name="date" class="form-control datePicker" readonly required>
						<label for="date">date</label>
						<small class="desc">
							Ex veniam mollit sint consectetur deserunt cillum proident consectetur exercitation esse consequat reprehenderit.
						</small>
					</div>

					<div class="md-form md-bg mt-0">
						<input type="time" id="from" name="from" class="form-control" required>
						<label for="from">from</label>
						<small class="desc">
							Sit ipsum elit tempor aliquip veniam labore in.
						</small>
					</div>

					<div class="md-form md-bg mt-0">
						<input type="time" id="to" name="to" class="form-control" required>
						<label for="to">to</label>
						<small class="desc">
							In voluptate nulla ea ut Lorem velit cillum do.
						</small>
					</div>

					<div class="md-form md-bg">
						<select class="form-control" name="room_id" id="room_id" required>
							<%@ page import="ict.db.RoomDb"%>
							<%@ page import="ict.bean.Room"%>
							<%@ page import="java.util.ArrayList"%>
							<%@ page import="ict.util.DatabaseConfig"%>
							<%
								ArrayList<Room> rooms = new RoomDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD).get();

								for (int i = 0; i < rooms.size(); i++) {
									%>
										<option value="<%=rooms.get(i).getId()%>"><%=rooms.get(i).getName()%></option>
									<%
								}
							%>
						</select>
						<label for="room_id">Room</label>
					</div>

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