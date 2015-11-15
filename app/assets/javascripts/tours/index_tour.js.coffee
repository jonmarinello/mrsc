$ ->
  customSteps = [
    {
      element: "#title",
      title: "Welcome To Mission Ridge Software Consulting",
      content: "This is the general index page for our website. Be sure to check out our <b>Services</b>, <b>About</b>, <b>Portfolio</b>, <b>Contact</b> and <b>Start A Project</b> pages.",
      placement: "top"
    },
    {
      element: "#read-more",
      title: "Read More",
      content: "Click this to read more out about the various services we offer.",
      placement: "right"
    }
  ]

  window.createTour(customSteps)
