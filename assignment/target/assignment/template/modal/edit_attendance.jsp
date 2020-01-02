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

<div class="modal fade" id="edit_attendance" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Edit attendance</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
			</div>
			<form action="attendance" method="post">
				<input type="hidden" name="action" value="edit">

				<input type="hidden" name="id" ng-value="id">

				<div class="modal-body">
					<div class="md-form md-bg mt-0">
						<input type="time" id="time" name="time" ng-value="time" class="form-control" required>
						<label for="time">Time</label>
						<small class="desc">
							Sit ipsum elit tempor aliquip veniam labore in.
						</small>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="border-dagner" data-dismiss="modal">Close</button>
					<button type="submit">Save</button>
				</div>
			</form>
		</div>
	</div>
</div>