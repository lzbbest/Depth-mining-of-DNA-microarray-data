%%data analysis
%M=log(R/G) A=1/2£¨logRG£©=1/2(logR+logG) G:green net1 R:red net2

%delete low qulity col or row
% [i1,j1]=find(isnan(totalG));
% [i2,j2]=find(isnan(totalR));
k=1;%delete row
while k<=length(totalG(:,1))
    i=find(isnan(t(k,:)));
    if length(i)>5
        totalG(k,:)=[];
    end
    k=k+1;
end
k=1;%delete col
while k<=length(totalG(1,:))
    i=find(isnan(t(:,k)));
    if length(i)/length(totalG(:,k))>0.3
        totalG(:,k)=[];
    end
    k=k+1;
end

