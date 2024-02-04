# Load Packages
library(datasets) # Loads the built-in datasets

# Load & Prepare data
?iris
df <- iris
head(df) # return 1st 6 rows

# Analyse Data
hist(df$Sepal.Width, main = "Sepal Data", xlab = "Sepal width(in cm)")

# Unload packages
detach("package:datasets", unload = T)

# Basic Math
2+2
1:100
seq(100)
print("Hello Coders")

# Assigning values
a <- 1
b <- 2
c <- d <- e <- 3 # Multiple Assignments

#Multiple values
x <- c(1,2,3,5) # c for combine & concatenate
x
0:10
seq(10)
10:0
seq(20,-10, by = -3)
y <- c(1,2,3,5)
y
x+y
x*y
2^6
sqrt(64)
log(100)
log10(100)

# DATA TYPES

# Numeric

n1 <- 15 # Double precision by default
n1
typeof(n1)

n2 <- 1.5
n2
typeof(n2)

# Character

c1 <- "c"
c1
typeof(c1)

c2 <- "a string of text"
c2
typeof(c2)

# Logical

l1 <- TRUE
l1
typeof(l1)

l2 <- F
l2
typeof(l2)


# DATA STRUCTURES
## Vector
# One dimensional set of same data type

v1 <- c(1, 2, 3, 4, 5) 
v1
is.vector(v1)

v2 <- c("a", "b", "c")
v2
is.vector(v2)

v3 <- c(TRUE, TRUE, FALSE, FALSE, TRUE)
v3
is.vector(v3)

## Matrix 
# Two dimensional set of same data type;  
# columns must be same length (no missing data)

m1 <- matrix(c(T, T, F, F, T, F), nrow = 2) 
m1

m2 <- matrix(c("a", "b", 
               "c", "d"), 
             nrow = 2,
             byrow = T)
m2

## Array
# Multi-dimensional set of same data type;  
# columns must be same length (no missing data)

# Give data, then dimensions (rows, columns, tables)
a1 <- array(c( 1:24), c(4, 3, 2))
a1

## Data Frame 
# Most common data type.
# Can combine vectors of different data types.
# Vectors must be the same length.

vNumeric   <- c(1, 2, 3)
vCharacter <- c("a", "b", "c")
vLogical   <- c(T, F, T)

# Use `cbind` to combine ("bind") columns
df1 <- cbind(vNumeric, vCharacter, vLogical)
df1  # Coerces all values to most basic data type

df2 <- data.frame(vNumeric, vCharacter, vLogical)
df2  # Makes a data frame with three different data types

## List 

# Most flexible data type (but can be difficult to use)

o1 <- c(1, 2, 3)
o2 <- c("a", "b", "c", "d")
o3 <- c(T, F, T, T, F)

list1 <- list(o1, o2, o3)
list1

list2 <- list(o1, o2, o3, list1)  # Lists within lists!
list2

# COERCING TYPES 
# "Coercing" means changing a variable's data type
## Automatic Coercion 
# Goes to "least restrictive" data type

(coerce1 <- c(1, "b", TRUE))
typeof(coerce1)

## Coerce Numeric to Integer 
(coerce2 <- 5)
typeof(coerce2)

(coerce3 <- as.integer(5))
typeof(coerce3)

## Coerce Character to Numeric 

(coerce4 <- c("1", "2", "3"))
typeof(coerce4)

(coerce5 <- as.numeric(c("1", "2", "3")))
typeof(coerce5)

## Coerce Matrix to Data Frame 

(coerce6 <- matrix(1:9, nrow= 3))
is.matrix(coerce6)

(coerce7 <- as.data.frame(matrix(1:9, nrow= 3)))
is.data.frame(coerce7)

# THIS IS A LEVEL 1 HEADER #################################

## This Is a Level 2 Header ================================

### This is a level 3 header. ------------------------------

# INSTALL PACKAGES #########################################
install.packages("pacman") 


# LOAD PACKAGES ############################################

library(pacman)    # Gives error if package is not installed; stops execution.

require(pacman)  # Typically used inside functions; gives a warning but not an error if package is not installed; code will execute but will crash when package is called.


# USING A FUNCTION WITHOUT LOADING A PACKAGE ###############
pacman::p_data(datasets) 

# Unload packages
detach("package:pacman", unload = T) 

remove.packages("pacman") 

