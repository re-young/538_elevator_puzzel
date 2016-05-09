simulateRide<-function(n,m){
    litUp=rep(0,m)
    for(i in 1:n){
        ind=sample(1:m,1)
        litUp[ind]=1
        }
    return(sum(litUp))
}

mcmcSim<-function(n,m,numSim){
    results=rep(0,numSim)
    for(i in 1:numSim){results[i]=simulateRide(n,m)}
    return(results)
}

expectedValue<-function(m,n){
	return(n*(1-(1-1/n)^m))
}

shinyServer(function(input, output) {

  # Expression that generates a plot of the distribution. The expression
  # is wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should be automatically 
  #     re-executed when inputs change
  #  2) Its output type is a plot 
  #
  output$distPlot <- renderPlot({

    # generate distribution
    tmp=mcmcSim(input$numPeople,input$numFloors,input$numSims)
    #plot it
    hist(tmp, breaks=1:input$numFloors,
    	 xlab=paste("Number of Buttons Illuminated out of",input$numFloors, "Buttons. Red line is the analytic expected value."),
    	 ylab="",yaxt='n',
    	 main="Distribution of Illuminated Buttons")

    abline(v=expectedValue(input$numPeople,input$numFloors),
     col='red', lwd=3)
  })
})