function [qvec] = quantize_m(invec ,n)
rvec = real(invec);
ivec = imag(invec);

vecRange = max(rvec) - min(rvec) ; 
dlta = vecRange /(pow2(n)- 1); 
rqvec = dlta * floor(rvec/dlta) ;

vecRange = max(ivec) - min(ivec) ; 
dlta = vecRange /(pow2(n)- 1); 
iqvec = dlta *floor(ivec/dlta) ;

qvec = rqvec+ 1i .*iqvec;
if real(invec) == invec
    qvec = rqvec;
end
end