library(reshape2)
library(grid)
library(scales)
library(gridExtra)
library(shiny)
library(shinyBS)
library(shinydashboard)
library(DT)
library(shinyjs)
library(plyr)
library(ggplot2)
library(FactoMineR)
library(factoextra)
library(mdatools)

ui <- dashboardPage(skin="black", title="Pheno 0 Analysis",
                    dashboardHeader(
                      title = tagList(
                        tags$span(
                          class = "logo-lg", "Pheno 0 Analysis"
                        )
                      ),
                      titleWidth = 450
                    ),
                    dashboardSidebar(
                      disable=T
                    ),
                    dashboardBody(
                      fluidRow(
                        tags$head(tags$style("#container * {display: inline;}")),
                        tags$style(HTML("
                                        .tabbable > .nav > li[class=active]    > a {background-color: #444444; color:white}
                                        .multicol{
                                        -webkit-column-count: 4; /* Chrome, Safari, Opera */
                                        -moz-column-count: 4; /* Firefox */
                                        column-count: 4;
                                        }
                                        .twocol{
                                        -webkit-column-count: 2; /* Chrome, Safari, Opera */
                                        -moz-column-count: 2; /* Firefox */
                                        column-count: 2;
                                        }
                                        .warning { 
                                        color: red;
                                        }"
                        )),
                        tabsetPanel(
                          tabPanel("Drought Analysis",
                                   br(),
                                   fluidRow(
                                     box(title="Preview Drought Data",width=8,solidHeader = T,status = 'success')
                                   ),
                                   fluidRow(
                                     box(width=8,title="some plot",solidHeader = T,status = "success")
                                   ),
                                   fluidRow(
                                     box(width=8,title="some plot 2",solidHeader=T,status="success")
                                   )
                          ),
                          tabPanel("Nitrogen Analysis", 
                                   fixedRow(
                                     br(),
                                     box(title="Preview Nitrogen Data",width=8,solidHeader = T,status = 'success')
                                   ),
                                   fluidRow(
                                     box(title="some plot",width=8,solidHeader = T,status = 'success')
                                   ),
                                   fluidRow(
                                     box(width=8,title="some plot",solidHeader = T,status = "success")
                                   )
                            )
                          )
                        )
                      )
                    )

server <- function(input, output){

  
  
  
  }


shinyApp(ui, server)