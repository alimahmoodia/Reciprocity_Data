clc; clear all; close all;
load data_Fig2C
h = plot(mean(rev_sus));
h(1). LineWidth = 2;
h = errorbar(nanmean(rev_sus),nanstd(rev_sus)/sqrt(60),'color', [204 0 204]./255);
h(1). LineWidth = 2;
hold on

h = plot(nanmean(rev_insus));
h(1). LineWidth = 2;
h = errorbar(nanmean(rev_insus),nanstd(rev_insus)/sqrt(60),'color', [204 204 0]./255);
h(1). LineWidth = 2;

 ax= gca;
ax.XTick =[];
ax.XAxis.Color = [0 0 0];
ax.YAxis.Color = 'black';
set(gca,'linewidth',1.25)
box off
ylabel('revision ')
xlabel('confidence')
ax.YTick = [];
 ax.YTick = [.2 .3 .4 .5];
 ax.YTickLabel = {'.2','.3','.4','.5'};

ax.XTick = [];
ax.XTick = [1 2];
ax.XTickLabel = {'low','high'};
xlim([.5 2.5])
set(gca,'fontsize',22)



figure

scatter(ones(60,1)+.05,rev_sus(:,1),40,'MarkerFaceColor',[204 0 204]./255,'MarkerEdgeColor','none')
hold on
scatter(ones(60,1)-.05,rev_insus(:,1),40,'MarkerFaceColor',[204 204 0]./255,'MarkerEdgeColor','none')

scatter(2*ones(60,1)+.05,rev_sus(:,2),40,'MarkerFaceColor',[204 0 204]./255,'MarkerEdgeColor','none')
scatter(2*ones(60,1)-.05,rev_insus(:,2),40,'MarkerFaceColor',[204 204 0]./255,'MarkerEdgeColor','none')

 ax= gca;
ax.XTick =[];
ax.XAxis.Color = [0 0 0];
ax.YAxis.Color = 'black';
set(gca,'linewidth',1.25)
box off
%ylabel('revision ')
%xlabel('confidence')
ax.YTick = [];
ax.YTick = [0 .25 .5 .75 1];
ax.YTickLabel = {'0','.25','.5','.75','1'};

ax.XTick = [];
ax.XTick = [1 2];
ax.XTickLabel = {'low','high'};
xlim([.5 2.5])
set(gca,'fontsize',22)