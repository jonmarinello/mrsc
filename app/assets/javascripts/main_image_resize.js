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


// One time sizing at startup when document ready
$(document).ready(function() {
    handleMainImageFontSizeAndButton()
});


// Register for the resize event so we can adjust the main image text and button
$(document).ready(function() {
    $(window).on('resize', function() {
        handleMainImageFontSizeAndButton()
    });
});
