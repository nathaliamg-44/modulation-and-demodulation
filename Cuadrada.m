A = 1;
w = 2;
rho = 0;
t = 0:0.001:4;
sq = A*square(w*t+rho);
plot(t,sq)
axis([0 pi -1.5 1.5])