$ ->
  customSteps = [
    {
      element: "#title",
      title: "Our Core Services",
      content: "To learn more about the general core sevices we offer please scroll down.",
      placement: "top"
    },
    {
      element: "#toggle-rails-text",
      title: "Toggle See More/See Less",
      content: "For each service, click this to expand and collapse the additional information.",
      placement: "right"
    },
    {
      element: "#read-more",
      title: "Read More",
      content: "Click this to read more out about us.",
      placement: "right"
    }
  ]

  window.createTour('services', customSteps)
