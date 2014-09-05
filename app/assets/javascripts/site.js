
$(document).ready(function(){
	$("#sent").hide()

	$(".yobutton").on("click", function(){
		$(".content-body").val("Don't forget to come to Cameron's Potluck at 1:00pm!  Bring your food!");
		$("#unsaved_msg_send_num").val("3238068310,7148569423,5163769388,4152987707,4156086603,4155040175,7758578354,9043149719,4805409085,8189877898,9258587492,4088387835,4152729003,4153750441,4152463234,4153054021,4158465918,6505337957,7752534158,4012155548,5107594556,6507044251,5102094735")
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

	// When click on Try It Button
	$("#tryItOut").on("click", function(){
		$("#sent").hide()
		$("#form").show()
	})


	$("#unsavebutton").on("click", function(e){
		e.preventDefault();
		

		console.log("Form is submitting...")

		var unsavedMessage = {
			send_num: $("#unsaved_msg_send_num").val(),
			content: $("#unsaved_msg_content").val(),
			"time(1i)": $("#unsaved_msg_time_1i").val(),
			"time(2i)": $("#unsaved_msg_time_2i").val(),
			"time(3i)": $("#unsaved_msg_time_3i").val(),
			"time(4i)": $("#unsaved_msg_time_4i").val(),
			"time(5i)": $("#unsaved_msg_time_5i").val(),
		}

		console.log("unsavedMessage", unsavedMessage)

		$.post('/unsaved_msgs', {unsaved_msg: unsavedMessage})
			.done(function(data){
				console.log("THIS IS THE DATA", data)
				$("#form").hide()
				$("#sent").show()
			})
	})


	// Scrolling for Learn More
$("#learn-more").click(function(event) {
$('html,body').animate({ scrollTop: $("#middle-section").offset().top }, 500);
});




})