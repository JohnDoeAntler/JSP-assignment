<!-- Modal -->
<div class="modal fade" id="remove_schedule" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Remove schedule</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
			</div>
			<div class="modal-body">
				Remove the schedule?
			</div>
			<div class="modal-footer">
				<button type="button" class="border-danger" data-dismiss="modal">Close</button>
				<form action="schedule" method="post">
					<input type="hidden" name="action" value="remove_schedule">
					<input type="hidden" name="id" value="<%=request.getParameter("id")%>">
					<button type="submit">Remove</button>
				</form>
			</div>
		</div>
	</div>
</div>