# PIPE #####################################################
# It improves readability and makes better understanding

three(two(one(data,a),b),c) # It is hard to read
data|>
  one(a)|>
  two(b)|>
  three(c) # It is much easier to read and the vertical line is a pipe line

# LOAD PACKAGES ############################################

library(datasets)           # Loads the built-in datasets
?datasets                   # Give data about package
library(help = "datasets")  # Lists datasets


# SOME SAMPLE DATASETS #####################################

# iris
?iris
iris

# UCBAdmissions
?UCBAdmissions
UCBAdmissions

# Titanic
?Titanic
Titanic

# state.x77
?state.x77
state.x77

#swiss
?swiss
swiss

#women
?women
women

# CLEAN UP #################################################

# Clear base packages
detach("package:datasets", unload = T) 

# Load packages
library(tidyverse)    # Loads the `tidyverse` collection
library(readxl)     # `readxl` is installed as part of the tidyverse but needs to be loaded explicitly.

# LOAD CSV FILE ############################################

# Save data to "df" (for "data frame")

# Import CSV files with readr::read_csv() from tidyverse;
# data is saved as a "tibble"
df <- read_csv("data/state_trends.csv") 

# Check data
df           # See first ten lines of tibble
glimpse(df)  # See full variable names and types

# LOAD EXCEL FILE ##########################################

# Import Excel files (both .XLS and .XLSX) with 
# readr::read_excel() from tidyverse; saved as a tibble.

# Rename outcome as "y" (if it helps)
# Specify outcome with df$y

df2 <- read_excel(
  "data/state_trends.xlsx", 
  sheet = "all_data"
) |>
  as_tibble() |>
  select(state_code, 
         psych_region,
         extraversion:openness) |> 
  rename(y = psych_region) |>
  mutate(y = as.factor(y)) |>
  print()


# LOAD DATA ################################################

x = c(24, 13, 7, 5, 3, 2)  # Sample data
barplot(x)                 # Default barplot

# COLORS IN R ##############################################

# Color names R has 657 color names for 502 unique colors, arranged alphabetically except for white, which is first
?colors
colors()  # Get list of color names

# Web page with R colors swatches, color names, hex codes,RBG codes (in 0-255 and 0.00-1.00), and R index numbers; Browsable table on the page or in Google Sheets; downloadable as XLSX or PDF
browseURL("https://datalab.cc/rcolors")

# USE COLORS ###############################################

# Color names
barplot(x, col = "red3")  # red3
barplot(x, col = "slategray3")  # slategray3

# RGB triplets (0.00-1.00)
barplot(x, col = rgb(.80, 0, 0))      # red3
barplot(x, col = rgb(.62, .71, .80))  # slategray3

# RGB triplets (0-255)
barplot(x, col = rgb(205, 0, 0, max = 255))     # red3
barplot(x, col = rgb(159, 182, 205, max = 255)) # slategray3

# RGB hexcodes
barplot(x, col = "#CD0000")  # red3
barplot(x, col = "#9FB6CD")  # slategray3

# Index numbers
barplot(x, col = colors() [555])  # red3
barplot(x, col = colors() [602])  # slategray3

# MULTIPLE COLORS ##########################################

# Can specify several colors in a vector, which will cycle
barplot(x, col = c("red3", "slategray3"))
barplot(x, col = c("#9FB6CD", "#CD0000"))

# USING COLOR PALETTES #####################################

?palette  # Info on palettes
palette() # See current palette

barplot(x, col = 1:6)                # Use current palette
barplot(x, col = rainbow(6))         # Rainbow colors
barplot(x, col = heat.colors(6))     # Yellow through red
barplot(x, col = terrain.colors(6))  # Gray through green
barplot(x, col = topo.colors(6))     # Purple through tan
barplot(x, col = cm.colors(6))       # Pinks and blues

# LOAD DATA ################################################

# Also convert several adjacent variables to factors
df <- read_csv("data/state_trends.csv") |>
  mutate(across(c(region:psy_reg), factor)) |>
  print()

# BARPLOT OF FREQUENCIES ###################################

?plot     # Get info on "Generic X-Y Plotting
?barplot  # Get info on the "Bar Plots" function

# Shortest method to make a barplot
plot(df$psy_reg)

# Similar process using pipes
df |>
  select(psy_reg) |>
  plot()

