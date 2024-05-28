# Load Packages ----
library(shiny)
library(shinydashboard)
library(shinyBS)
library(shinyWidgets)
library(boastUtils)
library(ggplot2)

# Load additional dependencies and setup functions
project_data <- read.csv("https://raw.githubusercontent.com/Migueldesanta/Introducting_Michael/developing/project_data.csv")

# Define UI for App ----
ui <- list(
  ## Create the app page ----
  dashboardPage(
    skin = "blue",
    ### Create the app header ----
    dashboardHeader(
      title = "Introducing Michael Yun", # You may use a shortened form of the title here
      titleWidth = 250,
      tags$li(class = "dropdown", actionLink("info", icon(class = "fa-solid", name = "comments"))),
      tags$li(
        class = "dropdown",
        boastUtils::surveyLink(name = "App_Template")
      ),
      tags$li(
        class = "dropdown",
        tags$a(href = 'https://shinyapps.science.psu.edu/',
               icon("house")
        )
      )
    ),
    ### Create the sidebar/left navigation menu ----
    dashboardSidebar(
      width = 250,
      sidebarMenu(
        id = "pages",
        menuItem("Overview", tabName = "overview", icon = icon("gauge-high")),
        menuItem("Personal Profile", tabName = "personal_profile", icon = icon("book")),
        menuItem("Project", tabName = "project", icon = icon("wpexplorer")),
        menuItem("Pop Quiz", tabName = "pop_quiz", icon = icon("gears")),
        menuItem("References", tabName = "references", icon = icon("leanpub"))
      ),
      tags$div(
        class = "sidebar-logo",
        boastUtils::sidebarFooter()
      )
    ),
    ### Create the content ----
    dashboardBody(
      tabItems(
        #### Set up the Overview Page ----
        tabItem(
          tabName = "overview",
          withMathJax(),
          h1("Introducing Michael Yun"), # This should be the full name.
          p("Do you want to know more about Michael, what are Michael's academic interests, 
            what was Michael's first project in college, 
            what are his FUN FACTS, you can find them all here!"),
          h2("Instructions"),
          p("How to get to know Michael:"),
          tags$ol(
            tags$li("Learn more about Michael using the Personal Profile Tab."),
            tags$li("Explore Michael's project using the Project Tab."),
            tags$li("Make a Pop Quiz")
          ),
          ##### Go Button--location will depend on your goals
          div(
            style = "text-align: center;",
            bsButton(
              inputId = "go1",
              label = "GO!",
              size = "large",
              icon = icon("bolt"),
              style = "default"
            )
          ),
          ##### Create two lines of space
          br(),
          br(),
          h2("Acknowledgements"),
          p(
            "This version of the app was developed and coded by Neil J.
            Hatfield  and Robert P. Carey, III.",
            br(),
            "We would like to extend a special thanks to the Shiny Program
            Students.",
            br(),
            br(),
            "Cite this app as:",
            br(),
            citeApp(),
            br(),
            br(),
            div(class = "updated", "Last Update: 11/8/2022 by NJH.")
          )
        ),
        #### Set up the Personal profile Page ----
        tabItem(
          tabName = "personal_profile",
          withMathJax(),
          h2("Personal Profile"),
          p("Something you should know about Michael:"),
          tags$ul(
            tags$li("Michael is a rising senior double majoring in Statistics and Politics."),
            tags$li("Michael's academic interests include voting behavior, U.S.-China relations, and Survey Methodology."),
            tags$li("Fun fact about Michael, he learned a party called Rent Is Too Damn High in American Politics class, And he used this as his final paper discussion.")
          ),
          p("Here's a picture of Michael:"),
          img(src = "michael_picture.jpg", style = "display: block; margin: 0 auto;")
        ),
        #### Note: you must have at least one of the following pages. You might
        #### have more than one type and/or more than one of the same type. This
        #### will be up to you and the goals for your app.
        #### Set up Project Page ----
        tabItem(
          tabName = "project",
          withMathJax(),
          h2("Project"),
          p("This is Michael's first project in college using statistical skills."),
          p("This project focuses on How does car model, location, and mileage affect car prices, specifically examining how much of the variance in car prices can be attributed to differences in model and location after controlling for mileage?"),
          img(src = "project_image.jpg", style = "display: block; margin: 0 auto;")
        ),
        #### Set up Pop Quiz Page ----
        tabItem(
          tabName = "pop_quiz",
          withMathJax(),
          h2("Challenge Yourself"),
          p("The general intent of a Challenge page is to have the user take
            what they learned in an Exploration and apply that knowledge in new
            contexts/situations. In essence, to have them challenge their
            understanding by testing themselves."),
          p("Please answer the following questions:"),
          tags$ol(
            tags$li("What are Michael's academic interests?"),
            tags$li("What is a fun fact about Michael?"),
            tags$li("What is Michael's major?")
          )
        ),
        #### Set up the References Page ----
        tabItem(
          tabName = "references",
          withMathJax(),
          h2("References"),
          p("You'll need to fill in this page with all of the appropriate
            references for your app."),
          p(
            class = "hangingindent",
            "Bailey, E. (2015). shinyBS: Twitter bootstrap components for shiny.
            (v0.61). [R package]. Available from
            https://CRAN.R-project.org/package=shinyBS"
          ),
          br(),
          br(),
          br(),
          boastUtils::copyrightInfo()
        )
      )
    )
  )
)

# Define server logic ----
server <- function(input, output, session) {
  
  ## Set up Info button ----
  observeEvent(
    eventExpr = input$info,
    handlerExpr = {
      sendSweetAlert(
        session = session,
        type = "info",
        title = "Information",
        text = "This App Template will help you get started building your own app"
      )
    }
  )
  
  
}

# Boast App Call ----
boastUtils::boastApp(ui = ui, server = server)