$ ->
  customSteps = [
    {
      element: "#title",
      title: "We Work Well With Others",
      content: "To learn more about the portfolio of our current and past work please scroll down.",
      placement: "top"
    },
    {
      element: "#we-work-well-with-others",
      title: "We Get ALong Well With Others.",
      content: "Below are some of the happy customers we've' served. Be sure to click the recommendations button to see what they have to say.",
      placement: "left"
    },
    {
      element: "#read-more",
      title: "Read More",
      content: "Click this find out how to contact us.",
      placement: "right"
    }
  ]

  window.createTour('portfolio', customSteps)
