function [vout] = Correct(vin)
vout = vin;
for k = 1:length(vin)
    if vin(k) == 0
        vout(k) = 10^-100;
    end
end
end
