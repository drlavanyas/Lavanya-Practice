# Resume website for Lavanya Sekhar, built with R Shiny + bslib
# Run with: shiny::runApp()

library(shiny)
library(bslib)

# ---------------------------------------------------------------- DATA ----

profile <- list(
  name     = "Lavanya Sekhar",
  title    = "Assistant Professor of Physiology",
  org      = "Panimalar Medical College Hospital & Research Institute, Chennai",
  email    = "lavanyasekharphd@gmail.com",
  orcid    = "https://orcid.org/0000-0001-9714-2416",
  rg       = "https://www.researchgate.net/profile/Lavanya_Sekhar",
  languages = "English, Tamil & Malayalam",
  interests = c("Cardiorespiratory physiology", "Neurocognitive physiology",
                "Environmental physiology", "Sleep & stress physiology",
                "Cardiovascular perfusion")
)

education <- data.frame(
  Degree    = c("Ph.D", "M.Sc. (Medical Physiology)",
                "B.Sc. (Allied Health Science - Perfusion Technology)"),
  Institute = c("Sri Ramachandra Medical College and Research Institute, SRIHER (DU)",
                "Sri Ramachandra Medical College and Research Institute, SRIHER (DU)",
                "Sri Ramachandra Medical College and Research Institute (DU)"),
  Year      = c("2024", "2018", "2002"),
  Remarks   = c("Faculty of Medicine (awarded 19.10.2024)",
                "78% (Distinction); Dr. Malligesan Gold Medal",
                "76% (Distinction)"),
  stringsAsFactors = FALSE
)

fellowships <- data.frame(
  Fellowship = c("UC Berkeley Morris Fellowship", "MECC Fellowship",
                 "LVAD Training", "Perfusion Fellow"),
  Where      = c("School of Public Health, University of California, Berkeley, USA",
                 "University Hospital Bergmannsheil, Bochum, Germany (Prof. Dr. Axel Laczkovics)",
                 "University Medical Center Utrecht, Netherlands (Prof. Jaap R. Lahpor)",
                 "The Hospital for Sick Children, Toronto, Canada (Prof. Glen S. Van Arsdell)"),
  Training   = c("Epidemiological & statistical data analysis, R programming, systematic review & meta-analysis",
                 "Miniaturized extracorporeal circuit & ECMO",
                 "HeartMate II training",
                 "Neonatal CPB (closed circuit) & ECMO"),
  Year       = c("Aug-Dec 2019", "2009", "2009", "Aug-Sep 2006"),
  stringsAsFactors = FALSE
)

teaching <- list(
  list("Assistant Professor, Dept. of Physiology",
       "Panimalar Medical College Hospital & Research Institute, Chennai", "Feb 2025 - present"),
  list("Tutor, Dept. of Physiology",
       "Sri Ramachandra Medical College & RI, SRIHER (DU)", "2022 - Jan 2025"),
  list("Demonstrator, Dept. of Physiology",
       "Sri Ramachandra Medical College & RI, SRIHER (DU)", "2018 - 2022"),
  list("Tutor, Perfusion Technology",
       "Frontier Lifeline Hospital, Dr. K.M. Cherian Heart Foundation, Chennai", "2008 - 2015")
)

clinical <- list(
  list("Senior Perfusionist & ECMO Therapist",
       "Frontier Lifeline Hospital, Dr. K.M. Cherian Heart Foundation, Chennai", "2003 - 2015"),
  list("Staff Perfusionist",
       "Institute of Cardiovascular Diseases, Madras Medical Mission, Chennai", "2002 - 2003")
)

pub <- function(year, type, citation, index, url = NA_character_) {
  data.frame(year = year, type = type, citation = citation, index = index,
             url = url, stringsAsFactors = FALSE)
}

