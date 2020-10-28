library(renv)
#renv::init()
#renv::modify() # MRAN: 2020-05-10
# CAVE: Do NOT run renv::update()!!!
#renv::dependencies()
#renv::status()
#renv::install("tidyverse")
#renv::install("packageRank")


library(tidyverse)
library(packageRank)


# 1st try out if data is available
(pkg_rank <- packageRank::packageRank(c("magrittr"), date = "2020-10-26"))


# read in data
pkg_tbl <- as_tibble(readxl::read_xlsx("data/2020-10-26_r_packages.xlsx", sheet = "Sheet1"))

# get package names
pkgs <- as.character(pkg_tbl$"Package Name")


(pkg_rank <- packageRank(pkgs, date = "2020-10-26"))
str(pkg_rank)
write.csv(as.data.frame(pkg_rank$package.data[,c(1:5)]), file = "2020-10-26_package_rank.csv")
