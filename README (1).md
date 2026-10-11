# Lavanya Sekhar - Resume Website

An interactive resume built with [R Shiny](https://shiny.posit.co/) and
[bslib](https://rstudio.github.io/bslib/). Includes a dashboard-style home page,
a searchable publications list and sections for experience, education, awards,
talks, research and training.

## Run locally

```r
install.packages(c("shiny", "bslib"))
shiny::runApp()
```

## Deploy

- **shinyapps.io:** `rsconnect::deployApp()`
- **Posit Connect / Shiny Server / Docker:** serve the folder containing `app.R`.

## Editing content

All resume content sits in the data section at the top of `app.R`.
Add a new paper by adding a `pub(...)` line to the `pubs` list.

## License

MIT - see [LICENSE](LICENSE).
