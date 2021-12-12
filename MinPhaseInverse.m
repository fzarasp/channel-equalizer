function [nb , na] = MinPhaseInverse(b , a);
[eb,ea] = eqtflength(b,a);
[z,p,g] = tf2zp(eb,ea);
for k = 1 : length(z)
    if abs(z(k)) > 1 
        z(k) = conj(1/z(k));
    end
end
[nb , na] = zp2tf(p , z,g);
end
