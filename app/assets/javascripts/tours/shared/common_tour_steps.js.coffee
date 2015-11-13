window.createTour = (customSteps) ->
  window.tour = new Tour({
    name: 'tour',
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
      content: "Click on the various tabs to visit the 'index' and other pages.",
      placement: "bottom"
    },
    {
      element: "#main-carousel",
      title: "Carousel",
      content: "This is the carousel of images which you can click through to learn about us. Use the right and left chevrons to skip forward and back.",
      placement: "top"
    },
    {
      element: "#learn-more",
      title: "Image Buttons",
      content: "Click the little round buttons to visit other images.",
      placement: "top"
    }
  ]

  window.commonStepsSuffix = [
    {
      element: "#lets-talk-about-your-project",
      title: "Let's Talk ABout Your Project",
      content: "Click this to discuss your project ideas.",
      placement: "top"
    },
    {
      element: "#stay-connected",
      title: "Let's Stay Connected",
      content: "Click on the icons below to stay connected with us.",
      placement: "top"
    }
  ]


  $("#start_tour_tab").on "click", (e) ->
    window.tour.end()
    window.tour.restart()
