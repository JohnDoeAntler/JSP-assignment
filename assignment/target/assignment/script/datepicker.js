$(function () {
	$('.datePicker').datepicker();
});
cd();

function cd() {
	var date = new Date();
	var currentDate = date.getDate();
	var currentYear = date.getFullYear();
	var monthNames = $('.hasDatepicker').datepicker("option", "monthNames");
	var dayNames = $('.hasDatepicker').datepicker("option", "dayNames");
	var currentMonth = monthNames[date.getMonth()];
	var currentDay = dayNames[date.getDay()];
	var dh = $('.ui-datepicker').height();

	var current = '<div class="datepicker-current"><p class="current-day">' + currentDay + '</p><h3 class="current-date">' + currentDate + '</h3><div class="month-info"><span class="current-month">' + currentMonth + '</span><span class="current-year">' + currentYear + '</span></div></div>';
	// console.log(current);

	$('.datepicker-current').remove();
	$('.ui-datepicker').append(current);
	$('.datepicker-current').css("height", dh);
}

$(document).on("click", '.ui-corner-all , .hasDatepicker', function () {
	cd()
});