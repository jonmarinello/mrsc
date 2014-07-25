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

    // Setup array of services sections for use with "Read More/Read Less"
    var textItems = ["rails-text", "iphone-text", "scrum-text", "mind-map-text", "prototyping-text", "cloud-text"];

    // One time set all services "Read More/Read Less" text to be "Read More"
    var index;
    for (index = 0; index < textItems.length; ++index) {
        $("#" + textItems[index]).hide();
    }

    // Setup our label comparison strings
    window.readMoreLabel = "More...";
    window.readLessLabel = "Less...";

    var togglePrefix = "#toggle-";

    // Register for all the services "Read More/Read Less" click events to handle associated text visibility
    //
    // TODO: Would love change this to using a for loop but unfortunately, by the time the Click event fires,
    // i is 6 for all the functions. Looking for a way to do this using meta-programming but timed out for now.
    $(togglePrefix + textItems[0]).unbind("click").click(function() {
        return handleShowHideText($(togglePrefix + textItems[0]), $("#" + textItems[0]));
    });

    $(togglePrefix + textItems[1]).unbind("click").click(function() {
        return handleShowHideText($(togglePrefix + textItems[1]), $("#" + textItems[1]));
    });

    $(togglePrefix + textItems[2]).unbind("click").click(function() {
        return handleShowHideText($(togglePrefix + textItems[2]), $("#" + textItems[2]));
    });

    $(togglePrefix + textItems[3]).unbind("click").click(function() {
        return handleShowHideText($(togglePrefix + textItems[3]), $("#" + textItems[3]));
    });

    $(togglePrefix + textItems[4]).unbind("click").click(function() {
        return handleShowHideText($(togglePrefix + textItems[4]), $("#" + textItems[4]));
    });

    $(togglePrefix + textItems[5]).unbind("click").click(function() {
        return handleShowHideText($(togglePrefix + textItems[5]), $("#" + textItems[5]));
    });
});
