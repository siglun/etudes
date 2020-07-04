#!/usr/bin/Rscript

require(deSolve)

## ==============================================================================
## Example: Numerical solution of the susceptible (X), infected (Y) resistant (Z)
## epidemiological model
## ==============================================================================

parameters <- c(beta  = 0.01,
                gamma = 0.01,
                m = 0.1)

state <- c(X = 100, Y = 1, Z = 0)

## the ODE system

lorenz <- function(t, state, parameters) {
    with(as.list(c(state, parameters)),{

# rate of change

        dX <- -beta*X*Y + gamma*Z
        dY <- beta * X * Y - m*Y 
        dZ <- m*Y - gamma * Z

# return the rate of change

        list(c(dX, dY, dZ))

    })

}

times <- seq(0, 100, by = 0.01)

out <- ode(y = state, times = times, func = lorenz, parms = parameters)

head(out)

par(oma = c(0, 0, 3, 0))
plot(out, xlab = "time", ylab = "-")
plot(out[, "X"], out[, "Z"], pch = ".")
mtext(outer = TRUE, side = 3, "SIR Model", cex = 1.5)
