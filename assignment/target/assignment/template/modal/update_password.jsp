<!-- Modal -->
<div class="modal fade" id="update_password" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Update password</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
			</div>
			<form action="user" method="post">
				<input type="hidden" name="action" value="update_password">
				<div class="modal-body">
					<div class="md-form md-bg mt-0">
						<input type="text" id="old" name="old" class="form-control">
						<label for="old">Old Password</label>
						<small class="desc">
							In adipisicing labore deserunt ut magna magna in anim ut reprehenderit aliqua officia sit irure.
						</small>
					</div>

					<div class="md-form md-bg mt-0">
						<input type="text" id="new" name="new" class="form-control">
						<label for="new">New Password</label>
						<small class="desc">
							Pariatur dolore laboris eiusmod esse sint eiusmod ea.
						</small>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="border-danger" data-dismiss="modal">Close</button>
					<button type="submit">update</button>
				</div>
			</form>
		</div>
	</div>
</div>