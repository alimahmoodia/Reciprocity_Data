clc; clear all; close all
load Betas_Who_Dec
beta1 = beta_conf; beta2 = beta_inf;beta3 = beta_int;
options.handle     = figure;
    options.color_area = [0  191 255]./255;    % Blue theme
    options.color_line = [0  191 255]./255;

    options.alpha      = 0.5;
    options.line_width = 2;
    options.error      = 'sem';
    subplot(3,1,1)
    plot_areaerrorbar(beta1, options)
    ax.XTick =[-1 18 37 56 76];
    xticklabels({'-2','2','6','10','14'})
          box off
    set(gca,'fontsize',22)
xlim([-2 80])
hold on
h = refline(0,0);
h(1).LineWidth = 2;
h.Color = 'black';
ylim([-.15 .15])
h = xline(9,'--k');
h(1).LineWidth = 2;

    subplot(3,1,2)
    plot_areaerrorbar(beta2, options)
    ax.XTick =[-1 18 37 56 76];
    xticklabels({'-2','2','6','10','14'})
        set(gca,'fontsize',22)
xlim([-2 80])
hold on
h = refline(0,0);
h(1).LineWidth = 2;
h.Color = 'black';
ylim([-.15 .15])
h = xline(9,'--k');
h(1).LineWidth = 2;
    box off

      subplot(3,1,3)
    plot_areaerrorbar(beta3, options)

        set(gca,'fontsize',22)
xlim([-2 80])
hold on
h = refline(0,0);
h(1).LineWidth = 2;
h.Color = 'black';
ylim([-.15 .15])
h = xline(9,'--k');
h(1).LineWidth = 2;
    ax.XTick =[-1 18 37 56 76];
    xticklabels({'-2','2','6','10','14'})
      box off
      
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
h = scatter(x, v(:,1),40,'filled','MarkerFaceColor',[0  191 255]./255);
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


%% figure



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
h = scatter(x, v(:,1),40,'filled','MarkerFaceColor',[0  191 255]./255);
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


%% figure



b2 = beta3(:,16:56);
for s = 1 :20
    temp = b2;
    temp(s,:)=[];
    m_t = mean(temp);
    index = find(m_t ==  min(m_t));
    v(s,1) = b2(s,index);
end
[h,p,w] = signrank(v,0)
figure
x=.2*ones(1,20);
h = scatter(x, v(:,1),40,'filled','MarkerFaceColor',[0  191 255]./255);
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