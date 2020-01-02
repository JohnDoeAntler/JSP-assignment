<div class="modal fade" id="edit_course" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Edit course</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
			</div>
			<form action="course" method="post">
				<input type="hidden" name="id" value="<%=request.getParameter("id")%>">
				<input type="hidden" name="teacher_id" value="<%=request.getParameter("teacher_id")%>">

				<input type="hidden" name="action" value="edit_course">

				<div class="modal-body">
					<div class="md-form md-bg mt-0">
						<input type="text" id="shortname" name="shortname" class="form-control" value="<%=request.getParameter("shortname")%>" required>
						<label for="shortname">Short name</label>
						<small class="desc">
							Elit sint fugiat labore ullamco eu ea occaecat elit sit.
						</small>
					</div>
					
					<div class="md-form md-bg mt-0">
						<input type="text" id="fullname" name="fullname" class="form-control" value="<%=request.getParameter("fullname")%>" required>
						<label for="fullname">Fullname</label>
						<small class="desc">
							Aute nisi sunt qui labore esse deserunt minim non magna deserunt.
						</small>
					</div>

					<div class="md-form md-bg">
						<textarea id="summary" name="summary" class="form-control md-textarea" length="120" rows="3" required><%=request.getParameter("summary")%></textarea>
						<label for="summary">Summary</label>
					</div>

					<div class="custom-control custom-switch">
						<input type="checkbox" class="custom-control-input" id="hidden" name="hidden" value="true" <%=request.getParameter("hidden").equalsIgnoreCase("true") ? "checked" : ""%>>
						<label class="custom-control-label" for="hidden">Hidden</label>
					</div>
					<small class="desc">
						Commodo nisi id esse commodo ea consectetur amet.
					</small>
				</div>

				<div class="modal-footer">
					<button type="button" data-dismiss="modal">Close</button>
					<button type="submit">Save</button>
				</div>
			</form>
		</div>
	</div>
</div>