# Get the source file for loading data
source('Load_data.R')

plot2 <- function(Data_plot=NULL) {
    # Load the data into a temp variable
    if (is.null(Data_plot)) {
        Data_plot <- load_data()
    }
    
    # Plot graph as per requirement
    plot(Data_plot$Date.Time, Data_plot$Global_active_power,
         type="l",
         xlab="",
         ylab="Global Active Power (kilowatts)")
    
    # If the plot looks fine, copy the plot to a png file
    dev.copy(png, file="plot2.png", width=480, height=480)
    dev.off()
    
    # Provide the destination where the plot has been saved
    cat("Plot2.png has been saved in", getwd())
}

