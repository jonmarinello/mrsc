$ ->
  customSteps = [
    {
      element: "#title",
      title: "Contact Us",
      content: "To learn more about the varous ways you can contact us please scroll down.",
      placement: "top"
    },
    {
      element: "#contact-us",
      title: "Contact Us.",
      content: "Contact us via mail, telephone or Skype.",
      placement: "left"
    },
    {
      element: "#read-more",
      title: "Read More",
      content: "Click this start a project with us.",
      placement: "right"
    }
  ]

  window.createTour('contact', customSteps)
