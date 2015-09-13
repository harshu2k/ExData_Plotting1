# Get the source file for loading data
source('Load_data.R')

plot4 <- function(Data_plot=NULL) {
    # Load the data into a temp variable
    if (is.null(Data_plot)) {
        Data_plot <- load_data()
    }
    
    # Plot graph as per requirement
    # Open up a graphics device
    png("plot4.png", width=480, height=480, units = 'px')
    
    ## Setting the layout for plots
    par(mfrow=c(2,2))
    
    # Top left plot (Time vs Active power)
    plot(Data_plot$Date.Time, Data_plot$Global_active_power,
         ylab='Global Active Power', xlab='', type='l')
    
    # Top right plot (Time vs Voltage)
    plot(Data_plot$Date.Time, Data_plot$Voltage,
         xlab='datetime', ylab='Voltage', type='l')
    
    # Bottom left plot (Time vs Metering)
    plot(Data_plot$Date.Time, Data_plot$Sub_metering_1, type='l',
         xlab='', ylab='Energy sub metering')
    lines(Data_plot$Date.Time, Data_plot$Sub_metering_2, col='red')
    lines(Data_plot$Date.Time, Data_plot$Sub_metering_3, col='blue')
    legend('topright', 
           legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
           col=c('black', 'red', 'blue'), 
           lty='solid', bty='n')
    
    # Bottom right plot (Time vs Reactive power)
    plot(Data_plot$Date.Time, Data_plot$Global_reactive_power,
         xlab='datetime', ylab='Global_reactive_power', type='l')
    
    # Close graphics device
    dev.off()
    
    # Provide the destination where the plot has been saved
    cat("Plot4.png has been saved in", getwd())
}