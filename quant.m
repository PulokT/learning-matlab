function[xq, index, qerr] = quant(b,x) 
L= 2^b;
lev_id= 0: L-1; 
sigmax= max(x); 
sigmin= min(x); 
res=(sigmax-sigmin)/(L-1); 
lev=sigmin:res:sigmax; 
counter=length(x);
for i=1:counter 
    dif=abs(x(i)-lev);
    id= find(dif==min(dif)); 
    id=id(1); 
    xq(i) = lev(id); 
    index(i) = lev_id(id);
er(i) = x(i) -xq(i); 
end
qerr= sum(er.^2)/length(er);
figure()
subplot(211), plot(x), title('original analog signal')
subplot(212),stem(xq), title('quantized signal')
