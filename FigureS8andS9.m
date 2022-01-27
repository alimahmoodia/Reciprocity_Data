clc; clear all; close all
load Betas_Alternative_model
beta1= beta_conf;
beta2= beta_inf;
plot([1 14],[0 0],'k-');
    hold on;
    m  =mean(beta1,1);
    s = std(beta1,1)/sqrt(20);
    x=1:size(s,2);
    x = -1:.2:14;
    ban = [132,112,255]/255;
    shadedErrorBar(x,m,s,'r');
    hold on
    clear m
    clear s
    m  =mean(beta2,1);
    s = std(beta2,1)/sqrt(20);
    x=1:size(s,2);
    x = -1:.2:14;
    ban = [132,112,255]/255;
    shadedErrorBar(x,m,s,'b');

        ax= gca;
ax.XTick =[-1 3 7 11 15];
%ax.XTick =[-1 18 37 56 76];
xticklabels({'-2','2','6','10','14'})
ax.XAxis.Color = [0 0 0];
ax.YAxis.Color = 'black';
set(gca,'linewidth',1.25)
box off
hold on
h = refline(0,0);
h(1).LineWidth = 2;
h.Color = 'black';

%xlabel('Time relative to revision onset')

    %ylabel('Effect on BOLD signal')

set(gca,'fontsize',22)
xticklabels({'-2','2','6','10','14'})
%%
hold on
h = refline(0,0);
h(1).LineWidth = 2;
h.Color = 'black';
%ylim([-.8 .7])
xlim([-1.5 15])
h = xline(0,'--k');
h(1).LineWidth = 2;
%%
b2 = beta1(:,16:56);
for s = 1 :20
    temp = b2;
    temp(s,:)=[];
    m_t = mean(temp);
    index = find(m_t ==  max(m_t));
    v(s,1) = b2(s,index);
end
[h,p,w] = signrank(v,0)
figure
x=.2*ones(1,20);
h = scatter(x, v(:,1),40,'filled','MarkerFaceColor','r');
hold on
scatter(.21,mean(v(:,1)),40,'filled','black')
h = errorbar(.21,mean(v(:,1)),std(v(:,1))/sqrt(length(v(:,1))),'black');
h(1).LineWidth = 2;

h(1).LineWidth = 2;
box off
ax= gca;
ax.XAxis.Color = [0 0 0];
ax.YAxis.Color = 'black';
set(gca,'linewidth',1.25)
box off
ax.XTick =[];
xlim([.19 .22])
%xlabel({'Beta at ','Estimate(t2)[a.u]'})
%ylabel('beta estimate [a.u]')
set(gca,'fontsize',22)
%%
b2 = beta2(:,16:56);
for s = 1 :20
    temp = b2;
    temp(s,:)=[];
    m_t = mean(temp);
    index = find(m_t ==  max(m_t));
    v(s,1) = b2(s,index);
end
[h,p,w] = signrank(v,0)
figure
x=.2*ones(1,20);
h = scatter(x, v(:,1),40,'filled','MarkerFaceColor','b');
hold on
scatter(.21,mean(v(:,1)),40,'filled','black')
h = errorbar(.21,mean(v(:,1)),std(v(:,1))/sqrt(length(v(:,1))),'black');
h(1).LineWidth = 2;

h(1).LineWidth = 2;
box off
ax= gca;
ax.XAxis.Color = [0 0 0];
ax.YAxis.Color = 'black';
set(gca,'linewidth',1.25)
box off
ax.XTick =[];
xlim([.19 .22])
%xlabel({'Beta at ','Estimate(t2)[a.u]'})
%ylabel('beta estimate [a.u]')
set(gca,'fontsize',22)
%%
inf_behaviour = [-0.005801398
-0.380086135
0.171161971
0.222680419
0.004386929
0.025762851
-0.027871015
-0.00057021
-0.022052464
0.074920288
-0.930916805
-0.114126208
0.014201084
0.293453745
0.176460409
0.018289876
0.082351703
0.266565901
0.146867276
0.315655977];
figure
scatter(inf_behaviour,v,'MarkerFaceColor','cyan')
hold on
h = lsline;
h.LineWidth = 2;
h.Color = 'blue'