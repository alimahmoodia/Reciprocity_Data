clc; clear all; close all
load data_Fig2E
figure

rating_data(46,3:4) = nan;
x = [1 3 7 9]
b = bar(x,nanmean(rating_data),.35,'FaceColor',[0 0 255]./255,'EdgeColor','none','LineWidth',1.5);
b.FaceColor = 'flat';
hold on
b.CData(2,:) = [255 0 127]./255;
b.CData(4,:) = [255 0 127]./255;
h = errorbar(1,nanmean(rating_data(:,1)),nanstd(rating_data(:,1))/sqrt(60),'color', [0 0 255]./255);
h(1).LineWidth = 1.5;

h = errorbar(3,nanmean(rating_data(:,2)),nanstd(rating_data(:,2))/sqrt(60),'color', [255 0 127]./255);
h(1).LineWidth = 1.5;

h = errorbar(7,nanmean(rating_data(:,3)),nanstd(rating_data(:,3))/sqrt(60),'color', [0 0 255]./255);
h(1).LineWidth = 1.5;

h = errorbar(9,nanmean(rating_data(:,4)),nanstd(rating_data(:,4))/sqrt(60),'color', [255 0 127]./255);
h(1).LineWidth = 1.5;
ax = gca;
ax.XTick = [];

% for p = 1 : 4
%     scatter(((p-1)*2+1)*ones(60,1),rating_data(:,p),40,'filled','black')
% end

ax.YAxis.Color = 'black';
set(gca,'linewidth',1.25)
box off
xlabel('condition')
ylabel('performance rating')
%xlim([-.5 11])
set(gca,'fontsize',22)
ylim([0 6.1])
ax.XTick = [2 8];
ax.XTickLabel = {'susceptible','insusceptible'};