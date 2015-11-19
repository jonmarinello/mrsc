$ ->
  customSteps = [
    {
      element: "#title",
      title: "About Us",
      content: "To learn more about us and what our customers have to say about us and the work we do please scroll down.",
      placement: "top"
    },
    {
      element: "#recommendation",
      title: "Recommnedations",
      content: "Hear what our customers have to say about us. Click on each accordian entry to expand it.",
      placement: "top"
    },
    {
      element: "#read-more",
      title: "Read More",
      content: "Click this to see our portfolio of work.",
      placement: "right"
    }
  ]

  window.createTour('about', customSteps)
