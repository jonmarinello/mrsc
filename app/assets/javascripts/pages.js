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


// Toggles the "Read More/Read Less" label and associated text visibility
function handleShowHideText(toggleText, text) {
    if (toggleText.text().trim() == window.readMoreLabel) {
        text.show();
        toggleText.text(window.readLessLabel)
    }
    else {
        text.hide();
        toggleText.text(window.readMoreLabel)
    }
    return false;
}


$(document).ready(function() {
    // One time sizing
    handleMainImageFontSizeAndButton();

    // Register for the resize event so we can adjust the main image text and button
    $(window).on('resize', function() {
        handleMainImageFontSizeAndButton()
    });

    // One time set services "Read More/Read Less" text to be hidden
    $("#rails-text").hide();
    $("#iphone-text").hide();
    $("#scrum-text").hide();
    $("#mind-map-text").hide();
    $("#prototyping-text").hide();
    $("#cloud-text").hide();

    // Setup our label comparison strings
    window.readMoreLabel = "More...";
    window.readLessLabel = "Less...";

    // Register for all the services "Read More/Read Less" click events to handle associated text visibility
    $("#toggle-rails-text").unbind("click").click(function() {
        return handleShowHideText($("#toggle-rails-text"), $("#rails-text"));
    });

    $("#toggle-iphone-text").unbind("click").click(function() {
        return handleShowHideText($("#toggle-iphone-text"), $("#iphone-text"));
    });

    $("#toggle-scrum-text").unbind("click").click(function() {
        return handleShowHideText($("#toggle-scrum-text"), $("#scrum-text"));
    });

    $("#toggle-mind-map-text").unbind("click").click(function() {
        return handleShowHideText($("#toggle-mind-map-text"), $("#mind-map-text"));
    });

    $("#toggle-prototyping-text").unbind("click").click(function() {
        return handleShowHideText($("#toggle-prototyping-text"), $("#prototyping-text"));
    });

    $("#toggle-cloud-text").unbind("click").click(function() {
        return handleShowHideText($("#toggle-cloud-text"), $("#cloud-text"));
    });
});
