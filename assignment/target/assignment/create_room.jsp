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
				<h1 class="title-regular mb-1 mt-5">Create room</h1>

				<hr class="vector-black mt-0">

				<p class="desc font-weight-light">
					Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam vel adipisci atque commodi mollitia provident voluptatum. Quasi numquam voluptas minima odit, praesentium reprehenderit porro adipisci corporis nesciunt veritatis aliquam quibusdam!
					Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti harum fugiat, ad perferendis ea inventore minus iusto perspiciatis officiis blanditiis non aliquam ex obcaecati laborum enim architecto repellat eaque. Dolore?
				</p>

				<hr>

				<form action="room" method="POST">

					<div class="md-form md-bg mt-0">
						<input type="text" id="name" name="name" class="form-control">
						<label for="name">Room Name</label>
						<small class="desc">
							Incididunt cupidatat dolor excepteur cillum quis.
						</small>
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