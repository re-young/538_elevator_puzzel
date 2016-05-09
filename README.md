# 538_elevator_puzzel

This shiny app explores FiveThirtyEights.com [Elevator Button Puzzler](http://fivethirtyeight.com/features/can-you-solve-this-elevator-button-puzzle/).  The puzzle goes 

><sub>*In a building’s lobby, some number (N) of people get on an elevator that goes to some number (M) of floors. There may be more people than floors, or more floors than people. Each person is equally likely to choose any floor, independently of one another. When a floor button is pushed, it will light up. <br><br>What is the expected number of lit buttons when the elevator begins its ascent?*
</sub>


The solution can be found analytically.  Let $X_i \in \{0,1\}$ be an indicator variable for if the $i^{th}$ floor's button has been pressed.  Then $E[X_i]=P(X_i=1)=1-P(X_i=0)$.  The probability that the $i^{th}$ floor is not picked in $N$ random selection with replacement is $(1-\frac{1}{M})^N$.  Let  $Y$ be the number of floors that have been pressed.

$$E[Y]=\sum_{i=0}^N E[X_i]= \sum_{i=0}^N (1-\frac{1}{M})^N$$

$$E[Y]=N(1-\frac{1}{M})^N$$