# Similar code using barplot(); DOESN'T WORK
df |>
  select(psy_reg) |>
  barplot()  # Error: height must be a vector or a matrix

# Create frequency vector with table()
df |>
  select(psy_reg) |>
  table() |>  # Put data in appropriate format
  barplot()

# Sort bars by decreasing values (NOT for ordinal X)
df |>
  select(psy_reg) |>
  table() |>
  sort(decreasing = T) |>  # Sort table
  barplot()

# Add options to plot
df |>
  select(psy_reg) |>
  table() |>  # Put data in appropriate format
  sort(decreasing = F) |>  # Sort table
  barplot(
    main   = "Personalities of 48 Contiguous US States",
    sub    = "(Source: state_trends.csv)",
    horiz  = T,  # Draw horizontal bars
    ylab   = "Personality Profile",
    xlab   = "Number of States",
    xlim   = c(0, 25),  # Limits for X axis
    border = NA,  # No borders on bars
    col    = "#CD0000"  # red3
  )

# STACKED BARPLOT OF FREQUENCIES ###########################

# 100% stacked bar
df |>
  select(region, psy_reg) |>
  plot()

# Stacked bars: step 1: create table
df_t <- df |>
  select(psy_reg, region) |>
  table() |>
  print()  # Show table in Console

# Stacked bars: step 2a: create graph w/legend
df_t |> barplot(legend = rownames(df_t))

# Stacked bars: step 2b: create graph w/o legend
df_t |> barplot()

# SIDE-BY-SIDE BARPLOT OF FREQUENCIES ######################

# Side-by-side bar w/legend
df_t |>
  barplot(
    legend = rownames(df_t), 
    beside = T  # Put bars next to each other
  )

# Side-by-side bar w/o legend
df_t |> barplot(beside = T)

# HISTOGRAM ################################################

?hist

# Histogram with defaults
hist(df$data_science)

# Histogram with options
hist(df$data_science,
     breaks = 7,  # Suggest number of breaks
     main   = "Histogram of Searches for \"Data Science\"",
     sub    = "(Source: state_trends.csv)",
     ylab   = "Frequency",
     xlab   = "Searches for \"Data Science\"",
     border = NA,  # No borders on bars
     col    = "#CD0000"  # Sets fill color to red3
)

# DENSITY PLOT #############################################

?density

# Density plot with defaults
plot(density(df$data_science))

# Density plot with options
df |>
  pull(data_science) |>  # Use pull() instead of select()
  as.numeric() |>        # Coerces to numeric variable
  density() |>           # Draws density curve
  plot(
    main = "Density Plot of Searches for \"Data Science\"",
    sub  = "(Source: state_trends.csv)",
    ylab = "Frequency",
    xlab = "Searches for \"Data Science\"",
  )

# Use polygon to ADD a filled density plot

df |>
  pull(data_science) |>
  as.numeric() |>
  density() |>
  polygon(col  = "#CD0000")  # Sets fill color to red3


# BOXPLOT OF FREQUENCIES ###################################

?plot     # Get info on "Generic X-Y Plotting
?boxplot  # Get info on the "Box Plots" function

# Boxplot with defaults
boxplot(df$dance)

# Who is the outlier?
df |> 
  filter(dance > 90) |>
  select(state, dance)

# Boxplot with options
df |>
  select(dance) |>
  boxplot(
    horizontal = T,  # Horizontal
    notch  = T,      # Confidence interval for median
    main   = "Boxplot of Searches for \"Dance\"",
    sub    = "(Source: state_trends.csv)",
    xlab   = "Searches for \"Dance\"",
    col    = "#CD0000"  # red3
  )

# BOXPLOTS FOR MULTIPLE VARIABLES ##########################

df |>
  select(basketball:hockey) |>
  boxplot()

# Who are the outliers on "hockey"?
df |> 
  filter(hockey > 45) |>
  select(state, hockey) |>
  arrange(desc(hockey))

# BOXPLOTS BY GROUP ########################################

# Boxplots by group using plot()
df |>
  select(has_nhl, hockey) |>
  plot()

# Who is the outlier on "No"?
df |>
  filter(has_nhl == "No") |>
  filter(hockey > 80) |>
  select(state, hockey)

