
using Plots

N = 5000 # Number of iterations
M = 5000 # Number of distinct control parameter values
μ = linspace(0,2,M) # vector containing the values of μ
logfp = zeros(Int64,N) # preallocate vector evaluating logfprime
#logfp(x,μ) = log(abs(-2*μ*x))
L = zeros(M); # preallocate vector of Lyapunov exponents

map(x -> logfp(rand(), x), μ ) ;

for j in 1:M          # This loop changes the control parameter value
    x = rand();       # Different, random, initial conditions by trajectory
    #x = 0.1;         # Same initial condition
    for k in 1:N      # Loop generating the trajectory and evaluating Eq. (*)
        x = 1 - μ[j]*x^2; # Map iterations
        logfp[k] = log(abs(-2*μ[j]*x));

    end
    L[j] = mean(logfp);
    end

plot(μ,L',",")
