pdcalc = zeros(length(pd),3);
pdcalc(1,:) = pd(1,:);
for i = 2:length(pd)
    pdcalc(i,:) = pdcalc(i-1,:) + pd_dot(i,:)*Tc;
end
er = pdcalc-pd;
subplot(3,1,1);
plot(t,pd);
subplot(3,1,2);
plot(t,pdcalc);
subplot(3,1,3);
plot(t,er)