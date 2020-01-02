<!-- Modal -->
<div class="modal fade" id="edit_role" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Edit Role</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
			</div>
			<form action="user" method="post">
				<input type="hidden" name="action" value="edit_role">

				<input type="hidden" name="id" ng-value="id" ng-init="id = ''">
				<input type="hidden" name="role" ng-value="role" ng-init="role = ''">

				<div class="modal-body">
					<div class="mb-1">
						<button type="submit" name="submit" class="w-100" value="student">Change to student</button>
					</div>
					<div class="mb-1">
						<button type="submit" name="submit" class="w-100" value="teacher">Change to teacher</button>
					</div>
					<div class="mb-1">
						<button type="submit" name="submit" class="w-100" value="admin">Change to administrator</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>