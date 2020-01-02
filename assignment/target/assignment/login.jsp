<!DOCTYPE html>
<html lang="en" ng-app="app">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<title>Document</title>

		<%@ include file="./template/header.jsp"%>
	</head>
	<jsp:useBean id="user" scope="session" class="ict.bean.User"/>
	<%
		if (user.getUsername() != null) {
			%>
				<jsp:forward page="index.jsp"/>
			<%
		}
	%>

	<body ng-controller="controller">
		<div class="container-field p-0 vh-100">
			<div class="row w-100">
				<div class="col-4 text-center">
					<img src="https://images.pexels.com/photos/1793525/pexels-photo-1793525.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940" class="w-100 vh-100" style="object-fit: cover;" alt="">
				</div>

				<div class="col mt-5 ml-2">
					<h1 class="title">Login</h1>

					<hr class="vector-black">

					<p class="desc">
						Lorem, ipsum dolor sit amet consectetur adipisicing elit. Accusantium, vel ullam iusto natus, neque ducimus odio quaerat modi esse aliquid dolores dolor eos delectus cumque accusamus nihil nostrum reprehenderit nulla! Lorem ipsum dolor, sit amet consectetur adipisicing elit. Numquam quasi eveniet non dignissimos illum adipisci fugit quaerat, quod, laudantium repellendus consequuntur quibusdam ut doloremque expedita maiores aliquid. Porro, distinctio blanditiis. Lorem ipsum dolor sit amet consectetur adipisicing elit. Assumenda ipsam quis, animi in molestias, vitae nesciunt quos cum repellat iusto tempora doloribus quasi esse corporis? Voluptatum nulla error ipsum ipsa! Lorem ipsum dolor sit, amet consectetur adipisicing elit. Temporibus voluptas sit, eligendi accusamus, excepturi quidem, iure libero in sint facere fugiat ullam. Dolorum sequi quae, optio quam nam deserunt officia. Lorem ipsum dolor sit amet consectetur adipisicing elit. Nihil optio porro quisquam non aliquid eos neque, pariatur accusantium voluptas quam error debitis quis amet ipsam nesciunt asperiores ab ea accusamus?
					</p>

					<hr>

					<form action="login" method="post">
						<div class="md-form md-bg mt-0">
							<input type="text" id="username" name="username" class="form-control" required autofocus>
							<label for="username">Username</label>
							<small class="desc">
								Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur nobis quod atque impedit, adipisci dignissimos id animi rerum! Repellendus nisi earum odit quis eveniet alias vel accusantium reprehenderit officiis magnam.
							</small>
						</div>

						<div class="md-form md-bg mt-0">
							<input type="password" id="password" name="password" class="form-control" required>
							<label for="password">Password</label>
							<small class="desc">
								Lorem ipsum dolor sit, amet consectetur adipisicing elit. Numquam dicta ducimus veniam natus ut quia nam voluptates molestias perferendis sapiente quos modi id cum odit quis, iure quam labore hic.
							</small>
						</div>

						<div class="custom-control custom-radio">
							<input type="radio" class="custom-control-input" id="student" name="role" value="student" checked required>
							<label class="custom-control-label" style="color: #808080;" for="student">Student</label>
						</div>

						<div class="custom-control custom-radio">
							<input type="radio" class="custom-control-input" id="teacher" name="role" value="teacher">
							<label class="custom-control-label" style="color: #808080;" for="teacher">Teacher</label>
						</div>

						<div class="custom-control custom-radio">
							<input type="radio" class="custom-control-input" id="administrator" name="role" value="admin">
							<label class="custom-control-label" style="color: #808080;" for="administrator">Administrator</label>
						</div>

						<hr>

						<button type="submit" class="ml-0 animate">login</button>

						<button type="reset" class="ml-0 animate">Reset</button>
					</form>
				</div>
			</div>
		</div>
	</body>
	<script>
		angular.module('app', []).controller('controller', ($scope) => {

		});
	</script>
</html>