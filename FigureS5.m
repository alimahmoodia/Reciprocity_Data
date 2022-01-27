load t5_dacc_tpj_HCInteraction
options.handle     = figure;
beta1 = t5_dacc_tpj_HCInteraction;
options.color_area = [102  255 102]./255;    % Blue theme
options.color_line = [ 51 255 51]./255;
options.alpha      = 0.5;
options.line_width = 4;
options.error      = 'sem';
plot_areaerrorbar(beta1, options)
ax= gca;
ax.XTick =[-1 18 37 56 76];
xticklabels({'-2','2','6','10','14'})
ax.XAxis.Color = [0 0 0];
ax.YAxis.Color = 'black';
set(gca,'linewidth',1.25)
box off
xlabel('Time relative to revision onset')
ylabel('Beta estimate [a.u]')
set(gca,'fontsize',22)
xlim([-2 80])
h = refline(0,0);
h(1).LineWidth = 2;
h.Color = 'black';

b2 = beta1(:,16:56);
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
h = scatter(x, v(:,1),40,'filled','MarkerFaceColor',[102  255 102]./255);
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