% Comparación entre dos distribuciones utilizando la Divergencia de
% Hellinger
function HLD=HLD_050721_ALQR(dist1,dist2)
tope=size(dist1,1);

i=1;
HLDi=zeros(1,tope);
while i<=tope
    HLDi(i)=sqrt(dist1(i)*dist2(i));
    i=i+1;
end

HLD=1-sum(HLDi);
end