pubs <- do.call(rbind, list(
  pub(2026, "Journal article",
      "Johnson P, Chelladurai D, Sekhar L, Dubey N. Isotonic Exercise Modulates Psychological Stress and Serum Serotonin Levels in Young Healthy Females: A Randomized Controlled Trial. Int J Drug Deliv Technol. 2026;16(6):629-635.",
      "Scopus (Q3)", "https://doi.org/10.25258/ijddt.16.6.99"),
  pub(2026, "Journal article",
      "Exploring Digital Behavior among Medical Students: A Cross-Sectional Study. Biomedicine. 2026;46(2):146-152.",
      "UGC-CARE, Embase"),
  pub(2026, "Journal article",
      "WMS J, Sekhar L, Johnson P. Occupational Hazards and Musculoskeletal Burden: A Cross-Sectional Survey Among the Unorganized Workforce. Indian Journal of Orthopaedics. 2026 Mar 18:1-9.",
      "Scopus, Web of Science, PubMed/MEDLINE, DOAJ"),
  pub(2025, "Journal article",
      "Chandrasekaran V, Nithyashri S, Sekhar L, Paul P. Bridging the Gap: Knowledge, Attitude, and Practice of Breast Self-Examination in Female Medical Students across Academic Years. Biomedicine. 2025;45(4):297-304.",
      "UGC-CARE, Embase"),
  pub(2025, "Journal article",
      "Arthi GK, Lavanya S, Kumar AK, et al. Effectiveness of Speech Therapy Interventions in Parkinsonism: Mechanisms and Rehabilitation: A Systematic Review. Int. J. Environ. Sci. 2025 Sep 8:1359-76.",
      "Scopus"),
  pub(2025, "Journal article",
      "Kumari S, Lavanya S, Mathangi DC, et al. Impact of Stress and Screen Time on Sleep Among Medical Students - A Cross Sectional Study. Int. J. Environ. Sci. 2025 Sep 8:1564-8.",
      "Scopus"),
  pub(2024, "Journal article",
      "Sekhar L, Govindarajan Venguidesvarane A, Thiruvengadam G, Sharma Y, Venugopal V, Rengarajan S, et al. Respiratory symptoms and pulmonary function in paint industry workers exposed to volatile organic compounds: A systematic review and meta-analysis. PLoS ONE 19(12): e0315464.",
      "Scopus, PubMed, Web of Science", "https://doi.org/10.1371/journal.pone.0315464"),
  pub(2024, "Journal article",
      "Sekhar L, Venugopal V, R S, Johnson P. A study of neurological functions in construction work painters. Clinical Epidemiology and Global Health.",
      "Scopus, Web of Science", "https://doi.org/10.1016/j.cegh.2024.101670"),
  pub(2024, "Journal article",
      "Sekhar L, Lal T, Venugopal V, Santhanam R, Johnson P. Effect of Volatile Organic Compounds on Pulmonary Functions Among Paint Industry Workers of Unorganized Sectors. Cureus. 2024 Apr;16(4). PMID: 38800291.",
      "PubMed, Web of Science", "https://doi.org/10.7759/cureus.58951"),
  pub(2023, "Journal article",
      "Sekhar L, Kumar A, Venugopal V, Santhanam R, Johnson P. Effect of Volatile Organic Compounds on the Neurobehavioral Functions of Painters in Chennai, Tamilnadu: A Cross Sectional Study. National Journal of Community Medicine. 2023;14(10):658-65.",
      "Scopus", "https://doi.org/10.55489/njcm.141020233308"),
  pub(2023, "Journal article",
      "Nandakumar H, Kuppusamy M, Sekhar L, Ramaswamy P. Prevalence of premenstrual syndrome among students - Stress a potential risk factor. Clinical Epidemiology and Global Health. 2023;23:101368.",
      "Scopus, Web of Science", "https://doi.org/10.1016/j.cegh.2023.101368"),
  pub(2022, "Journal article",
      "Rekha D, Johnson P, Das S, Rajagopalan B, Sathya GR, Sekhar L. Comparative Study on Soluble Urokinase-Type Plasminogen Activator Receptor (SuPAR) and C-Reactive Protein (CRP) Levels in Stable Chronic Obstructive Pulmonary Disease. Biomedical and Pharmacology Journal. 2022;15(3):1277-81.",
      "Scopus", "https://dx.doi.org/10.13005/bpj/2464"),
  pub(2022, "Journal article",
      "Sathya GR, Johnson P, Das S, Rajagopalan B, Rekha D, Sekhar L, Manikandan M. Activities of Periostin and Interleukin-13 among Asthma Patients in Comparison with Healthy people in Southern India. Biomedical and Pharmacology Journal. 2022;15(3):1255-60.",
      "Scopus", "https://dx.doi.org/10.13005/bpj/2461"),
  pub(2020, "Journal article",
      "Arvind S, Maheshkumar K, Vaishali S, Lavanya S, Padmavathi R. Development and Validation of an Integrated Portable Heart Rate Variability (HRV) Analysis System - STREME. Medical Hypotheses. 2020:109887.",
      "Scopus", "https://doi.org/10.1016/j.mehy.2020.109887"),
  pub(2020, "Journal article",
      "Niva WJ, Sekar L, Manikandan A, Kumar M, Ganesan T, Shriraam V, Silambanan S, Padmavathi R. Mahamantra chanting as an effective intervention for stress reduction among nursing professionals - A Randomized controlled study. Advances in Integrative Medicine. 2020.",
      "Scopus", "https://doi.org/10.1016/j.aimed.2020.05.007"),
  pub(2019, "Journal article",
      "Sekar L, Niva W, Maheshkumar K, Thangavel G, Manikandan A, Silambanan S, Shriraam V, Ramaswamy P. Effect of Mahamantra Chanting on Autonomic and Cognitive Functions - An Interventional Study. Journal of Clinical & Diagnostic Research. 2019;13(5).",
      "Web of Science", "https://doi.org/10.7860/JCDR/2019/41236.12877"),
  pub(2011, "Journal article",
      "Vaijyanath P, Sekar L, Thomas MS. Aortic Arch Replacement with Moderate Hypothermia and a Modified Three-PUMP Circuit. The Journal of Tehran Heart Center. 2011;6(4):211. PMID: 23074371.",
      "Scopus, PubMed"),
  pub(2011, "Journal article",
      "Sekhar L, Jose S, Ramarathinam S, Thomas M, Dasarathan C, Vaijyanath P, Cherian KM. First Successful use of Indigenously Designed Miniaturized Extracorporeal Circuit in India. Indian Journal of Extra-Corporeal Technology. 2011;21(1):42-4.",
      "DOAJ, UGC-CARE",
      "https://www.indianjournals.com/ijor.aspx?target=ijor:iject&volume=21&issue=1&article=011"),
  pub(2023, "Conference proceeding",
      "Sekhar L, Jenolin AG, Santhanam R, et al. P-272 Health impacts of volatile organic compounds exposure among painters at construction site. Occupational and Environmental Medicine 2023;80:A51.",
      "Scopus, PubMed, Web of Science", "http://dx.doi.org/10.1136/OEM-2023-EPICOH.124"),
  pub(2023, "Conference proceeding",
      "Johnson P, Sekhar L, Durairaj N, et al. O-291 Effect of occupational exposure to volatile organic compounds and inorganic dusts on respiratory health. Occupational and Environmental Medicine 2023;80:A29.",
      "Scopus, PubMed, Web of Science", "http://dx.doi.org/10.1136/OEM-2023-EPICOH.69"),
  pub(2021, "Conference proceeding",
      "Effect of Volatile Organic Compound exposure and Hot Ambient Temperature on Health outcomes among Painters - A review. ITHES-2021 Conference Abstracts, 2021 Apr 29.",
      "DOAJ, UGC-CARE"),
  pub(2020, "Conference proceeding",
      "Sekar L, Johnson P, Ravinder S. A Cross Sectional Study To Assess Sleep Hygiene Among School going adolescents. ISEE Conference Abstracts 2020 Oct 26.",
      "Scopus, PubMed, Web of Science", "https://doi.org/10.1289/isee.2020.virtual.P-0318"),
  pub(0, "Book chapter",
      "Guyton & Hall Textbook of Medical Physiology, Third South Asian edition (Tamil translation). 4 chapters in GIT.",
      "Book chapters")
))
# The book chapter has year 0 so it sorts last; the year is hidden in the UI.
pubs$show_year <- pubs$type != "Book chapter"
pubs <- pubs[order(-pubs$year), ]

