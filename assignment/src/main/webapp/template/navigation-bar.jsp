<jsp:useBean id="user" scope="session" class="ict.bean.User"/>

<div id="navigation-bar" class="container-fluid d-flex vh-100 p-0">
	<div class="row m-auto w-100">
		<div class="col-12 col-md-6 col-lg-4 p-0">
			<div class="pl-4">
				<a class="hyperlink" href="index.jsp">
					<h1 class="font-weight-bold title mb-0" style="color: #101010">Attendance System</h1>
				</a>
				<hr class="vector-right-black mt-1">
				<p class="mb-0 font-weight-light desc mb-3">
					Lorem ipsum dolor sit amet consectetur adipisicing elit. Laboriosam esse numquam eum aspernatur ullam nam consectetur non quia repellat officiis. Magnam amet sapiente temporibus quod aperiam ut porro quidem consequatur! Lorem ipsum dolor sit amet consectetur, adipisicing elit. Velit eum veritatis modi pariatur iusto accusantium similique. Aliquid magnam rerum, error dolores facere at alias ex saepe doloremque eveniet cupiditate voluptatibus.
				</p>

				<div class="profile w-100 p-4 text-white" style="background-color: #101010">
					<h3 class="title">Hello, ${user.getUsername() == null ? "Guest" : user.getUsername()} <%=session.getAttribute("role") != null ? " ( " + session.getAttribute("role") + " )" : ""%>.</h3>
					<div class="my-2" style="width: 4rem; border: 3px solid #efefef;"></div>
					<p class="desc">
						Lorem ipsum dolor, sit amet consectetur adipisicing elit. Corporis delectus maiores facere soluta necessitatibus, nobis excepturi saepe, eveniet quis error cumque placeat. Quae quos repellendus repudiandae optio ut reprehenderit minima.
					</p>

					<hr class="vector">

					<span>
						<% if (user.getUsername() == null) { %>
							<h4 class="title d-inline float-right mb-0"><a class="hyperlink text-white animate" href="login.jsp">LOGIN</a></h4>
						<% } else { %>
							<h4 class="title d-inline float-right mb-0"><a class="hyperlink text-white animate" href="logout">Logout</a></h4>
						<% } %>
						<div class="clearfix"></div>
					</span>
				</div>

				<hr class="vector-right-black">
			</div>

			<a class="hyperlink" href="index.jsp" ${user.getUsername() == null ? "data-toggle=\"modal\" data-target=\"#unauthorized\"" : ""}>
				<div class="p-4 text-white my-2 navigate-card animate" style="background-color: #101010; border-right: .5rem solid #cc0000;">
					<div>
						<h4 class="font-weight-bold title d-inline">View enrolled courses</h4>
						<h4 class="font-weight-bold title d-inline float-right">Naivgate <i class="fas fa-arrow-circle-right"></i></h4>
					</div>
				</div>
			</a>

			<a class="hyperlink" href="nav-am.jsp" ${user.getUsername() == null ? "data-toggle=\"modal\" data-target=\"#unauthorized\"" : ""}>
				<div class="p-4 text-white my-2 navigate-card animate" style="background-color: #101010; border-right: .5rem solid #00cccc;">
					<div>
						<h4 class="font-weight-bold title d-inline">account management</h4>
						<h4 class="font-weight-bold title d-inline float-right">Naivgate <i class="fas fa-arrow-circle-right"></i></h4>
					</div>
				</div>
			</a>

			<a class="hyperlink" href="nav-af.jsp" ${user.getUsername() == null ? "data-toggle=\"modal\" data-target=\"#unauthorized\"" : ""}>
				<div class="p-4 text-white my-2 navigate-card animate" style="background-color: #101010; border-right: .5rem solid #cc00cc;">
					<div>
						<h4 class="font-weight-bold title d-inline">attendance functions</h4>
						<h4 class="font-weight-bold title d-inline float-right">Naivgate <i class="fas fa-arrow-circle-right"></i></h4>
					</div>
				</div>
			</a>

			<a class="hyperlink" href="nav-cm.jsp" ${user.getUsername() == null ? "data-toggle=\"modal\" data-target=\"#unauthorized\"" : ""}>
				<div class="p-4 text-white my-2 navigate-card animate" style="background-color: #101010; border-right: .5rem solid #cccc00;">
					<div>
						<h4 class="font-weight-bold title d-inline">class management</h4>
						<h4 class="font-weight-bold title d-inline float-right">Naivgate <i class="fas fa-arrow-circle-right"></i></h4>
					</div>
				</div>
			</a>
		</div>

		<!-- Guest panel -->
		<div class="col h-100 pl-5 disabled"></div>
	</div>
</div>

<% if (user.getUsername() == null) { %>
	<jsp:include page="./modal.jsp">
		<jsp:param name="id" value="unauthorized"/>
		<jsp:param name="title" value="Error dialog"/>
		<jsp:param name="content" value="Unauthorized action, please login."/>
	</jsp:include>
<% } %>