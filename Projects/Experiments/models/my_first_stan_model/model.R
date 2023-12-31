# Assuming the file is named 'seaice_data.csv' and is in your working directory
seaice_data <- read.csv("seaice.csv", header = TRUE)

# Plotting extent against year
plot(seaice_data$year, seaice_data$extent, 
     xlab = "Year", ylab = "Extent (Million sq. km)",
     main = "Sea Ice Extent Over Time", ylim = c(0, 15))  # Adjust ylim as needed

# You can add gridlines for better visualization
grid()

lm1 <- lm(extent ~ year, data = seaice_data)
summary(lm1)

abline(lm1, col = 2, lty = 2, lw = 3)

x <- I(seaice_data$year - 1978)
y <- seaice_data$extent
N <- length(seaice_data$year)

lm1 <- lm(y ~ x)
summary(lm1)

#y = a + bx + error
lm_alpha <- summary(lm1)$coeff[1] #zac. vrednost
lm_beta <- summary(lm1)$coeff[2] #koeficient
lm_sigma <- sigma(lm1) #the residual error

stan_data <- list(N = N, x = x, y = y)

stanc("model.stan")

stan_model1 <- "model.stan"

fit <- stan(file = stan_model1, data = stan_data, warmup = 500, iter = 1000, chains = 4, cores = 2, thin = 1)
fit
posterior <- extract(fit)
str(posterior)

plot(y ~ x, pch = 20)

abline(lm1, col = 2, lty = 2, lw = 3)
abline( mean(posterior$alpha), mean(posterior$beta), col = 6, lw = 2)

for (i in 1:500) {
  abline(posterior$alpha[i], posterior$beta[i], col = "gray", lty = 1)
}

plot(y ~ x, pch = 20)

for (i in 1:500) {
  abline(posterior$alpha[i], posterior$beta[i], col = "gray", lty = 1)
}

abline(mean(posterior$alpha), mean(posterior$beta), col = 6, lw = 2)

stan_model2 <- "model2.stan"

fit2 <- stan(stan_model2, data = stan_data, warmup = 500, iter = 1000, chains = 4, cores = 2, thin = 1)

posterior2 <- extract(fit2)

plot(y ~ x, pch = 20)

abline(posterior2$alpha, posterior2$beta, col = 4, lty = 2, lw = 2)
abline(mean(posterior2$alpha), mean(posterior2$beta), col = 3, lw = 2)
abline(mean(posterior$alpha), mean(posterior$beta), col = 36, lw = 3)

#traceplots:
plot(posterior$alpha, type = "l")
plot(posterior$beta, type = "l")
plot(posterior$sigma, type = "l")

fit_bad <- stan(stan_model1, data = stan_data, warmup = 25, iter = 50, chains = 4, cores = 2, thin = 1)
posterior_bad <- extract(fit_bad)

plot(posterior_bad$alpha, type = "l")
plot(posterior_bad$beta, type = "l")
plot(posterior_bad$sigma, type = "l")

#parameter summaries
par(mfrow = c(1,3))

plot(density(posterior$alpha), main = "Alpha")
abline(v = lm_alpha, col = 4, lty = 2)

plot(density(posterior$beta), main = "Beta")
abline(v = lm_beta, col = 4, lty = 2)

plot(density(posterior$sigma), main = "Sigma")
abline(v = lm_sigma, col = 4, lty = 2)

sum(posterior$beta>0)/length(posterior$beta)
# 0

sum(posterior$beta>0.2)/length(posterior$beta)
# 0

traceplot(fit)

stan_dens(fit)
stan_hist(fit)

plot(fit, show_density = FALSE, ci_level = 0.5, outer_level = 0.95, fill_color = "salmon")

model2_GQ <- "model2_GQ.stan";

fit3 <- stan(model2_GQ, data = stan_data, iter = 1000, chains = 4, cores = 2, thin = 1)

y_rep <- as.matrix(fit3, pars = "y_rep")
dim(y_rep)

ppc_dens_overlay(y, y_rep[1:200, ])

ppc_stat(y = y, yrep = y_rep, stat = "mean")

ppc_scatter_avg(y = y, yrep = y_rep)

#available_ppc()
#color_scheme_view(c("blue", "gray", "green", "pink", "purple", "red","teal","yellow"))
#color_scheme_view("mix-blue-red")
#color_scheme_set("blue")