awards <- list(
  list("First prize, oral presentation - FIERYCON 2025", "Impact of VOC on peak expiratory flow rate among paint workers: a systematic review and meta-analysis. Sree Balaji Medical College, Chennai, 6 Dec 2025."),
  list("1st place, oral presentation - PREPARE 2022", "Effect of VOC exposure on motor coordination and neurotoxic symptoms among construction painters."),
  list("Registration grant - ISEE 2020", "32nd Annual Virtual Conference of the International Society for Environmental Epidemiology, Washington DC, USA."),
  list("SRU GATE research grant 2018 (Principal Investigator) and 2023 (Co-Investigator)", NULL),
  list("Dr. Malligesan Gold Medal", "Highest marks in M.Sc. Medical Physiology, SRMC & RI, SRIHER (DU), 2018."),
  list("Elite + Gold, NPTEL (94%)", "Health-Research Fundamentals, Swayam-NPTEL, March 2021."),
  list("Elite + Gold, NPTEL (90%)", "Basic Course in Biomedical Research, NMC / ICMR / NIE via Swayam-NPTEL, January 2021."),
  list("2nd place and cash award, best poster - TRENDO 2017", "Prevalence of stress and autonomic function among women nursing professionals."),
  list("1st place, best poster - 2nd International Conference on Stress, Yoga & Mind-Body Medicine", "Mudras - A Palliative care."),
  list("Dr. Gopinath Memorial Award (gold medal), ISECT 2012", "Best paper presentation, Kolkata."),
  list("Best paper presentation - Perfutech Chennai 2011", NULL),
  list("Late Mrs. Kaushalya Devi Mahajan Memorial Award (gold medal), ISECT 2006", "Best invention paper, Bangalore."),
  list("Mr. Lenin Best Paper Presentation Award, ISECT 2005", "Cochin."),
  list("Sri NPV Ramasamy Udayar, Founder Chancellor Cash Award, 1998", "Highest marks in Anatomy, Microbiology, Pathology, Pharmacology and Community Medicine, SRMC & RI.")
)

