clc; clear all; close all;
load t5_dacc_dmpfc.mat;
options.handle     = figure;
options.color_area = [255  215 0]./255;
options.color_line = [255  215 0]./255;

options.alpha      = 0.5;
options.line_width = 2;
options.error      = 'sem';

%% confidence
plot_areaerrorbar(beta_conf, options)
ax.XTick =[-1 18 37 56 76];
xticklabels({'-2','2','6','10','14'})
hold on



%% influence
options.color_area = [0  255 0]./255;
options.color_line = [0  255 0]./255;

options.alpha      = 0.5;
options.line_width = 2;
options.error      = 'sem';
plot_areaerrorbar(beta_inf, options)
hold on


%% interaction
options.color_area = [0  0 255]./255;
options.color_line = [0  0 255]./255;

options.alpha      = 0.5;
options.line_width = 2;
options.error      = 'sem';
plot_areaerrorbar(beta_int, options)




h(1).LineWidth = 3;
        ax= gca;
ax.XTick =[-1 18 37 56 76];
xticklabels({'-2','2','6','10','14'})
ax.XAxis.Color = [0 0 0];
ax.YAxis.Color = 'black';
set(gca,'linewidth',1.25)
box off
h = refline(0,0);
h(1).LineWidth = 2;
h.Color = 'black';

xlabel('Time relative to revision onset')

    ylabel('beta estimate [a.u]')

set(gca,'fontsize',22)

%%
hold on
h = refline(0,0);
h(1).LineWidth = 2;
h.Color = 'black';
ylim([-.25 .25])

%%
        b1 = mean(mean(beta_inf(:,10:25),2));
        b2 = mean(mean(beta_conf(:,10:25),2));
        b3 = mean(mean(beta_int(:,10:25),2));
        %b1 =2; b2 = 2; b3 = 2;
        
        step = -3:.5:3;
        
        for conf= 1:length(step)
            for inf= 1:length(step)
                PPI(conf,inf)= b1*step(inf) + b2*step(conf) + b3*step(inf)*step(conf);
            end
        end
        
figure
imagesc(PPI)
set(gca,'YDir','normal');
c=colorbar;
caxis([-2.5 2.5]);
xlabel('influence','FontSize',22);
ylabel('confidence','FontSize',22);
set(gca,'LineWidth',2,'FontSize',22);
set(c,'LineWidth',2);
set(gca,'XTick',[1 length(step)],'XTickLabel',{'min','max'});
set(gca,'YTick',[1 length(step)],'YTickLabel',{'min','max'});
set(c,'YTick',[-2.5 2.5],'YTickLabel',{'min','max'});
title('dmPFC-dACC','FontSize',22,'FontWeight','normal');



%%
figure
Beta{1} = beta_conf;
Beta{2} = beta_inf;
Beta{3} = beta_int;
for plot_num = 1 : 3
    beta = Beta{plot_num};
  b2 = beta(:,16:56);
for s = 1 :20
    temp = b2;
    temp(s,:)=[];
    m_t = mean(temp);
    if plot_num == 3 | plot_num == 6
    index = find(m_t ==  min(m_t));
    else
        index = find(m_t ==  max(m_t));
    end
    v(s,1) = b2(s,index);
end
x=.2*ones(1,20);
if plot_num == 1
h = scatter(x+.1*plot_num, v(:,1),40,'filled','MarkerFaceColor',[255  215 0]./255);
elseif plot_num == 2
    h = scatter(x+.1*plot_num, v(:,1),40,'filled','MarkerFaceColor',[0  255 0]./255);
else
     h = scatter(x+.1*plot_num, v(:,1),40,'filled','MarkerFaceColor',[0  0 255]./255);
end
hold on
scatter(.21+.11*plot_num,mean(v(:,1)),40,'filled','black')
h = errorbar(.21+.11*plot_num,mean(v(:,1)),std(v(:,1))/sqrt(length(v(:,1))),'black');
h(1).LineWidth = 2;

h(1).LineWidth = 2;
box off
ax= gca;
ax.XAxis.Color = [0 0 0];
ax.YAxis.Color = 'black';
set(gca,'linewidth',1.25)
box off
ax.XTick =[];
xlim([.29 .54])
%ylabel('beta estimate [a.u]')
set(gca,'fontsize',22)
end