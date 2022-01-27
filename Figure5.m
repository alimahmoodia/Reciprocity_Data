clc; clear all; close all
options.handle     = figure;

files = {'t6_dmPFC_infE_H.mat','t6_TPJ_infE_H.mat'};

    
    

for rois = 1 : 2
    load(files{rois})
    
    options.color_area = [100  252 0]./255;    % Blue theme
    options.color_line = [ 50 205 50]./255;
    options.alpha      = 0.5;
    options.line_width = 2;
    options.error      = 'sem';
    subplot(2,2,rois)
    plot_areaerrorbar(beta_emp, options)
    ax = gca;
    ax.XTick =[-1 18 37 56 76];
    xticklabels({'-2','2','6','10','14'})
    %% significance line
    hold on
%     if rois>2
%     x = find(prop>=.957);
%     if size(x,1)>0
%         y = -.15*ones(size(x));
%         h = plot(x,y,'color',[100  252 0]./255);
%         h(1).LineWidth = 2;
%     end
%     end
    %title(titles(rois));
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
if rois==1
%xlabel('Time from revision observation onset')
    ylabel('beta estimate [a.u]')
end


set(gca,'fontsize',22)
xlim([-2 80])
ylim([-.2 .3])

h = xline(9,'--k');
h(1).LineWidth = 2;

end

load t5_dacc_TPJ.mat;
%options.handle     = figure;
options.color_area = [255  215 0]./255;
options.color_line = [255  215 0]./255;

options.alpha      = 0.5;
options.line_width = 2;
options.error      = 'sem';
subplot(2,2,3)
%% confidence
plot_areaerrorbar(beta_emp_conf, options)
ax.XTick =[-1 18 37 56 76];
xticklabels({'-2','2','6','10','14'})
hold on



%% influence
options.color_area = [0  255 0]./255;
options.color_line = [0  255 0]./255;

options.alpha      = 0.5;
options.line_width = 2;
options.error      = 'sem';
plot_areaerrorbar(beta_emp_inf, options)
hold on


%% interaction
options.color_area = [0  0 255]./255;
options.color_line = [0  0 255]./255;

options.alpha      = 0.5;
options.line_width = 2;
options.error      = 'sem';
plot_areaerrorbar(beta_emp_interac, options)




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
ylim([-.6 .3])

%%
        b1 = mean(mean(beta_emp_inf(:,10:25),2));
        b2 = mean(mean(beta_emp_conf(:,10:25),2));
        b3 = mean(mean(beta_emp_interac(:,10:25),2));
        %b1 =2; b2 = 2; b3 = 2;
        
        step = -3:.5:3;
        
        for conf= 1:length(step)
            for inf= 1:length(step)
                PPI(conf,inf)= b1*step(inf) + b2*step(conf) + b3*step(inf)*step(conf);
            end
        end
        
subplot(2,2,4)
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
title('TPJ-dACC','FontSize',22,'FontWeight','normal');



%%
for plot_num = 1 : 2
    load(files{plot_num})
    figure
    beta = beta_emp;
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
h = scatter(x, v(:,1),40,'filled','MarkerFaceColor',[100  252 0]./255);

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
%ylabel('beta estimate [a.u]')
set(gca,'fontsize',22)
end
%%
figure
Beta{1} = beta_emp_conf;
Beta{2} = beta_emp_inf;
Beta{3} = beta_emp_interac;
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