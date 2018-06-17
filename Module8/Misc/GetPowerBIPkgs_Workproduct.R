library(rvest)
library(tidyverse)
library(devtools)
library(withr)

# Questions
# 1. When dependencies are loaded how are versions determined?

get.pbi.pkg.version <- function(pkgs) {

	if (is.character(pkgs)) { 
		# url to the site that has the list of packages
		url <- "https://docs.microsoft.com/en-us/power-bi/service-r-packages-support"

		# the repo we want to get our packages from
		repo <- "http://cran.us.r-project.org"

		# We want to create a directory for our packages
		dir.create("~/PBIPkgs/", showWarnings = FALSE)
		rpbi.pkgs = "~/PBIPkgs/"

		#Change this to a table from SQLAzure
		pbi.pkgs <-
			read_html(url) %>%
			html_nodes("table") %>%
			html_table() %>%
			.[[1]] %>%
			select(Package, Version) %>%
			filter(Package %in% pkgs)

		# new.pkg <- pkgs[!(pkgs %in% installed.packages(lib.loc = rpbi.pkgs)[, "Package"])]

		num.pkgs <- nrows(pbi.pkgs)

		for (i in seq(num.pkgs)) {
			withr::with_libpaths(
				new = rpbi.pkgs,
				install_version(
					pbi.pkgs$Package[i],
					version = pbi.pkgs$Version[i],
					repos = repo,
					dependencies = TRUE
				)
			)
		}

	} else {
		print("Can only pass a character vector that contains names of possible packages")
	}

}
