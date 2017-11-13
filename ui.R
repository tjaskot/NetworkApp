
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(igraph)
library(visNetwork)
library(reticulate)

virals <- list(
  "Viral One" = 1,
  "Viral Two" = 2
)
viz.layouts <- list(
  "Circle" = "circle",
  "Random" = "random",
  "Sphere" = "sphere",
  "Star" = "star",
  "Grid" = "grid",
  "Fruchterman-Reingold" = "f-r",
  "LGL" = "lgl",
  "Multidimensional scaling" = "mds"
)

shinyUI(navbarPage(
  # Application title
  title = "Network Visualization",
  theme = 'cosmo.css',
  tabPanel("Analysis",
    # Sidebar with a slider input for number of bins
    sidebarLayout(
      sidebarPanel(
        fileInput("nodes", "Input Node List", accept = c("test/csv",
                                                         "test/comma-separated-values, text/plain",
                                                         ".csv")),
        fileInput("edges", "Input Edge List", accept = c("test/csv",
                                                         "test/comma-separated-values, text/plain",
                                                         ".csv")),
        selectInput("Viral", "Select viral algorithm", virals),
        selectInput("layout", "Select network layout", viz.layouts),
        sliderInput("bins",
                    "Number of bins:",
                    min = 1,
                    max = 50,
                    value = 30)
      ),

      # Show a plot of the generated distribution
      mainPanel(
        plotOutput("distPlot")
      )
    )
  ),
  tabPanel("Help",
    wellPanel(
      p("Use the following buttons to download templates for your node and edge lists"),
      fluidRow(
        column(6, downloadButton('nl', "Download Node List Template")),
        column(6, downloadButton('el', "Download Edge List Template"))
      )
    )
  )
))
