$ ->
  customSteps = [
    {
      element: "#recommendation",
      title: "Recommnedations",
      content: "Hear what our customers have to say about us. Click on each accordian entry to expand it.",
      placement: "left"
    },
    {
      element: "#read-more",
      title: "Read More",
      content: "Click this to see our portfolio of work.",
      placement: "right"
    }
  ]

  window.createTour(customSteps)
