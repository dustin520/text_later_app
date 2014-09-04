
$(document).ready(function(){


// Templates for Autofill Holiday Texts
	$("#saved.yobutton").on("click", function(){
		$(".content-body").val("Don't forget to come to Cameron's Potluck!  Bring your food!");
		$(".subject-body").val("WDI Potluck");
	});

	$("#saved.birthdaybutton").on("click", function(){
		$(".content-body").val("Happy Birthday!");
		$(".subject-body").val("Birthday");
	});

	$("#saved.xmasbutton").on("click", function(){
		$(".content-body").val("Merry Christmas!");
		$(".subject-body").val("Xmas");
	});

	$("#saved.reminderbutton").on("click", function(){
		$(".content-body").val("Don't Forget!");
		$(".subject-body").val("Reminder");
	});

	$("#saved.thinkbutton").on("click", function(){
		$(".content-body").val("Thinking of you right now.");
		$(".subject-body").val("Lifelong Partner");
	});

	$("#saved.dogbutton").on("click", function(){
		$(".content-body").val("Walk the dog.");
		$(".subject-body").val("Dog Activity");
	});


// Contact Templates
	$(".contacts").on("click", function(){
		var num = $(this).context.children[1].innerHTML;
			console.log(num)

		$(".phone-body").val(num)
		$(".content-body").val("Yo!");
		$(".subject-body").val("To Contact");
		// get contacts phone num - ajax?
		// $.getJSON("/users//contacts.json", function(data){
		// 	console.log(data)
		// });
	});


// Self Reminder Template - AJAX call to get own number 
	$(".alertSelf").on("click", function(){
		var mynum = $(this).context.children[1].innerText;

			console.log(mynum)

		$('.phone-body').val(mynum); // get own number
		$(".content-body").val("Make sure to deploy WDI project!");
		$(".subject-body").val("Reminder!");
	});

// Timed Reminder Templates - set time and subject=timer
	// $("#saved_msg_time_3i").on("click", function(){
	// 	$(".subject-body").val("Timer");

	// 	$("#saved_msg_time_3i").val("6");
	// });

	// $(".oneDay").on("click", function(){
	// 	$(".subject-body").val("Timer");
	// 	$("").val("");
	// });

	// $(".oneWeek").on("click", function(){
	// 	$(".subject-body").val("Timer");
	// 	$("").val("");
	// });



// Tool Tip
$(function () { 
  $("[data-toggle='tooltip']").tooltip(); 
  
	$("#saved.quote").tooltip('hover focus');
});

// Quotes 
	$("#saved.quote").on("click", function(e){
		e.preventDefault();
		console.log("test")
    $.ajax({
        url: "/quote",
        success: function (quote) {
        	console.log("data received: " + quote);
            randNum = Math.floor(Math.random()*quote.length);
            	console.log("Number quotes: " + quote.length);
            random = quote[randNum]
            if (random.length > 4) {
							$(".content-body").val('"' + random + '" -Bruce Lee');
						};
        }
    })
		$(".subject-body").val("Inspirational Quote");
	});

// Puns
	$("#saved.pun").on("click", function(e){
		e.preventDefault();
		console.log("test")
    $.ajax({
        url: "/pun",
        success: function (pun) {
        	// console.log("data received: " + pun);
            randNum = Math.floor(Math.random()*pun.length);
            	console.log("Number puns: " + pun.length);
            random = pun[randNum]
            if (random.length > 4) {
							$(".content-body").val(random);
							console.log(random)
						};
        }
    })
		$(".subject-body").val("Inspirational Pun");
	});



// Loading Bar
$('#textButton').click(function () {
    var btn = $(this)
    btn.button('loading')
  });

});