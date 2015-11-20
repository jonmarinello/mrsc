#
# Tour constructor
#
window.createTour = (name, customSteps) ->
  window.tour = new Tour({
    name: name,
    debug: false,
    storage: false,
    steps: window.commonStepsPrefix.concat(customSteps).concat(window.commonStepsSuffix),
    keyboard: true,
    orphan: false
  })


$ ->
  #
  # Common Tour Steps
  #
  window.commonStepsPrefix = [
    {
      element: "#navbar-brand",
      title: "Navigation Bar",
      content: "Click on the various tabs to visit the <b>Home</b> and other pages. You can use the <b>Next</b> end <b>Prev</b> buttons to navigate through the tour. Alternaitvely you can use the <b>left</b> and <b>right</b> arrow keys wich you may find more convenient. You can end the tour at any time by clicking <b>End</b>.",
      placement: "bottom"
    },
    {
      element: "#main-carousel",
      title: "Carousel",
      content: "This is the carousel of images which you can click through to learn more about us and the services we provide. Use the right and left chevrons (<b><</b> and <b>></b>) to skip back and forward.",
      placement: "top"
    },
    {
      element: "#learn-more",
      title: "Image Buttons",
      content: "Click the little round buttons to visit other images directly.",
      placement: "top"
    }
  ]

  window.commonStepsSuffix = [
    {
      element: "#lets-talk-about-your-project",
      title: "Let's Talk ABout Your Project",
      content: "Click this to open a dialog to discuss your project ideas with us.",
      placement: "top"
    },
    {
      element: "#stay-connected",
      title: "Let's Stay Connected",
      content: "Click on the icons below to stay connected with us.",
      placement: "top"
    }
  ]


  #
  # Tour startup handler
  $("#start-tour-tab").on "click", () ->
    window.tour.start()