# Boxplots by group using plot()
df |>
  select(has_nhl, hockey) |>
  plot(
    horizontal = T,  # Horizontal
    notch  = T,      # Confidence interval for median
    main   = "Boxplot of Searches for \"Hockey\"",
    sub    = "(Source: state_trends.csv)",
    xlab   = "Searches for \"Hockey\"",
    ylab   = "State has NHL Hockey Team",
    col    = "#CD0000"  # red3
  )

df <- read_csv("data/state_trends.csv") |>
  select(basketball:hockey) |>
  glimpse()

# SCATTERPLOTS #############################################

# Plot all associations
df |> plot()

# Bivariate scatterplot with defaults
df |>
  select(soccer, hockey) |> 
  plot()

# Bivariate scatterplot with options
df |>
  select(soccer, hockey) |> 
  plot(
    main = "Scatterplot of Searches by State",
    xlab = "Searches for \"Soccer\"",
    ylab = "Searches for \"Hockey\"",
    col  = "red3",  # Color of points
    pch  = 20,      # "Plotting character" (small circle)
  )

?pch  # See plotting characters

# Add fit linear regression line (y ~ x) 
lm(df$hockey ~ df$soccer) |>
  abline()

# Load packages
library(datasets)   # Loads the built-in datasets

# SINGLE TIME SERIES #######################################

# uspop
?uspop  # Get info about data
uspop   # Display data

?ts  # Get info about time-series objects

# Plot with default plot()
plot(uspop)

# Plot with options
uspop |> 
  plot(
    main = "US Population 1790–1970 ",
    sub  = "(Source: datasets::uspop)",
    xlab = "Year",
    ylab = "Population (in millions)",
  )
abline(v = 1930, col = "lightgray")
text(1930, 10, "1930", col = "red3") 
abline(v = 1940, col = "lightgray")
text(1940, 10, "1940", col = "red3") 

# Plot with ts.plot()
?ts.plot
# Although this can be used for a single time series, plot
# is easier to use and is preferred.
ts.plot(uspop)

# Plot with plot.ts()
# More powerful alternative
?plot.ts
plot.ts(uspop)

# MULTIPLE TIME SERIES #####################################

# EuStockMarkets
# DAX (Germany), SMI (Switzerland), CAC (France), FTSE (UK)
?EuStockMarkets
EuStockMarkets

# Three different plot functions
plot(EuStockMarkets)     # Stacked windows
plot.ts(EuStockMarkets)  # Identical
ts.plot(EuStockMarkets)  # One window

# Plot with options
ts.plot(
  EuStockMarkets,
  col = rainbow(4))  # Color lines
legend(              # Add legend
  "topleft",         # Position
  legend = colnames(EuStockMarkets),  # Names for legend
  col = rainbow(4),  # Colors for legend
  lty = 1            # Line type: solid
)

# Select state codes and search data
df <- read_csv("data/state_trends.csv") |>
  select(state_code, artificial_intelligence:hockey)

# ANALYZE DATA #############################################

# Calculate clusters using hclust(), an agglomerative method
hc <- df |>  # Get data
  dist() |>  # Compute distance/dissimilarity matrix
  hclust()   # Compute hierarchical clusters

# Plot dendrogram
hc |> plot(labels = df$state_code)

# Draw boxes around clusters
hc |> rect.hclust(k = 2, border = "gray80")  # 2 boxes
hc |> rect.hclust(k = 3, border = 2:4)       # 3 boxes


# convert several adjacent variables to factors
df <- read_csv("data/state_trends.csv") |>
  select(state, region, psych_region, data_analysis) |>
  mutate(across(c(region:psych_region), as_factor)) |>
  print()

# FILTER BY ONE VARIABLE ###################################

# "data_analysis" is a numeric variable
df |>
  filter(data_analysis > 50) |>
  arrange(desc(data_analysis)) |>  # Sorts output
  print()

# "psych_region" is a text variable
df |>
  filter(psych_region == "Relaxed and Creative") |>
  arrange(desc(data_analysis)) |>  # Sorts output
  print()

# FILTER BY MULTIPLE VARIABLES #############################

# "or" is the vertical pipe |
df |>
  filter(region == "South" | 
           psych_region == "Relaxed and Creative") |>
  arrange(region, psych_region) |>  # Sorts output
  print(n = Inf)  # Print all rows

# "and" is the ampersand &
df |>
  filter(region == "South" & 
           psych_region == "Relaxed and Creative") |>
  print()

