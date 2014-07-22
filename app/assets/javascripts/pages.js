// Adjusts the main image font size and shows/hides the main image button based on window size
function handleMainImageFontSizeAndButton() {
    // Get the text items
    var mainImageTextItems = $(".main-image-text");

    // Get the learn more buttons
    var mainImageLearnMoreButtons = $(".main-image-learn-more-button");

    if ($(window).width() < 550) {
        // If the window get too small, hide the buttons and shrink the text items
        mainImageLearnMoreButtons.hide();
        mainImageTextItems.css('font-size', 24);
    }
    else
    {
        // If the window is big enough, show the buttons and enlarge the text items
        mainImageLearnMoreButtons.show();
        // This is the default font size for the main image float text - this should match what's in #main-image-text in
        // pages.css.scss.
        mainImageTextItems.css('font-size', 36);
    }
}


$(document).ready(function() {
    // One time sizing at startup when document ready
    handleMainImageFontSizeAndButton()

    // Register for the resize event so we can adjust the main image text and button
    $(window).on('resize', function() {
        handleMainImageFontSizeAndButton()
    });

    // One time services text visibility at startup when document ready
    $("#rails-text").hide();
    $("#iphone-text").hide();
    $("#scrum-text").hide();
    $("#mind-map-text").hide();
    $("#prototyping-text").hide();
    $("#cloud-text").hide();

    // Register for services text click events to handle visibility
    $("#toggle-rails-text").unbind("click").click(function(){
        console.log($("#toggle-rails-text").text())
        if ($("#toggle-rails-text").text() == "Read More") {
            $("#rails-text").show('slow');
            $("#toggle-rails-text").text("Read Less")
        }
        else {
            $("#rails-text").hide('slow');
            $("#toggle-rails-text").text("Read More")
        }
        return false;
    });

    $("#toggle-iphone-text").unbind("click").click(function(){
        console.log($("#toggle-iphone-text").text())
        if ($("#toggle-iphone-text").text() == "Read More") {
            $("#iphone-text").show('slow');
            $("#toggle-iphone-text").text("Read Less")
        }
        else {
            $("#iphone-text").hide('slow');
            $("#toggle-iphone-text").text("Read More")
        }
        return false;
    });

    $("#toggle-scrum-text").unbind("click").click(function(){
        console.log($("#toggle-scrum-text").text())
        if ($("#toggle-scrum-text").text() == "Read More") {
            $("#scrum-text").show('slow');
            $("#toggle-scrum-text").text("Read Less")
        }
        else {
            $("#scrum-text").hide('slow');
            $("#toggle-scrum-text").text("Read More")
        }
        return false;
    });

    $("#toggle-mind-map-text").unbind("click").click(function(){
        console.log($("#toggle-mind-map-text").text())
        if ($("#toggle-mind-map-text").text() == "Read More") {
            $("#mind-map-text").show('slow');
            $("#toggle-mind-map-text").text("Read Less")
        }
        else {
            $("#mind-map-text").hide('slow');
            $("#toggle-mind-map-text").text("Read More")
        }
        return false;
    });

    $("#toggle-prototyping-text").unbind("click").click(function(){
        console.log($("#toggle-prototyping-text").text())
        if ($("#toggle-prototyping-text").text() == "Read More") {
            $("#prototyping-text").show('slow');
            $("#toggle-prototyping-text").text("Read Less")
        }
        else {
            $("#prototyping-text").hide('slow');
            $("#toggle-prototyping-text").text("Read More")
        }
        return false;
    });

    $("#toggle-cloud-text").unbind("click").click(function(){
        console.log($("#toggle-cloud-text").text())
        if ($("#toggle-cloud-text").text() == "Read More") {
            $("#cloud-text").show('slow');
            $("#toggle-cloud-text").text("Read Less")
        }
        else {
            $("#cloud-text").hide('slow');
            $("#toggle-cloud-text").text("Read More")
        }
        return false;
    });
});

