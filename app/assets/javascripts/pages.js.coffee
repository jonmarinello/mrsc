# Adjusts the main image font size and positioning based on window size
handleMainImageFontSizeAndPosition = () ->
  # Get the text item
  mainImageTextItem = $(".carousel-caption")

  width = $(window).width()
  switch
    when width <= 360
      mainImageTextItem.css "padding-bottom", "10%"
      mainImageTextItem.css "font-size", "1em"
    when width > 360 && width <= 560
      mainImageTextItem.css "padding-bottom", "10%"
      mainImageTextItem.css "font-size", "2em"
    when width > 560 && width <= 800
      mainImageTextItem.css "padding-bottom", "15%"
      mainImageTextItem.css "font-size", "2em"
    when width > 800 && width <= 1000
      mainImageTextItem.css "padding-bottom", "18%"
      mainImageTextItem.css "font-size", "3em"
    when width > 1000 && width <= 2000
      mainImageTextItem.css "padding-bottom", "20%"
      mainImageTextItem.css "font-size", "4em"
    else
      mainImageTextItem.css "padding-bottom", "21%"
      mainImageTextItem.css "font-size", "7em"


# Toggles the services "See More/See Less" label and associated text visibility
handleServiceExtendedShowHideText = (toggleText, text) ->
  if toggleText.text().trim() is window.readMoreLabel
    text.show()
    toggleText.text window.readLessLabel
  else
    text.hide()
    toggleText.text window.readMoreLabel
  false


# Setup array of services sections for use with "See More/See Less""
serviceExtendedTextItems = [
  "rails-text"
  "mobile-text"
  "agile-text"
  "cms-text"
  "prototyping-text"
  "cloud-text"
]


# Hide all service exteneded descriptions
hideAllServiceExtendedTextItems = () ->
  for textItem in serviceExtendedTextItems
    $("#" + textItem).hide()


$ ->
  # One time sizing
  handleMainImageFontSizeAndPosition()

  # Reset any previously running tour (get's rid of "ghost" steps)
  if (typeof window.tour != "undefined")
    window.tour.end()

  # Register for the resize event so we can adjust the main image text and button
  $(window).on "resize", ->
    handleMainImageFontSizeAndPosition()

  # One time set all services "See More/See Less" text to be "See More"
  hideAllServiceExtendedTextItems()

  # Setup our label comparison strings
  window.readMoreLabel = "See More"
  window.readLessLabel = "See Less"
  togglePrefix = "#toggle-"

  # Register for all the services "Read More/Read Less" click events to handle associated text visibility
  $(togglePrefix + serviceExtendedTextItems[0]).unbind("click").click ->
    handleServiceExtendedShowHideText $(togglePrefix + serviceExtendedTextItems[0]), $("#" + serviceExtendedTextItems[0])

  $(togglePrefix + serviceExtendedTextItems[1]).unbind("click").click ->
    handleServiceExtendedShowHideText $(togglePrefix + serviceExtendedTextItems[1]), $("#" + serviceExtendedTextItems[1])

  $(togglePrefix + serviceExtendedTextItems[2]).unbind("click").click ->
    handleServiceExtendedShowHideText $(togglePrefix + serviceExtendedTextItems[2]), $("#" + serviceExtendedTextItems[2])

  $(togglePrefix + serviceExtendedTextItems[3]).unbind("click").click ->
    handleServiceExtendedShowHideText $(togglePrefix + serviceExtendedTextItems[3]), $("#" + serviceExtendedTextItems[3])

  $(togglePrefix + serviceExtendedTextItems[4]).unbind("click").click ->
    handleServiceExtendedShowHideText $(togglePrefix + serviceExtendedTextItems[4]), $("#" + serviceExtendedTextItems[4])

  $(togglePrefix + serviceExtendedTextItems[5]).unbind("click").click ->
    handleServiceExtendedShowHideText $(togglePrefix + serviceExtendedTextItems[5]), $("#" + serviceExtendedTextItems[5])