# "not" is the exclamation point !
df |>
  filter(region == "South" & 
           !psych_region == "Relaxed and Creative") |>
  arrange(psych_region, desc(data_analysis)) |>
  print()


# convert all character variables to factors
df <- read_csv("data/state_trends.csv") |>
  mutate(across(where(is_character), as_factor)) |>
  print()

# COMBINE CATEGORIES WITH RECODE ###########################

df |>
  mutate(relaxed = recode(psych_region,
                          "Relaxed and Creative" = "yes",
                          "Friendly and Conventional" = "no",
                          .default = "no")) |>  # Sets default value
  select(state_code, psych_region, relaxed)

# CREATE CATEGORIES WITH CASE_WHEN ########################

?case_when  # Help on `case_when`

df |>
  mutate(
    like_arts = case_when(
      art > 75 | dance > 75 | museum > 75 ~ "yes",
      TRUE ~ "no"  # All other values
    )
  ) |> 
  select(state_code, like_arts, art:museum) |>
  arrange(desc(like_arts)) |>  # Put yes at top
  print(n = Inf)               # Show all cases


# Create a small dataset with 1-7 data and a missing value
data <- tibble(
  x = 1:5, 
  y = 7:3, 
  z = c(2, 4, 3, 7, NA)
) |>
  print()

# AVERAGE ACROSS VARIABLES #################################

# Average variables with `rowMeans`
data %>% mutate(
  mean_xy  = rowMeans(across(x:y)),
  mean_xyz = rowMeans(across(x:z)),
  mean_xz  = rowMeans(across(c(x, z)))
)

# Remove missing values by adding `na.rm = T`
data %>% mutate(
  mean_xy  = rowMeans(across(x:y), na.rm = T),
  mean_xyz = rowMeans(across(x:z), na.rm = T),
  mean_xz  = rowMeans(across(c(x, z)), na.rm = T)
)

# REVERSE CODING ###########################################

data %>% 
  mutate(y_r = 8 - y) |>  # Create reversed variable
  select(x, y_r, z) |>    # Select and reorder variables
  mutate(                 # Compute average scores
    mean_xy  = rowMeans(across(c(x, y_r)), na.rm = T),
    mean_xyz = rowMeans(across(c(x, y_r, z)), na.rm = T),
    mean_xz  = rowMeans(across(c(x, z)), na.rm = T)
  )

# For a 1-n scale, use (n + 1) - x
# So, for a 1-7 scale, use 8 - x
# So, for a 1-10 scale, use 11 - x
#
# For a 0-n scale, use n - x
# So, for a 0-5 scale, use 5 - x
# So, for a 0-10 scale, use 10 - x
#
# For a -n to +n scale, use x * -1
# So, for a -3 to +3 scale, use x * -1
# So, for a -10 to +10 scale, use x * -1

# PACKAGES #################################################

# The "psych" package can make this process much easier and
# has many more options
browseURL("https://CRAN.R-project.org/package=psych")


# Also convert several adjacent variables to factors
df <- read_csv("data/state_trends.csv") |>
  select(region:psy_reg) |> 
  mutate(across(c(psych_region, psy_reg), as_factor)) |>
  print()

# SUMMARIZE DATAFRAME ######################################
summary(df) # Gives frequencies for factors only

# SUMMARIZE CATEGORICAL VARIABLE ###########################

# "region" is a character variable

# summary() not very useful
df |> 
  select(region) |>
  summary()

# table() works better
df |> 
  select(region) |>
  table()

# SUMMARIZE FACTOR #########################################

# "psych_region" is a factor

# Using summary() works best
df |>
  select(psych_region) |>
  summary()

# Using table()
df |>
  select(psych_region) |>
  table()

# Convert region to a factor
df <- df |>
  mutate(region = as_factor(region)) |>
  print()

# Summarize multiple factors
summary(df)

# Also convert several adjacent variables to factors
df <- read_csv("data/state_trends.csv") |>
  mutate(across(c(
    region, psych_region, psy_reg, has_nba:has_any
  ), 
  as_factor)
  ) |>
  print()

# SUMMARY ##################################################

# Summary for entire dataset
df |> summary()

# Summary for one variable
df |>
  select(statistics) |>
  summary()

# QUARTILES ################################################

