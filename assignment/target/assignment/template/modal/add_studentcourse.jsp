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

<div class="modal fade" id="add_studentcourse" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Edit student courses</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
			</div>
			<form action="studentcourse" method="post">
				<input type="hidden" name="action" value="create">

				<input type="hidden" name="student_id" value="<%=request.getParameter("id")%>">

				<div class="modal-body">
					<div class="md-form md-bg">
						<select class="form-control" name="course_id" id="course_id" required>
							<%@ page import="ict.db.CourseDb"%>
							<%@ page import="ict.bean.Course"%>
							<%@ page import="java.util.ArrayList"%>
							<%@ page import="ict.util.DatabaseConfig"%>
							<%
								ArrayList<Course> courses = new CourseDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD).get();
	
								for (int i = 0; i < courses.size(); i++) {
									%>
										<option value="<%=courses.get(i).getId()%>"><%=courses.get(i).getFullname()%></option>
									<%
								}
							%>
						</select>
						<label for="course_id">Course</label>
						<small>
							Irure cupidatat nostrud nulla excepteur proident sint dolor consectetur.
						</small>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="border-danger" data-dismiss="modal">Close</button>
					<button type="submit">Register course to student</button>
				</div>
			</form>
		</div>
	</div>
</div>