talks <- c(
  "Hybrid talk & offline workshop: Hematology Practical Experiments - Physiology Alumni Lecture Series, SRMC & RI, 25 Apr 2026",
  "Overview of Hematology Practicals - PREPARE 2025 (Physiology Postgraduate Ramachandra Enrichment Program and Academic Review)",
  "Effect of Deep Hypothermic Circulatory Arrest (DHCA) on the Central Nervous System - ISECT CON 2023, Coimbatore",
  "Women Empowerment in India - Sri Balaji Medical College & Hospital, 2020",
  "Neonatal Myocardial Protection: Techniques and Protocols - JIPMER, Puducherry, 2015",
  "ECMO a Boon or a Bane - ICVD, Frontier Lifeline Hospital, Chennai, 2014",
  "Role of ECMO in Heart Failure - National Heart Failure Symposium, Pushpagiri Medical College Hospital, Tiruvalla, 2012"
)

presentations <- c(
  "Health impacts of VOC exposure among painters at construction site (e-poster) - EPICOH-23, Mumbai",
  "Neurocognitive functions of construction painters - APTCARECON-22, Chettinad Hospital and Research Institute, 2022",
  "VOC exposure on motor coordination and neurotoxic symptoms among construction painters - PREPARE 2022",
  "Systematic review: VOC exposure and heat stress on health outcomes in painters - ITHESH 2021, NIT Warangal",
  "Sleep hygiene among school-going adolescents (poster) - ISEE 2020, USA",
  "Effect of Mahamantra chanting on cognition among women nursing professionals - BIOMETCON 2019",
  "Mahamantra chanting on autonomic functions and cortisol levels - YODAP 2019",
  "Effect of stress on cognitive functions - LEMECON 2018",
  "Life style diseases in India; Stress during ECMO (posters) - SYMMEDCON 2017",
  "Prevalence of stress and autonomic function among women nursing professionals (poster) - TRENDO 2017",
  "Mudras - A Palliative care (poster) - 2nd International Conference on Stress, Yoga & Mind-Body Medicine, 2017",
  "Cost effective ECMO system - ISECT CON 2015, Hyderabad",
  "Management of pediatric CPB - PERTECCON 2014, Puducherry",
  "Pre-bypass ultrafiltration impact in paediatric CPB - Perfutech 2013, Chennai",
  "Indigenously designed miniaturized extracorporeal circuit - ISECT 2012, Kolkata",
  "Implantation of Levitronix LVAD as a bridge: first successful case report in India - Perfutech 2011 / ISECT 2012",
  "Aortic arch replacement with moderate hypothermia and a modified 3-pump circuit (case report) - ISECT Pune, 2008",
  "Efficacious usage of residual CPB circuit blood - ISECT Bangalore, 2006",
  "Bubble trap for safety assurance in paediatric cardiac surgery - ISECT Cochin, 2005",
  "Role of modified ultrafiltration: case report of a paediatric Jehovah's Witness - ISECT Chennai, 2001"
)

