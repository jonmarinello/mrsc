# Adjusts the main image font size and positioning based on window size
handleMainImageFontSizeAndPosition = ->
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


# Toggles the "Read More/Read Less" label and associated text visibility
handleShowHideText = (toggleText, text) ->
  if toggleText.text().trim() is window.readMoreLabel
    text.show()
    toggleText.text window.readLessLabel
  else
    text.hide()
    toggleText.text window.readMoreLabel
  false


$ ->
  # One time sizing
  handleMainImageFontSizeAndPosition()

  # Register for the resize event so we can adjust the main image text and button
  $(window).on "resize", ->
    handleMainImageFontSizeAndPosition()
    return


  # Setup array of services sections for use with "Read More/Read Less"
  textItems = [
    "rails-text"
    "iphone-text"
    "scrum-text"
    "mind-map-text"
    "prototyping-text"
    "cloud-text"
  ]

  # One time set all services "Read More/Read Less" text to be "Read More"
  index = undefined
  index = 0
  while index < textItems.length
    $("#" + textItems[index]).hide()
    ++index

  # Setup our label comparison strings
  window.readMoreLabel = "More..."
  window.readLessLabel = "Less..."
  togglePrefix = "#toggle-"

  # Register for all the services "Read More/Read Less" click events to handle associated text visibility
  $(togglePrefix + textItems[0]).unbind("click").click ->
    handleShowHideText $(togglePrefix + textItems[0]), $("#" + textItems[0])

  $(togglePrefix + textItems[1]).unbind("click").click ->
    handleShowHideText $(togglePrefix + textItems[1]), $("#" + textItems[1])

  $(togglePrefix + textItems[2]).unbind("click").click ->
    handleShowHideText $(togglePrefix + textItems[2]), $("#" + textItems[2])

  $(togglePrefix + textItems[3]).unbind("click").click ->
    handleShowHideText $(togglePrefix + textItems[3]), $("#" + textItems[3])

  $(togglePrefix + textItems[4]).unbind("click").click ->
    handleShowHideText $(togglePrefix + textItems[4]), $("#" + textItems[4])

  $(togglePrefix + textItems[5]).unbind("click").click ->
    handleShowHideText $(togglePrefix + textItems[5]), $("#" + textItems[5])

  return
