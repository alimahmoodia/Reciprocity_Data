clc; clear all;close all
load data_Fig2D
subplot(1,2,1)
%rev_sus = [rev1 rev_sus];
h = plot(mean(rev_sus));
h(1). LineWidth = 2;
h = errorbar(mean(rev_sus),std(rev_sus)/sqrt(60),'color', [204 0 204]./255);
h(1). LineWidth = 2;
hold on
%rev_insus = [revis1 rev_insus];
h = plot(mean(rev_insus));
h(1). LineWidth = 2;
h = errorbar(mean(rev_insus),std(rev_insus)/sqrt(60),'color', [204 204 0]./255);
h(1). LineWidth = 2;


 ax= gca;
ax.XTick =[];
ax.XAxis.Color = [0 0 0];
ax.YAxis.Color = 'black';
set(gca,'linewidth',1.25)
box off
ylabel('revision ')
xlabel('trial')
ax.YTick = [];
ax.YTick = [.25 .3 .35 .4];
ax.YTickLabel = {'.25','.3','.35','.4'};
xlim([-.5 12])
set(gca,'fontsize',22)
%rev_sus_c = [rev1_c_sus rev_sus_c];
subplot(1,2,2)
h = plot(mean(rev_sus_c));
h(1). LineWidth = 2;
h = errorbar(mean(rev_sus_c),std(rev_sus_c)/sqrt(60),'color', [204 0 204]./255);
h(1). LineWidth = 2;
hold on

%rev_insus_c = [rev1_c_insus rev_insus_c];
h = plot(mean(rev_insus_c));
h(1). LineWidth = 2;
h = errorbar(mean(rev_insus_c),std(rev_insus_c)/sqrt(60),'color', [204 204 0]./255);
h(1). LineWidth = 2;
ax= gca;
ax.XTick =[];
ax.YTick =[];
ax.YTick = [.25 .3 .35 .4];
ax.YTickLabel = {'.25','.3','.35','.4'};
ylim([.25 .42]);
ax.YAxis.Color = 'black';
set(gca,'linewidth',1.25)
box off
xlabel('trial')
xlim([-.5 12])
set(gca,'fontsize',22)