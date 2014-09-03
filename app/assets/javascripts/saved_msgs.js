
$(document).ready(function(){

	$(".yobutton").on("click", function(){
		$(".content-body").val("Don't forget to come to Cameron's Potluck!  Bring your food!");
		$(".subject-body").val("WDI Potluck");
	});

	$(".birthdaybutton").on("click", function(){
		$(".content-body").val("Happy Birthday!");
		$(".subject-body").val("Birthday");
	});

	$(".xmasbutton").on("click", function(){
		$(".subject-body").val("Christmas");
		$(".content-body").val("Merry Christmas!");
	});

	$(".reminderbutton").on("click", function(){
		$(".content-body").val("Don't Forget!");
		$(".subject-body").val("Reminder");
	});

	$(".thinkbutton").on("click", function(){
		$(".content-body").val("Thinking of you right now.");
		$(".subject-body").val(L"ifelong Partner");
	});

	$(".dogbutton").on("click", function(){
		$(".content-body").val("Walk the dog.");
		$(".subject-body").val("Dog Activity");
	});


});