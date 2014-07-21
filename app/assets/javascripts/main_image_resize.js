// Adjusts the main image font size and shows/hides the main image button based on window size
function handleMainImageFontSizeAndButton() {
    // Get the text
    var mainImageText = $("#main-image-text");

    // Get the button
    var mainImageLearnMoreButton = $("#main-image-learn-more-button");

    if ($(window).width() < 500) {
        // If the window get too small, hide the button and shrink the text
        mainImageLearnMoreButton.hide();
        mainImageText.css('font-size', 24);
    }
    else
    {
        // If the window is big enough, show the button and enlarge the text
        mainImageLearnMoreButton.show();
        // This is the default font size for the main image float text - this should match what's in #main-image-text in
        // pages.css.scss.
        mainImageText.css('font-size', 36);
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
