function [n,x]=impseq(n_beg,n_end,n0)
n=n_beg:n_end;
x=zeros(1,length(n));
id=find(n==n0);
x(id)=1;
end