#!/usr/bin/Rscript

require(deSolve)

## =======================================================================
## Example: Numerical solution of the famous Lorenz equation, with a
## strange attractor
## =======================================================================

parameters <- c(a = -8/3,
                b = -10,
                c = 28)

state <- c(X = 1, Y = 1, Z = 1)

## the Lorenz ODE system

lorenz <- function(t, state, parameters) {
    with(as.list(c(state, parameters)),{

# rate of change

        dX <- a*X + Y*Z
        dY <- b * (Y-Z)
        dZ <- -X*Y + c*Y - Z

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
mtext(outer = TRUE, side = 3, "Lorenz model", cex = 1.5)
