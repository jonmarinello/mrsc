// If the window is big enough, show the buttons/border-bottoms
function showCarouselButtonAndBottomBorder(mainImageLearnMoreButtons) {
    mainImageLearnMoreButtons.show();
    pageHeader = $(".main-image-text .page-header");
    pageHeader.css("padding-bottom", "9.5px");
    pageHeader.css("border-bottom", "1px solid #e6e6e6");
}


// Adjusts the main image font size and shows/hides the main image button based on window size
function handleMainImageFontSizeAndButton() {
    // Get the text items
    var mainImageTextItems = $(".main-image-text");

    // Get the learn more buttons
    var mainImageLearnMoreButtons = $(".main-image-learn-more-button");

    if ($(window).width() < 760) {
        if ($(window).width() < 560) {
            // If the window get too small, hide the buttons/border-bottoms and shrink the text items
            mainImageLearnMoreButtons.hide();
            pageHeader = $(".main-image-text .page-header");
            pageHeader.css("border-bottom", "none");
            pageHeader.css("padding-bottom", "0px");
            mainImageTextItems.css('font-size', "16px");
        }
        else {
            showCarouselButtonAndBottomBorder(mainImageLearnMoreButtons);
            mainImageTextItems.css('font-size', "24px");
        }
    }
    else
    {
        // If the window is big enough, show the buttons/border-bottoms and enlarge the text items
        showCarouselButtonAndBottomBorder(mainImageLearnMoreButtons);
        mainImageTextItems.css('font-size', "46px");
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
    var textItems = ["rails-text", "iphone-text", "scrum-text", "mind-map-text", "prototyping-text", "cloud-text"];

    var index;
    for (index = 0; index < textItems.length; ++index) {
        $("#" + textItems[index]).hide();
    }

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
