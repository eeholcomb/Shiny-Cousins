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
                                   column(width=12,
                                     box(title="Preview Drought Data",width=8,solidHeader = T,status = 'success',
                                         actionButton("n_merge_data","Merge")
                                     ),
                                     box(width=8,title="some plot",solidHeader = T,status = "success"),
                                     box(width=8,title="some plot 2",solidHeader=T,status="success")
                                   )
                          ),
                          tabPanel("Nitrogen Analysis", 
                                     br(),
                                   column(width=12,
                                     box(title="Preview Nitrogen Data",width=8,solidHeader = T,status = 'success',
                                         actionButton("d_merge_data","Merge")
                                     ),
                                     box(title="some plot",width=8,solidHeader = T,status = 'success'),
                                     box(width=8,title="some plot",solidHeader = T,status = "success")
                                   )
                          )
                        )
                      )
                    )
                  )

server <- function(input, output){

  n_merged <- reactiveValues(data=NULL)
  
  observeEvent(input$n_merge_data,{
    n_sv_shapes <- read.csv("data/nitrogen/bart_sorghum_systems_download.csv",header=T,sep=",",stringsAsFactors=F)
    n_n_isotopes <- read.csv("data/nitrogen/sorghum_systems_download.csv",header=T,sep=",",stringsAsFactors=F)
    n_merged <- join(n_isotopes, sv_shapes,by="Barcodes")
    n_merged <- merged[!colnames(merged) %in% c("PlantID.1","marker_area","percent_below_bound_area","project","Camera","ExperimentCode","Type","last_updated.1","Nitrogen","Geno.1")]
  
    n_merged$data <- n_merged
  })
  
  }


shinyApp(ui, server)