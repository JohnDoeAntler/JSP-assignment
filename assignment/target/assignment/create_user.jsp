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

	<div class="container-fluid vh-100 pr-0 d-flex">
		<div class="row w-100 my-auto">
			<div class="col-12 col-md-6 col-lg-4 p-0 disabled"></div>
			<div class="col pl-lg-5 pr-0">
				<h1 class="title-regular mb-1 mt-5">Create user</h1>

				<hr class="vector-black mt-0">

				<p class="desc font-weight-light">
					Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam vel adipisci atque commodi mollitia provident voluptatum. Quasi numquam voluptas minima odit, praesentium reprehenderit porro adipisci corporis nesciunt veritatis aliquam quibusdam!
					Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti harum fugiat, ad perferendis ea inventore minus iusto perspiciatis officiis blanditiis non aliquam ex obcaecati laborum enim architecto repellat eaque. Dolore?
				</p>

				<hr>

				<form action="user" method="POST">
					<input type="hidden" name="action" value="create">

					<div class="md-form md-bg mt-0">
						<input type="text" id="username" name="username" class="form-control" autofocus>
						<label for="username">Username</label>
						<small class="desc">
							Est mollit anim eu fugiat.
						</small>
					</div>

					<div class="md-form md-bg mt-0">
						<input type="password" id="password" name="password" class="form-control">
						<label for="password">Password</label>
						<small class="desc">
							Ut consequat consectetur aliquip ad minim tempor pariatur.
						</small>
					</div>

					<div class="custom-control custom-radio">
						<input type="radio" class="custom-control-input" id="student" name="role" value="student">
						<label class="custom-control-label" style="color: #808080;" for="student">Student</label>
					</div>

					<div class="custom-control custom-radio">
						<input type="radio" class="custom-control-input" id="teacher" name="role" value="teacher" checked>
						<label class="custom-control-label" style="color: #808080;" for="teacher">Teacher</label>
					</div>

					<div class="custom-control custom-radio">
						<input type="radio" class="custom-control-input" id="administrator" name="role" value="admin" checked>
						<label class="custom-control-label" style="color: #808080;" for="administrator">Administrator</label>
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