# Tukey's five-number summary: minimum, lower-hinge, median, upper-hinge, maximum. No labels.
fivenum(df$statistics)

# Boxplot stats: hinges, n, CI for median, and outliers
boxplot(df$statistics, notch = T, horizontal = T)
boxplot.stats(df$statistics)

# PACKAGES #################################################

# The "psych" package gives many more options
browseURL("https://CRAN.R-project.org/package=psych")

# Also convert several adjacent variables to factors
df <- read_csv("data/state_trends.csv") |>
  select(  # Rename variables with `select`
    DS = data_science,  # New = old
    AI = artificial_intelligence,
    ML = machine_learning,
    DA = data_analysis,
    BI = business_intelligence,
    SS = spreadsheet,
    Stats = statistics) |> 
  print()

# CORRELATION MATRIX #######################################

# Scatterplot matrix
df |> plot()

# Correlation matrix
df |> cor()

# Rounded to 2 decimals
df |>
  cor() |>
  round(2)

# TEST AND CI FOR A SINGLE CORRELATION #####################

# Can test one pair of variables at a time.
# Gives r, hypothesis test, and confidence interval
cor.test(df$DS, df$DA)

# PACKAGES TO GET P-VALUES FOR MATRIX ######################

# The `Hmisc` package can get p-values for matrix
browseURL("https://cran.r-project.org/web/packages/Hmisc/")

# The `rstatix` package is another option (with graphs)
browseURL("https://cran.r-project.org/web/packages/rstatix/")

# Select the personality and Google Trends variables
df <- read_csv("data/state_trends.csv") |>
  select(extraversion:hockey) |>
  print()

# SCATTERPLOTS #############################################

# Scatterplot of "data_science" and personality variables
df |>
  select(data_science, extraversion:openness) |>
  plot()

# Quick graphical check on bivariate association
df |>
  select(openness, data_science) |>
  plot()

# Add regression line with lm(); usage: y ~ X
# Note different variable order (vs plot)
lm(df$data_science ~ df$openness) |> abline()

# BIVARIATE REGRESSION #####################################

# Compute and save bivariate regression
fit1 <- lm(df$data_science ~ df$openness)

# Show model
fit1

# Summarize regression model
summary(fit1)

# Confidence intervals for coefficients
confint(fit1)

# Predict values of "data_science"
predict(fit1)

# Prediction intervals for values of "data_science"
predict(fit1, interval = "prediction")

# Regression diagnostics
lm.influence(fit1)
influence.measures(fit1)

# MULTIPLE REGRESSION ######################################

# Moving the outcome, y, to the front and having nothing else but predictor variables, X, can make things easier
df <- df |>
  select(data_science, extraversion:openness) |>
  print()

# Note that if you want to just move one variable to the front and keep everything else in the same order, you can do this: select(data_analysis, everything()) |>

# Most concise
lm(df)

# Identify outcome, infer rest
lm(data_science ~ ., data = df)

# Identify entire model
lm(data_science ~ extraversion + agreeableness +
     conscientiousness + neuroticism + openness, data = df)

# Save model
fit2 <- lm(df)

# Show model
fit2

# Summarize regression model
summary(fit2)

# Also convert all variables to factors
df <- read_csv("data/state_trends.csv") |>
  select(region, psy_reg) |> 
  mutate(across(everything(), as_factor)) |>
  print()

# ANALYZE DATA #############################################

# Create contingency table
ct <- table(df$region, df$psy_reg)
ct

# Call also get cell, row, and column % With rounding to get just 2 decimal places Multiplied by 100 to make %

# Row percentages
ct |>
  prop.table(1) |>  # 1 is for row percentages
  round(2) * 100

# Column percentages
ct |>
  prop.table(2) |>  # 2 is for columns percentages
  round(2) * 100

# Total percentages
ct |>
  prop.table() |>  # No argument for total percentages
  round(2) * 100

# Chi-squared test (but n is small)
tchi <- chisq.test(ct)
tchi

# Get p-value  in one step

table(df$region, df$psy_reg) |> chisq.test()

# Additional tables
tchi$observed   # Observed frequencies (same as ct)
tchi$expected   # Expected frequencies
tchi$residuals  # Pearson's residual
tchi$stdres     # Standardized residual
# CLEAN UP #################################################

# Clear base packages
detach("package:datasets", unload = T)

# To clear the console
# press ctrl + L
cat("\014")