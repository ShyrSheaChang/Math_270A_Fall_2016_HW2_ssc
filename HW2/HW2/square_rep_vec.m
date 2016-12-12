function out = square_rep_vec(r,value)

%replicate x_i for r_i times (both row vectors)

x = [value(1) value(2:end) - value(1:(end-1))];
a = cumsum(r);
b = zeros(1,a(end));
b(a - r + 1) = x;
out = cumsum(b);


end

