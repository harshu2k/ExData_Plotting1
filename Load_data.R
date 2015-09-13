load_data <- function() {
    ###################################################
    # Download data from the website for repeatability
    if (!file.exists("./household_power_consumption.txt")) {
        if (!file.exists("./household_power_consumption.zip")) {
            fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
            download.file(fileUrl, destfile = "./household_power_consumption.zip")
            unzip("./Household_power_consumption.zip",exdir = ".")
        }
    }

    ##################################################
    # Read data into a table with appropriate classes
    power_data <- read.table('household_power_consumption.txt', header=TRUE,
                             sep=';', na.strings='?',
                             colClasses=c(rep('character', 2), 
                                          rep('numeric', 7)))
    
    # Convert the Date column to Date Class
    power_data$Date <- as.Date(power_data$Date, "%d/%m/%Y")
    
    # Add a column Date.Time to power_data with appropriate class
    power_data$Date.Time <- paste(power_data$Date, power_data$Time, sep=" ")
    power_data$Date.Time <- strptime(power_data$Date.Time, "%Y-%m-%d %H:%M:%S")
    
    # Subset the data as per our requirement
    req_dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
    power_data_subset <- subset(power_data, power_data$Date %in% req_dates)
    
    # Return the subsetted dataset
    return(power_data_subset)
}


