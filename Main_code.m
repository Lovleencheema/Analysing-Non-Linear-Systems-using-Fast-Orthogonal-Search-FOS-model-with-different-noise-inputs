clc
clear all
System=1;
% System=2;
% System=3;

if System==1
    x=0.1*randn(1,3000);
    plot(x);
    y=Noise_less_system_1(x);
    figure;
    plot(y);
    k=[2,2,3,4,4,5,4,5];
    l=[1,2,2,3,3,4,6,5];
    Order=[2,2,2,2,2,2,2,2];
end;
if System==2
    x=rand(1,3000);
    plot(x);
    y=Noise_less_system_2(x);
    figure;
    plot(y);
    k=[2,4,3,4,4,1];
    l=[1,3,4,3,2,2];
    Order=[2,2,2,2,2,2];
end;
if System==3
    x=0.1*randn(1,3000);
    y=Noise_less_system_3(x);
    k=[2,2,3,3,4,4];
    l=[1,2,3,4,4,5];
    Order=[2,2,2,2,2,2];
end;


percent=[0 25 50 100];
mse_absolute_3rd_set=zeros(size(k,2),4);
mse_relative_3rd_set=zeros(size(k,2),4);
for i=1:size(percent,2)
    for model=1:size(k,2)
        disp(['For model', num2str(model),'(when P is ',num2str(percent(i)),'%)']);
        tic
        a(model)=FOS(x,y,percent(i),k(model),l(model),Order(model));
        toc
        mse_absolute_1st_set(model,i)=a(model).mse_absolute_1st_set;
        mse_relative_1st_set(model,i)=a(model).mse_relative_1st_set;
        mse_absolute_2nd_set(model,i)=a(model).mse_absolute_2nd_set;
        mse_relative_2nd_set(model,i)=a(model).mse_relative_2nd_set;
    end
    [q(i),p(i)]=min(mse_absolute_2nd_set(:,i));
    b(i)=a(p(i));
    modelout(a(p(i)).Selected_candidates,a(p(i)).a,a(p(i)).K,a(p(i)).L,percent(i),a(p(i)).Order);
    v3(i,1:1000)=Modloutput(a(p(i)).a,a(p(i)).Selected_candidates,x(2001:3000),a(p(i)).K,a(p(i)).L,a(p(i)).N,a(p(i)).Order);
    mse_absolute_3rd_set(p(i),i)=a(p(i)).mse_absolute_3rd_set;
    mse_relative_3rd_set(p(i),i)=a(p(i)).mse_relative_3rd_set;
    if i==1
        figure;
        P_lot=plot(2001:3000,y(1,2001:3000),'--',2001:3000,v3(i,1:1000));
        set(P_lot(1),'Color','blue','linewidth',2);
        set(P_lot(2),'Color','red','linewidth',1);
        figure;
        P_lot=plot(2001:2100,y(1,2001:2100),'--',2001:2100,v3(i,001:100));
        set(P_lot(1),'Color','blue','linewidth',2);
        set(P_lot(2),'Color','red','linewidth',1);

    else
        figure;
        P_lot=plot(2001:3000,y(1,2001:3000),2001:3000,v3(i,1:1000));
        set(P_lot(1),'Color','blue','linewidth',1);
        set(P_lot(2),'Color','red','linewidth',1);
        figure;
        P_lot=plot(2001:2100,y(1,2001:2100),2001:2100,v3(i,001:100));
        set(P_lot(1),'Color','blue','linewidth',1);
        set(P_lot(2),'Color','red','linewidth',1);

    end
end;
result(1:size(k,2),1)=[1:size(k,2)]';
result(1:size(k,2),2)=k';
result(1:size(k,2),3)=l';
result(1:size(k,2),4)=Order';

rr=4;
for ll=1:1:size(percent,2)
    rr=rr+1;
    result(:,rr)=100*percent(ll)/(percent(ll)+100);
    rr=rr+1;
    result(:,rr)=mse_absolute_1st_set(:,ll);
    rr=rr+1;
    result(:,rr)=mse_relative_1st_set(:,ll);
    rr=rr+1;
    result(:,rr)=mse_absolute_2nd_set(:,ll);
    rr=rr+1;
    result(:,rr)=mse_relative_2nd_set(:,ll);
    rr=rr+1;
    result(:,rr)=mse_absolute_3rd_set(:,ll);
    rr=rr+1;
    result(:,rr)=mse_relative_3rd_set(:,ll);
end;
result1=result';

  
