clc; clear all; close all;
load data_Fig2A
mat_h = data{1};
mat_c = data{2};
tbl = table(mat_h(:,1),mat_h(:,2),mat_h(:,3),mat_h(:,4), 'VariableNames',{'rev','conf','inf','s'});
lmh = fitlme(tbl,'rev~conf*inf+(1+conf+inf|s)')
 cih = coefCI(lmh);

tbl = table(mat_c(:,1),mat_c(:,2),mat_c(:,3),mat_c(:,4), 'VariableNames',{'rev','conf','inf','s'});
lmc = fitlme(tbl,'rev~conf*inf+(1+conf+inf|s)')

cic = coefCI(lmh);


figure


coef_h = [lmh.Coefficients.Estimate(2:4)];

CIlow=cih(2:4,1)';
CIhigh = cih(2:4,2)';

x =1:3:7
%subplot(3,2,1:2)
bar(x,coef_h,.35,'FaceColor',[138,43,226]/256,'EdgeColor',[138,43,226]/256,'LineWidth',1.5);
hold on
%e = errorbar(x,coef_h,CI_h)
for coef = 1 : 3
    %y = coef_h(1,coef)-CI_h(1,coef):.01:coef_h(1,coef)+CI_h(1,coef);
     y = CIlow(1,coef):.01:CIhigh(1,coef);
    h = plot(x(coef) + zeros(length(y)),y,'color',[138,43,226]/256);
    h(1).LineWidth = 2;
end

x=2.1:3:8.1;


coef_c = [lmc.Coefficients.Estimate(2:4)];
cic = coefCI(lmc);
CIlow=cic(2:4,1)';
CIhigh = cic(2:4,2)';

bar(x,coef_c,.35,'FaceColor',[0,153,76]/256,'EdgeColor',[0,153,76]/256,'LineWidth',1.5);
for coef = 1 : 3
    y = CIlow(1,coef):.01:CIhigh(1,coef);
    h = plot(x(coef) + zeros(length(y)),y,'color',[0,153,76]/256);
    h(1).LineWidth = 2;
end

ax= gca;
ax.XTick =[];
ax.XAxis.Color = [0 0 0];
ax.YAxis.Color = 'black';
set(gca,'linewidth',1.25)
box off
ylabel('beta estimate[a.u] ')
ax.XTick = [1.55 4.55 7.55];
ax.XTickLabel = {'Confidence','Influence','Interaction'};
set(gca,'fontsize',22)
%title('A')
