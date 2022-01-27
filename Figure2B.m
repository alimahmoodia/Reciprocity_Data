clc; clear all; close all;
load data_Fig2B
b = squeeze(nanmean(M_h));

figure
imagesc(b)
set(gca,'YDir','normal');
c=colorbar;
caxis([.25 .55]);
xlabel('influence','FontSize',22);
ylabel('confidence','FontSize',22);
set(gca,'LineWidth',2,'FontSize',22);
set(c,'LineWidth',2);
set(gca,'XTick',[1:3],'XTickLabel',{'small','medium','big'});
set(gca,'YTick',[1:3],'YTickLabel',{'small','medium','big'});
ytickangle(90)
title('revision','FontSize',22,'FontWeight','normal');