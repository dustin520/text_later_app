
$(document).ready(function(){
	$(".loading").hide();
	$(".sendText").hide();

	$(".yobutton").on("click", function(){
		$(".content-body").val("Don't forget to come to Cameron's Potluck!  Bring your food!");
	})

	$(".birthdaybutton").on("click", function(){
		$(".content-body").val("Happy Birthday!")
	})

	$(".xmasbutton").on("click", function(){
		$(".content-body").val("Merry Christmas!")
	})

	$(".reminderbutton").on("click", function(){
		$(".content-body").val("Don't Forget!")
	})

	$(".thinkbutton").on("click", function(){
		$(".content-body").val("Thinking of you right now.")
	})

	$(".dogbutton").on("click", function(){
		$(".content-body").val("Walk the dog.")
	})


})