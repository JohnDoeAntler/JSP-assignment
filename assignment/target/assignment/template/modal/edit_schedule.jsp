<link rel="stylesheet" href="./style/datepicker.css">
<script src='https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
<script src="./script/datepicker.js"></script>

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

<div class="modal fade" id="edit_schedule" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Edit schedule</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
			</div>
			<form action="schedule" method="post">
				<input type="hidden" name="action" value="edit_schedule">

				<input type="hidden" name="id" value="<%=request.getParameter("id")%>">

				<input type="hidden" name="course_id" value="<%=request.getParameter("course_id")%>">

				<div class="modal-body">
					<div class="md-form md-bg mt-0">
						<input type="text" id="date" name="date" value="<%=request.getParameter("date")%>" class="form-control datePicker" readonly required>
						<label for="date">date</label>
						<small class="desc">
							Ex veniam mollit sint consectetur deserunt cillum proident consectetur exercitation esse consequat reprehenderit.
						</small>
					</div>
	
					<div class="md-form md-bg mt-0">
						<input type="time" id="from" name="from" value="<%=request.getParameter("from")%>" class="form-control" required>
						<label for="from">from</label>
						<small class="desc">
							Sit ipsum elit tempor aliquip veniam labore in.
						</small>
					</div>
	
					<div class="md-form md-bg mt-0">
						<input type="time" id="to" name="to" value="<%=request.getParameter("to")%>" class="form-control" required>
						<label for="to">to</label>
						<small class="desc">
							In voluptate nulla ea ut Lorem velit cillum do.
						</small>
					</div>
	
					<div class="md-form md-bg">
						<select class="form-control" name="room_id" id="room_id" required>
							<%@ page import="ict.db.RoomDb"%>
							<%@ page import="ict.bean.Room"%>
							<%@ page import="java.util.ArrayList"%>
							<%@ page import="ict.util.DatabaseConfig"%>
							<%
								ArrayList<Room> rooms = new RoomDb(DatabaseConfig.DB_URL, DatabaseConfig.DB_USER, DatabaseConfig.DB_PASSWORD).get();
	
								for (int i = 0; i < rooms.size(); i++) {
									%>
										<option value="<%=rooms.get(i).getId()%>"><%=rooms.get(i).getName()%></option>
									<%
								}
							%>
						</select>
						<label for="room_id">Room</label>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="border-danger" data-dismiss="modal">Close</button>
					<button type="submit">Save</button>
				</div>
			</form>
		</div>
	</div>
</div>