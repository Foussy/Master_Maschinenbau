function Zp = G(t, Z)

global Ra La R U km kd ke Ja Jr Fmax

ia = Z(1);
phi = Z(2);
phip = Z(3);

Man = km*ia-kd*phip;
if sin(phi)>0.7
    MB = -Fmax * R* sign(phip)*(sin(phi)-0.7);
else
    MB = 0;
end

iap = (U-Ra*ia-ke*phip)/La;
phipp = (Man+MB)/(Ja+Jr);

Zp = [iap
      phip
      phipp];