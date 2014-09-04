
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


$(function () { 
  $("[data-toggle='tooltip']").tooltip(); 
  
	$("#saved.quote").tooltip('hover focus');
});


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



// Loading Bar
$('#textButton').click(function () {
    var btn = $(this)
    btn.button('loading')
  });

});