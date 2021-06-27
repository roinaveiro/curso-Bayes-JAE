// Linear Model with Normal Errors
data {
  // number of observations
  int N;
  // response
  vector[N] y;
  // covariate
  vector[N] x;
}
parameters {
  // regression coefficient vector
  real beta;
  real<lower=0> sigma;
}
transformed parameters {
  vector[N] mu;

  mu = x * beta;
}
model {
  // priors
  beta ~ normal(0., 2.0);
  sigma ~ exponential(0.01);
  // likelihood
  y ~ normal(mu, sigma);
}
