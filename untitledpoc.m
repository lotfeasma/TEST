step=10;
Xm = -100:10:100;
Ym = -100:10:100;
Zm = -100:10:100;
A = -30:5:30;
C = -30:5:30;

numIterations = length(Xm) * length(Ym) * length(Zm) * length(A) * length(C);

P = zeros(numIterations, 4);
a = 1;
tic;
for i = 1:length(Xm)
    for j = 1:length(Ym)
        for k = 1:length(Zm)
            for l = 1:length(A)
                for m = 1:length(C)
                    Tbp = [1 0 0 30; 0 cosd(A(l)) sind(A(l)) 60; 0 -sind(A(l)) cosd(A(l)) 60; 0 0 0 1];
                    Tmb = [cosd(C(m)) sind(C(m)) 0 0; -sind(C(m)) cosd(C(m)) 0 10; 0 0 1 20; 0 0 0 1];
                    P(a, :) = (inv(Tbp) * inv(Tmb) * [Xm(i); Ym(j); Zm(k); 1])';
                    a = a + 1;
                end
            end
        end
    end
end
toc

                  

                  





