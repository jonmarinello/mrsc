$ ->
  customSteps = [
    {
      element: "#toggle-rails-text",
      title: "Toggle More.../Less...",
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

  window.createTour(customSteps)
