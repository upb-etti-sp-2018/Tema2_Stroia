%Numar de ordine: 22

P = 40; %Perioada

D = 22; %Durata semnalelor 

N = 50; %Numar de coeficienti 

w0 = 2*pi/P; 

t_trg = 0:0.0002:D;

x_trg = sawtooth(2*pi*(1/P)*t_trg,D/P)/2+1/2; 

t1 = 0:0.0002:P; 

x1 = zeros(1,length(t1)); 

x1(t_trg<=D) = x_trg; 
figure(1);

plot(t1,x1),title('x(t) si semnalul modificat')

hold on





for k = -N:N 

    x_t = x_trg; 

    x_t = x_t .* exp(-1i*k*w0*t_trg); 

    X(k+N+1) = 0; 

    for i = 1:length(t_trg)-1

        X(k+N+1) = X(k+N+1) + (t_trg(i+1)-t_trg(i)) * (x_t(i)+x_t(i+1))/2; 

    end

end



for i = 1:length(t1) 

    x2(i) = 0; 

    for k=-N:N

        x2(i) = x2(i) + (1/P) * X(k+51) * exp(1i*k*w0*t1(i));  

    end

end

plot(t1,x2,'--') 


figure(2);

w=-50*w0:w0:50*w0; 

stem(w/(2*pi),abs(X)),title('Spectrul lui x(t)'); 