#
# Code relating to the preprints in response to COVID-19 timeline (www.covidpreprints.com)
# Maintained by the team @preLights (full team details in About page)
# 
#
# Thanks to Dean Attali for developing the timevis library and writing an excellent clear guide to hosting a shiny app website on Digital Ocean.
# The code and data used to create this site is hosted on github: https://github.com/coatesj/shiny-server 
# 
# Last code update: 05/04/2020
#
#
# This code also supports part of the manuscript "Preprinting a pandemic: the role of preprints in the COVID-19 pandemic", 27/03/2020. 
#
#
# For questions or quiries please contact Jonny Coates, jc2216@cam.ac.uk

#Load relevant libraries
library(shiny)
library(timevis)
library(shinythemes)

#Import data
readRDS("final_data.rds") -> final_data
readRDS("infotable.rds") -> info_table
readRDS("resources.rds") -> resources


#Import markdown files from Mount Sinai
#?

#Define UI
shinyApp(
  ui = navbarPage("Preprints & COVID-19",
                  theme = shinytheme("spacelab"),
                  tabPanel("Timeline",
                           fluidPage(
                             
                             titlePanel("Landmark preprints in response to COVID-19, maintained by the @preLights team"),
                             
                             tags$style(
                               ".event { background: darksalmon; }
      .preprint { background: darkturquoise; }
      .bad { background: moccasin; }"
                             ),
                             timevisOutput("timeline"),
                             
                             #Add buttons to allow user to control view
                             actionButton("btn", "Fit all items"),
                             actionButton("btn2", "Center on first reported case"),
                             actionButton("btn3", "Center on 1st Feb"),
                             actionButton("btn4", "Center on 1st March"),
                             actionButton("btn5", "Center on 1st April"),
                             actionButton("btn6", "Center on 1st May"),
                             
                             #Add rows underneath containing additional text
                             br(),
                             br(),
                             
                             fluidRow(
                               column(2,
                                      h4(" ")),
                               h3("Key: Orange = Event, Teal = Preprint, yellow = Important caveat/comment on preprint (see further information). Last updated: 01/04/2020")),
                             
                             #br(),
                             
                             fluidRow(
                               column(2,
                                      h4("")),
                               br(),
                               h3("This work is being maintained by Gautam Dey, Srivats Venkataramanan, Sundar Naganathan, Debbie Ho, Zhang-He Goh, Kirsty Hooper, Lars Hubatsch, Mariana De Niz, Sejal Davla, Mate Palfy & Jonny Coates. For questions or queries please contact prelights@biologists.com or Jonny Coates jc2216@cam.ac.uk")),
                             
                             br(),
                             
                             fluidRow(
                               column(2,
                                      h4("")),
                               h4("To use the timeline, navigate by clicking and dragging or through the use of the buttons. Hovering the mouse over an item will reveal more details pertaining to that point. Navigate between the timeline view and the table view using the navigation buttons at the top of this page. This timeline will be updated weekly.")),
                             
                             br(),
                             
                             img(src = "prelights.png", height = 70, width = 200),
                             
                             fluidRow(
                               column(2,
                                      h4("")),
                               p("preLights is a community service supported by The Company of Biologists, the not-for-profit publisher of Development, Journal of Cell Science, Journal of Experimental Biology, Disease Models & Mechanisms and Biology Open. The Company of Biologists is also a UK charity, providing grants and other support for the scientific community. 
                                 Follow preLights on Twitter at https://twitter.com/preLights"))
                           )),
                  
                  
                  
                  
                  # Page 2
                  
                  tabPanel("Further information",
                           DT::dataTableOutput("table")
                  ),
                  
                  # Page 3
                  tabPanel("Resources",
                           DT::dataTableOutput("resources")
                  ),
                  
                  # Page 4 - About
                  tabPanel("About",
                           fluidRow(
                             column(2,
                                    h4("")),
                             br(),
                             h3("We'd like to thank the tremendous effort of our team who are maintaining this database (twitter handles): Gautam Dey (@Dey_Gautam), Srivats Venkataramanan (@srivatsv), Sundar Naganathan (@Sundar_Ram_07), Debbie Ho, Zhang-He Goh (@zhanghe_goh), Kirsty Hooper (@KirstyHooper13), Lars Hubatsch (@LarsHubatsch), Mariana De Niz (@mariana_deniz), Sejal Davla (@JustABrainThing), Mate Palfy (@mate_palfy) & Jonny Coates (@JACoates91). In addition, our thanks go out to the wider scientific community who are diligently assessing and communicating important preprints during this difficult time. For questions or queries please contact prelights@biologists.com  or Jonny Coates jc2216@cam.ac.uk"),
                             br(),
                             h3("Please also find a curated prelist of interesting COVID-19 related preprints ",
                                a("here ", 
                                  href = "https://prelights.biologists.com/prelists/wuhan-coronavirus-2019-ncov/"),
                                ("or visit the preLights website "),
                                a("here.",
                                  href = "https://prelights.biologists.com")),
                             br(),
                             h3("The underlying code and data in support of this resource can be found on ",
                                a("github.",
                                  href = "https://github.com/coatesj/shiny-server"))),
                           
                           br(),
                           
                           fluidRow(
                             column(2,
                                    h4("")),
                             p("preLights is a community service supported by The Company of Biologists, the not-for-profit publisher of Development, Journal of Cell Science, Journal of Experimental Biology, Disease Models & Mechanisms and Biology Open. The Company of Biologists is also a UK charity, providing grants and other support for the scientific community. 
                                 Follow preLights on Twitter at https://twitter.com/preLights")),
                           br(),
                           
                           img(src = "prelights.png", height = 70, width = 200)),
                  
                  # Page 5, manually load Sinai review .md files
                  tabPanel("Mount Sinai peer-reviews of COVID-19 preprints",
                           fluidRow(
                             column(2, 
                                    h4("")),
                             br(),
                             h3("The following is a collection of the Mount Sinai Immunology researchers (@MountSinaiNYC). We thank the team for their important efforts in reviewing critical literature during such a turbulent period and for allowing us to link to these reviews. See https://observablehq.com/@ismms-himc/covid-19-sars-cov-2-preprints-from-medrxiv-and-biorxiv for more. Please use Crt+F to search."),
                             br(),
                             includeMarkdown("./sinai/10.1101-2020.01.28.923011.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.02.03.20020289v2.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.02.03.931766.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.02.05.20020545.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.02.07.939389.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.02.08.20021212.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.02.08.939553.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.02.08.939892.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.02.10.20021584.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.02.10.20021832v1.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.02.11.20022053.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.02.12.20022418.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.02.12.945576.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.02.16.20023671.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.02.16.20023903.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.02.16.951723.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.02.17.951939.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.02.18.20024364.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.02.19.20025239.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.02.19.20025288.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.02.19.955484.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.02.19.95658.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.02.20.20025841.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.02.23.20026690.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.02.25.20024711.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.02.25.20025643.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.02.25.963546v3.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.02.25.965434v2.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.02.26.20026989.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.02.27.20029009v2.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.02.28.20028514.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.02.29.20029520.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.01.20029074.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.01.20029769.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.01.20029785.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.02.20029975.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.03.20030437.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.03.20030668.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.03.962332.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.04.20030395.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.04.20030916.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.04.20031120.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.05.20031906.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.05.979260.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.06.20031856.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.08.20031229.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.09.20033068.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.11.20031096.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.11.987016.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.11.987958v1.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.12.20035048.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.13.990226.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.13.991570.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.14.20036129.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.14.988345.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.15.20033472.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.15.993097.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.16.20036145.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.16.20037135.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.16.990317.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.17.20037713.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.17.995639.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.18.20038018.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.18.20038190.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.18.20038455.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.19.20038315.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.20.999730.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.21.001628.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.21.20040261.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.21.20040691.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.21.990770.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.22.002204v1.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.22.002386.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.22.20040758.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.24.004655.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.24.20042119.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.24.20042283.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.24.20042382.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.24.20042655.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.24.20042937.md"),br(),
                             includeMarkdown("./sinai/10.1101-2020.03.28.013672.md"),br(),
                             includeMarkdown("./sinai/10.11012020.02.03.20020206.md"),br()
                             
                           ))
                  # Close UI
  ),
  
  
  # Server settings  
  server <- function(input, output, session) {
    output$timeline <- renderTimevis({
      timevis(final_data, fit = FALSE)
    })
    
    output$table <- DT::renderDataTable({
      DT::datatable(info_table, list(lengthMenu = c(10, 25, 30, 50, 75, 100), pageLength = 50))
    })
    
    output$resources <- DT::renderDataTable({
      DT::datatable(resources, list(lengthMenu = c(5, 10, 15, 20, 30), pageLength = 25))
    })
    
    #Make buttons work
    observeEvent(input$btn, {
      fitWindow("timeline", list(animation = TRUE))
    })
    observeEvent(input$btn2, {
      centerItem("timeline", 1, (animation = TRUE))
    })
    observeEvent(input$btn3, {
      centerTime("timeline", "02-01-2020", (animation = TRUE))
    })
    observeEvent(input$btn4, {
      centerTime("timeline", "03-01-2020", (animation = TRUE))
    })
    observeEvent(input$btn5, {
      centerTime("timeline", "04-01-2020", (animation = TRUE))
    })
    observeEvent(input$btn6, {
      centerTime("timeline", "05-01-2020", (animation = TRUE))
    })
  }
)
