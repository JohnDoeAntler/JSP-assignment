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
				<h1 class="title-regular mb-1 mt-5">Class management</h1>

				<hr class="vector-black mt-0">

				<p class="desc font-weight-light">
					Lorem ipsum dolor, sit amet consectetur adipisicing elit. Dicta perspiciatis itaque amet, aut ipsam, consectetur repudiandae cumque blanditiis debitis facilis dolor, et sunt voluptate magnam id reprehenderit deserunt. Quas, odit?
					Lorem ipsum dolor sit amet consectetur adipisicing elit. Autem optio aliquid, error quasi alias sint soluta ex quam eos. Quasi neque vero fugiat assumenda atque a, quidem tempora doloribus cum.
				</p>

				<hr>

				<% if (!((String) session.getAttribute("role")).equalsIgnoreCase("student")) { %>
					<% if (((String) session.getAttribute("role")).equalsIgnoreCase("admin")) { %>
						<a href="create_room.jsp">
							<div class="text-white p-4 navigate-item mb-2">
								<h3 class="title-regular animate">Create room</h3>
								<div class="my-2" style="width: 4rem; border: 3px solid #efefef;"></div>
								<p class="desc">
									Lorem ipsum dolor, sit amet consectetur adipisicing elit. Corporis delectus maiores facere soluta necessitatibus, nobis excepturi saepe, eveniet quis error cumque placeat. Quae quos repellendus repudiandae optio ut reprehenderit minima.
								</p>
							</div>
						</a>
					<% } %>

					<a class="hyperlink" href="create_course.jsp">
						<div class="text-white p-4 navigate-item mb-2">
							<h3 class="title-regular animate">setup class</h3>
							<div class="my-2" style="width: 4rem; border: 3px solid #efefef;"></div>
							<p class="desc">
								Lorem ipsum dolor, sit amet consectetur adipisicing elit. Corporis delectus maiores facere soluta necessitatibus, nobis excepturi saepe, eveniet quis error cumque placeat. Quae quos repellendus repudiandae optio ut reprehenderit minima.
							</p>
						</div>
					</a>
				<% } %>
			</div>
		</div>
	</div>

</body>
<script>
	angular.module('app', []).controller('controller', ($scope) => {});
</script>

</html>