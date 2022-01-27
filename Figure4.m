clc; clear all; close all
load RevisionBetas.mat
Beta{1} = RevisionBetas.ConfH;
Beta{2} = RevisionBetas.InfH;
Beta{3} = RevisionBetas.IntH;

Beta{4} = RevisionBetas.ConfC;
Beta{5} = RevisionBetas.InfC;
Beta{6} = RevisionBetas.IntC;
titles = {'A','B','C','D','E','F'}
options.handle     = figure;
for plot_num = 1 :6
    beta_emp = Beta{plot_num};
    if plot_num<4
        options.color_area = [0  191 255]./255;    % Blue theme
        options.color_line = [0  191 255]./255;
    else
        options.color_area = [255  0 255]./255;
        options.color_line = [ 186 85 211]./255;
    end
    options.alpha      = 0.5;
    options.line_width = 2;
    options.error      = 'sem';
    h1 = subplot(2,3,plot_num)
    plot_areaerrorbar(beta_emp, options)
    ax.XTick =[-1 18 37 56 76];
    xticklabels({'-2','2','6','10','14'})
    
    ax= gca;
    ax.XTick =[-1 18 37 56 76];
    xticklabels({'-2','2','6','10','14'})
    ax.XAxis.Color = [0 0 0];
    ax.YAxis.Color = 'black';
    set(gca,'linewidth',1.25)
    box off
    set(gca,'fontsize',22)
    xlim([-2 80])
    hold on
    h = refline(0,0);
    h(1).LineWidth = 2;
    h.Color = 'black';
    h = xline(9,'--k');
    h(1).LineWidth = 2;
%     if plot_num == 1 | plot_num == 4
%     p = get(h1, 'position');
% p(3) = p(3) - 0.1;
% set(h1, 'position', p);
%     end
%     
%       if plot_num == 3 | plot_num == 6
%     p = get(h1, 'position');
% p(3) = p(3) + 0.1;
% set(h1, 'position', p);
%     end
end
%%
for plot_num = 1 : 6
    figure
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
if plot_num <4
h = scatter(x, v(:,1),40,'filled','MarkerFaceColor',[0  191 255]./255);
else
    h = scatter(x, v(:,1),40,'filled','MarkerFaceColor',[255  0 255]./255);
end
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