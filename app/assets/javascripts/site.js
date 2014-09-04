
$(document).ready(function(){
	$("#sent").hide()

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





})