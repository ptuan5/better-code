# Tessa Nichols-Meade
# 01-20-2026
# Bar charts by Experimental Model over a range of years

# Explanation of inputs to create_plots function

# "path": the complete path to the spreadsheet being used to generate graphs (e.g."C:/User/Opioid")
# "file": the name of the file (i.e. spreadsheet) used to generate graphs (e.g."master_list.csv")
# "start_year": the start of the year range
# "end_year": the end of the year range

# Libraries
library(ggplot2)
library(dplyr)
library(lubridate)
library(tidyr)
library(data.table)
library(viridis)

create_plots <- function(path, file, start_year, end_year){
  
  # Set path to the directory where relevant files are located (e.g. "C:/Users/nichote/OneDrive - The Jackson Laboratory/GeneWeaver/Opioid")    
  setwd(path)
  
  # Read in data file (i.e. master list for plots; from alcohol, opioid, or cocaine master lists)  
  readfile <- fread(file) 
  allyears<-data.frame(readfile)

  # Determine drug category from input file for graph titles
  allyears <- allyears %>%
    mutate(drug = case_when(
      any("opioid" %in% search_text) ~ "Opioid",
      any("cocaine" %in% search_text) ~ "Cocaine",
      any("alcohol" %in% search_text) ~ "Alcohol",
      TRUE ~ "Unknown" # The 'else' condition, catches anything not met by previous conditions
    ))
  
  drug <- allyears[1,"drug"]

  # Format date column, take only year from each full date  
  allyears$created <- as.Date(allyears$created, format = "%m/%d/%Y")
  allyears <- allyears %>% mutate(created = format(created, "%Y"))

  # Subset original table to genesets from 2015 or later  
  recentyears <- allyears[allyears$created >= start_year,]
  recentyears <- recentyears[grepl("^NA", rownames(recentyears))==F,]

  # List of unique terms in orginal data and subset data  
  model_allyears <- unique(allyears$model)
  model_recent <- unique(recentyears$model)

  # List of all years between 2015 and 2025  
  years_df <- data.frame(year = start_year:end_year)
  years <- years_df$year

  # Create a dataframe with a count column ("n") that provides geneset count per term per year  
  cumulative_data <- recentyears %>%
    count(created, model) %>%
    arrange(created) %>% 
    group_by(created, model)

  # Dataframe that includes complete year and term combos 
  all_grid <- expand_grid(model = model_recent,
                          created = as.character(years))

  # Join the GS count and all_grid (all year-term combos) dataframes, if NA, replace with 0  
  counts_complete <- all_grid %>%
    left_join(cumulative_data, by = c("created", "model")) %>%
    mutate(n = dplyr::coalesce(n, 0L))
  
  # Take the joined dataframes and add another column (Cumulative_Count) that calculates cumulative sums per term per year  
  df_cumulative <- counts_complete %>%
    group_by(model) %>%
    arrange(created) %>%
    mutate(Cumulative_Count = cumsum(n))

  # Plots
  
  # Title for cumulative plot - will update the year range depending on user input when calling function
  cum_title <- paste("Cumulative Number of", drug, "Genesets Uploaded by Experimental Model: ", start_year, "-", end_year)

  # By Model
  cum_count_model <- ggplot(df_cumulative, aes(x = created, y = Cumulative_Count, fill = model)) +
    geom_col(color = "white", linewidth = 0.05) + 
    scale_fill_viridis_d(option = "plasma") + # Options: "magma", "cividis", "plasma", "inferno"
    labs(title = cum_title, x = "Year", y = "Cumulative Count", fill = "Experimental Model") +
    theme(plot.title = element_text(hjust = 0.5))

  # Title for count plot - will update the year range depending on user input when calling function  
  count_title <- paste("Number of", drug, "Genesets Uploaded by Experimental Model: ", start_year, "-", end_year)
  
  count_model <- ggplot(df_cumulative, aes(x = created, y = n, fill = model)) +
    geom_col(color = "white", linewidth = 0.05) + 
    scale_fill_viridis_d(option = "plasma") + # Options: "magma", "cividis", "plasma", "inferno"
    labs(title = count_title, x = "Year", y = "Count", fill = "Experimental Model") +
    theme(plot.title = element_text(hjust = 0.5))
  
  return(list(cum_count_model, count_model))
}

create_plots("mock_data", "MasterOpioid.csv", 2015, 2025)
