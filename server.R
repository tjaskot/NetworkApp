nl.template<-data.frame(ID = integer(),
                        Label = character())
el.template<-data.frame(Tail = integer(),
                        Head = integer(),
                        UpperCapacity = integer(),
                        LowerCapacity = integer(),
                        Label = character())


library(shiny)

shinyServer(function(input, output) {

  output$distPlot <- renderPlot({

    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')

    output$nl <- downloadHandler(
      filename = "NodeList-template.csv",
      content = function(file) {
        write.csv(nl.template, file)
      }
    )

    output$el <- downloadHandler(
      filename = "EdgeList-template.csv",
      content = function(file) {
        write.csv(el.template, file)
      }
    )

  })
})
