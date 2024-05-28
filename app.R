# Load Packages ----
library(shiny)
library(shinydashboard)
library(shinyBS)
library(shinyWidgets)
library(boastUtils)
library(ggplot2)
# Load additional dependencies and setup functions
project_data <- read.csv("https://raw.githubusercontent.com/Migueldesanta/Introducting_Michael/developing/project_data.csv")
# source("global.R")

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
            tags$li("Michael is a rising seinor double majoring in Statistics and Politics."),
            tags$li("Michael's academic interest including voting behavior, 
                    U.S.-China relations, and Survey Methodology."),
            tags$li("Fun fact about Michael, he learned a party called Rent Is Too Damn High in American Politics class, 
                    And he used this as his final paper discussion.")
          ),
          p("Notice the use of an unordered list; users can move through the
            list any way they wish."),
          box(
            title = strong("Null Hypothesis Significance Tests (NHSTs)"),
            status = "primary",
            collapsible = TRUE,
            collapsed = TRUE,
            width = '100%',
            "In the Confirmatory Data Analysis tradition, null hypothesis
            significance tests serve as a critical tool to confirm that a
            particular theoretical model describes our data and to make a
            generalization from our sample to the broader population
            (i.e., make an inference). The null hypothesis often reflects the
            simpler of two models (e.g., 'no statistical difference',
            'there is an additive difference of 1', etc.) that we will use to
            build a sampling distribution for our chosen estimator. These
            methods let us test whether our sample data are consistent with this
            simple model (null hypothesis)."
          ),
          box(
            title = strong(tags$em("p"), "-values"),
            status = "primary",
            collapsible = TRUE,
            collapsed = FALSE,
            width = '100%',
            "The probability that our selected estimator takes on a value at
            least as extreme as what we observed given our null hypothesis. If
            we were to carry out our study infinitely many times and the null
            hypothesis accurately modeled what we're studying, then we would
            expect for our estimator to produce a value at least as extreme as
            what we have seen 100*(p-value)% of the time. The larger the
            p-value, the more often we would expect our estimator to take on a
            value at least as extreme as what we've seen; the smaller, the less
            often."
          )
        ),
        #### Note: you must have at least one of the following pages. You might
        #### have more than one type and/or more than one of the same type. This
        #### will be up to you and the goals for your app.
        #### Set up Project Page ----
        tabItem(
          tabName = "project",
          withMathJax(),
          h2("yo"),
          p("This is Michael's first project in college using statistical skills,
            this project focus on How does car model,location and mileage affect car prices, 
            specifically examining how much of the variance in car prices can be attributed 
            to differences in model and location after controlling for mileage?")
          
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
          p("What this page looks like will be up to you. Something you might
            consider is to re-create the tools of the Exploration page and then
            a list of questions for the user to then answer.")
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
