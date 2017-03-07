
using Plots
# Select GR Backend for plotting
gr()

N = 5000 # Number of iterations
M = 5000 # Number of distinct control parameter values
μ = linspace(0,2,M) # vector containing the values of μ
logfp = zeros(N) # preallocate vector evaluating logfprime
L = zeros(M) # preallocate vector of Lyapunov exponents

for j in 1:M # This loop changes the control parameter value
  x = rand() # Different, random, initial conditions by trajectory
  #x = 0.1;  # Same initial condition
  for k in 1:N  # Loop generating the trajectory and evaluating Eq. (*)
    x = 1 - μ[j]*x^2 # Map iterations
    logfp[k] = log(abs(-2*μ[j]*x))
  end
  L[j] = mean(logfp)
end

# Graph Lyapunov Exponents
scatter(μ[2:end], L[2:end], markersize = 0.5, leg = false, xlabel = "mu", ylabel = "lambda")
