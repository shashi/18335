% Usage: [x, residnorm, residnorm2] = SD(A, b, x, nmax)
%
% Performs nmax steps of steepest descent to solve Ax = b for x,
% given a starting guess x (e.g. a random vector).  A should be
% Hermitian positive-definite.  Returns the improved solution x.
%
% residnorm is an array of length nmax of the residuals |r| as
% computed during the SD iterations.  residnorm2 is the same thing,
% but using |b - A*x| instead of via the updated r vector.
function [x, residnorm, residnorm2] = SD(A, b, x, nmax)
  Ad = zeros(size(x));
  r = b - A*x;
  alpha = 0;
  for n = 1:nmax
    r = r - alpha * Ad;
    residnorm(n) = norm(r);
    residnorm2(n) = norm(b - A*x);
    d = r;
    Ad = A*d;
    alpha = d' * r / (d' * Ad);
    x = x + alpha * d;
  end

    