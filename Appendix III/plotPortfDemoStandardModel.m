function plotPortfDemoStandardModel(x1)
% plotPortfDemoStandardModel Helper function for portfolio optimization demo 
figure;
bar1 = bar(x1,'FaceColor','b','EdgeColor','b'); set(bar1,'BarWidth',0.2);
%set(gca,'xlim',[1 length(x1)]) %set(gca,'ylim',[0 0.3]) 
%%%objective function has no linear term
%set(gca,'xTick',[1 75 150 225]);
title('Mean-Variance-Standard model - 10-asset problem') xlabel('Assets')
ylabel('Fraction of investment')
grid on 
end