projects_done <- c(
  "Association of heart rate variability, perceived stress scale score with serum cortisol level among individuals with stress",
  "Prevalence of stress and autonomic functions among women nursing professionals",
  "Effect of Mahamantra chanting on stress biomarkers, autonomic and cognitive functions among women nursing professionals",
  "Guide: Effect of VOCs on neurocognitive functions among painters - Summer Research Fellowship Grant, SRIHER 2020",
  "Effect of VOC exposure and hot ambient temperature on neurological and respiratory functions among male painters",
  "Systematic review & meta-analysis: effect of VOCs on neurobehavioral functions among painters",
  "Effect of isotonic exercise on dopamine and serotonin levels - RCT (Co-investigator, GATE 2023)",
  "Principal Investigator: Effect of Mind Body Medicine intervention on neurocognitive markers among healthy young participants (SRU GATE grant 2018)",
  "Sleep hygiene and sleep quality among school-going adolescents (Co-investigator)",
  "Sleep hygiene, stress levels and screen time among medical & paramedical students during COVID lockdown (Co-investigator)"
)

projects_ongoing <- c(
  "Effect of high intensity interval training on heart rate variability among young sedentary adults - a randomized controlled trial",
  "Impact of sleep quality on reaction time among medical undergraduates",
  "Effect of stress on cognitive retention - a cross-sectional study",
  "Association between nomophobia, sleeping difficulty and anxiety among medical students",
  "Current and desired levels of training and applied experience in chronic disease prevention among students"
)

training <- list(
  "UC Berkeley (Fall 2019)" = c(
    "PH270A Exposure Assessment and Control - Grade A (95%)",
    "Course 250A Epidemiological Methods - Grade B (89%)",
    "PH252c.19 Interventional Trial Design - Grade A (93%)",
    "CITI: Biomedical Research Investigators; Social & Behavioral Research Investigators; GCP for Clinical Investigations of Devices; Working with Amphibians in Research Settings"),
  "Coursera" = c(
    "Learning to Teach Online - UNSW Sydney",
    "Introduction to Human Physiology - Duke University",
    "Sleep: Neurobiology, Medicine and Society (with Honors) - University of Michigan Medical School",
    "Systematic Review & Meta-analysis - Johns Hopkins University",
    "Study Design in Epidemiology; Validity & Bias in Epidemiology; Measuring Disease in Epidemiology - Imperial College London",
    "Introduction to Data Analysis Using Excel - Rice University",
    "Introduction to Cognitive Psychology - Yale University",
    "How to Write and Publish a Scientific Paper - Ecole Polytechnique",
    "Basic Statistics - University of Amsterdam",
    "Power and Sample Size for Multilevel and Longitudinal Study Designs - University of Florida"),
  "NPTEL (India)" = c(
    "Electrocardiogram: Interpretation and Application in Clinical Practice - Jul-Aug 2023",
    "Health-Research Fundamentals - March 2021",
    "Basic Course in Biomedical Research, cycle 2 - January 2021"),
  "SRIHER (DU)" = c(
    "E-learning workshop, 2020; Use of Big Blue Button, 2020",
    "FDP - Blended Learning Program, 2019",
    "Basic Epidemiology, Statistics, SPSS & Critical Appraisal - SRMC & RI")
)

