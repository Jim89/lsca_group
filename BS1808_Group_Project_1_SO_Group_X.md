# BS1808 Logistics and Supply Chain Analytics Group Assignment One
Jone Leung, Somto Okoye, Valentin Poirelle, Jin Lee, Jim Leach  
`r Sys.Date()`  

<br>
<br>
<p style="border:1.5px; border-style:solid; border-color:#000000; padding: 1em;">The `R` code used to perform this analysis can be viewed in this report using the _Code_ buttons to toggle code viewing. This `HTML` report is best viewed using a modern web browser such as Mozilla Firefox or Google Chrome. It is also available on the [online repository](https://github.com/Jim89/lsca_group). Printing is possible but will not produce an optimal reading experience.</p>

# Introduction

## Project overview

TODO


```r
# Set default knitr options
knitr::opts_chunk$set(echo = TRUE, message = FALSE, warning = FALSE, fig.align = "center")

# Load packages
library(dplyr)
library(tidyr)
library(ggplot2)
library(knitr)
library(broom)
library(readr)

# Set up theme object for prettier plots
theme_jim <-  theme(legend.position = "bottom",
    axis.text.y = element_text(size = 16, colour = "black"),
    axis.text.x = element_text(size = 16, colour = "black"),
    legend.text = element_text(size = 16),
    legend.title = element_text(size = 16),
    title = element_text(size = 16),
    strip.text = element_text(size = 16, colour = "black"),
    strip.background = element_rect(fill = "white"),
    panel.grid.minor.x = element_blank(),
    panel.grid.major.x = element_line(colour = "grey", linetype = "dotted"),
    panel.grid.minor.y = element_line(colour = "lightgrey", linetype = "dotted"),
    panel.grid.major.y = element_line(colour = "grey", linetype = "dotted"),
    panel.margin.y = unit(0.1, units = "in"),
    panel.background = element_rect(fill = "white", colour = "lightgrey"),
    panel.border = element_rect(colour = "black", fill = NA))

# Function that takes a string and converts it in to "proper case" (i.e.
# the first letter is capitalised, all remaining letters are lower case)
# N.b. for multi-word strings, only the first word will be affected
toproper <- function(x) { 
  first <- substring(x, 1, 1) %>% toupper()
  rest <- substring(x, 2) %>% tolower()
  whole <- paste0(first, rest)
  return(whole)
}
```

# TODO

The data were read in to `R`.


```r
# Read the data
forecasts <- read_csv("./data/exhibit10.csv")

# Transform the names for easier typying later
names(forecasts) <- gsub(" ", "_", names(forecasts)) %>% tolower()
```