# ------------------------------------------------------------- HELPERS ----

timeline_item <- function(title, sub = NULL, meta = NULL) {
  div(class = "tl-item",
      div(class = "tl-title", title),
      if (!is.null(sub)) div(class = "tl-sub", sub),
      if (!is.null(meta)) span(class = "tl-meta", meta))
}

bullets <- function(x) tags$ul(class = "clean", lapply(x, tags$li))

plain_table <- function(df) {
  tags$div(class = "table-responsive",
    tags$table(class = "table table-sm align-middle",
      tags$thead(tags$tr(lapply(names(df), tags$th))),
      tags$tbody(lapply(seq_len(nrow(df)), function(i)
        tags$tr(lapply(df[i, ], function(v) tags$td(v)))))))
}

css <- "
  .hero { background: linear-gradient(135deg,#0f766e,#134e4a); color:#fff;
          border-radius:1rem; padding:2.5rem 2rem; margin-bottom:1.5rem; }
  .hero h1 { font-weight:700; margin-bottom:.25rem; }
  .hero .lead { opacity:.9; }
  .hero a { color:#fff; text-decoration:underline; }
  .chip { display:inline-block; background:#ccfbf1; color:#134e4a; border-radius:2rem;
          padding:.25rem .8rem; margin:.15rem; font-size:.85rem; }
  .tl-item { border-left:3px solid #0f766e; padding:.1rem 0 .1rem 1rem; margin-bottom:1rem; }
  .tl-title { font-weight:600; }
  .tl-sub { color:#555; }
  .tl-meta { font-size:.85rem; color:#0f766e; font-weight:600; }
  ul.clean { padding-left:1.1rem; } ul.clean li { margin-bottom:.45rem; }
  .pub { padding:.75rem 0; border-bottom:1px solid #e5e7eb; }
  .pub .badge { margin-right:.3rem; }
  .pub-year { font-weight:700; color:#0f766e; }
  footer { text-align:center; color:#777; padding:2rem 0 1rem; font-size:.85rem; }
"

# ------------------------------------------------------------------ UI ----

ui <- page_navbar(
  title = profile$name,
  theme = bs_theme(version = 5, primary = "#0f766e"),
  header = tags$head(tags$style(HTML(css)),
                     tags$title(paste(profile$name, "- Resume"))),
  footer = tags$footer(paste0("\u00a9 ", format(Sys.Date(), "%Y"), " ", profile$name,
                              " \u00b7 Built with R Shiny \u00b7 MIT licensed")),
  fillable = FALSE,
  bg = "#ffffff",

  nav_panel("Home",
    div(class = "hero",
      h1(profile$name),
      p(class = "lead", profile$title),
      p(profile$org),
      p(tags$a(href = paste0("mailto:", profile$email), profile$email), " \u00b7 ",
        tags$a(href = profile$orcid, target = "_blank", "ORCID"), " \u00b7 ",
        tags$a(href = profile$rg, target = "_blank", "ResearchGate"))
    ),
    layout_columns(
      col_widths = c(3, 3, 3, 3),
      value_box("Teaching", "8 + 8 years", p("Physiology and Perfusion Technology")),
      value_box("Clinical", "13 years", p("Perfusionist & ECMO therapist")),
      value_box("Research", "10 years", p("Environmental & stress physiology")),
      value_box("Journal articles", sum(pubs$type == "Journal article"), p("Peer-reviewed"))
    ),
    layout_columns(
      col_widths = c(7, 5),
      card(card_header("Publications per year"), plotOutput("pub_chart", height = "280px")),
      card(card_header("Field of interest"),
           div(lapply(profile$interests, function(i) span(class = "chip", i))),
           hr(),
           p(strong("Languages: "), profile$languages))
    )
  ),

  nav_panel("Experience",
    layout_columns(col_widths = c(6, 6),
      card(card_header("Teaching experience"),
           lapply(teaching, function(x) timeline_item(x[[1]], x[[2]], x[[3]]))),
      card(card_header("Clinical experience"),
           lapply(clinical, function(x) timeline_item(x[[1]], x[[2]], x[[3]])))
    )
  ),

  nav_panel("Education",
    card(card_header("Education"), plain_table(education)),
    card(card_header("Fellowships & overseas training"), plain_table(fellowships))
  ),

  nav_panel("Publications",
    layout_sidebar(
      sidebar = sidebar(
        textInput("pub_search", "Search", placeholder = "e.g. painters, stress"),
        selectInput("pub_type", "Type",
                    c("All", "Journal article", "Conference proceeding", "Book chapter")),
        textOutput("pub_count")
      ),
      uiOutput("pub_list")
    )
  ),

  nav_panel("Awards",
    card(card_header("Awards & recognitions"),
         lapply(awards, function(x) timeline_item(x[[1]], x[[2]])))
  ),

  nav_panel("Talks",
    layout_columns(col_widths = c(6, 6),
      card(card_header("Guest speaker"), bullets(talks)),
      card(card_header("Oral / poster presentations"), bullets(presentations))
    )
  ),

  nav_panel("Research",
    layout_columns(col_widths = c(7, 5),
      card(card_header("Accomplished projects"), bullets(projects_done)),
      card(card_header("Ongoing projects"), bullets(projects_ongoing))
    )
  ),

  nav_panel("Training",
    layout_columns(col_widths = c(6, 6),
      lapply(names(training), function(n)
        card(card_header(n), bullets(training[[n]])))
    )
  ),

  nav_spacer(),
  nav_item(tags$a(href = paste0("mailto:", profile$email), "Contact"))
)

# -------------------------------------------------------------- SERVER ----

server <- function(input, output, session) {

  output$pub_chart <- renderPlot({
    p <- pubs[pubs$show_year, ]
    yrs <- table(factor(p$year, levels = seq(min(p$year), max(p$year))))
    par(mar = c(4, 4, 1, 1))
    barplot(yrs, col = "#0f766e", border = NA, las = 2,
            ylab = "Publications", yaxt = "n")
    axis(2, at = seq(0, max(yrs), by = 1), las = 1)
  })

  filtered <- reactive({
    d <- pubs
    if (input$pub_type != "All") d <- d[d$type == input$pub_type, ]
    q <- trimws(input$pub_search)
    if (nzchar(q)) {
      hay <- tolower(paste(d$citation, d$index))
      d <- d[grepl(tolower(q), hay, fixed = TRUE), ]
    }
    d
  })

  output$pub_count <- renderText(paste(nrow(filtered()), "item(s)"))

  output$pub_list <- renderUI({
    d <- filtered()
    if (nrow(d) == 0) return(p("No publications match your search."))
    lapply(seq_len(nrow(d)), function(i) {
      r <- d[i, ]
      div(class = "pub",
        if (r$show_year) span(class = "pub-year", r$year, " "),
        span(class = "badge text-bg-light", r$type),
        span(class = "badge text-bg-info", r$index),
        p(r$citation, style = "margin:.4rem 0 .2rem;"),
        if (!is.na(r$url)) tags$a(href = r$url, target = "_blank", "View article")
      )
    })
  })
}

shinyApp(ui, server)
