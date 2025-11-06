close all
clearvars
clc

% Read in PCA data
% df1 = readtable('../processed/df_PCA3d.csv');
df1 = readtable('../raw/3D PCA data_v1.xlsx');

% Define variables
x=df1.PC1;
y=df1.PC2;
z=df1.PC3;
idx_survM = find((strcmp('Survivor',df1.Group2)) & (strcmp('M',df1.PARAM_GENDER)));
idx_survF = find((strcmp('Survivor',df1.Group2)) & (strcmp('F',df1.PARAM_GENDER)));
idx_nonSurvM = find((strcmp('Non-Survivor',df1.Group2)) & (strcmp('M',df1.PARAM_GENDER)));
idx_nonSurvF = find((strcmp('Non-Survivor',df1.Group2)) & (strcmp('F',df1.PARAM_GENDER)));

colors = ones(length(x),3);
for i=1:length(idx_nonSurvM)
    idx = idx_nonSurvM(i);
    colors(idx,:)=[1 0 0];
end

for i=1:length(idx_nonSurvF)
    idx = idx_nonSurvF(i);
    colors(idx,:)=[0 1 0];
end

for i=1:length(idx_survM)
    idx = idx_survM(i);
    colors(idx,:)=[0 0 1.0];
end

for i=1:length(idx_survF)
    idx = idx_survF(i);
    colors(idx,:)=[0 1 1.0];
end

% Plot 3D spheres

fig=figure();
scatter3sph(x,y,z,'color',colors,'trans',0.5,'size',2);
axis vis3d
xlabel('PC1 (32%)');ylabel('PC2 (11%)');zlabel('PC3 (6%)');grid on;
view(30,30)
set(gcf,'renderer','painters');
saveas(fig,'../processed/plot_3Dpca-Spheres.pdf');
% print(fig,'../processed/plot_3Dpca-Spheres.eps','-depsc','-vector');
% saveas(fig,'../processed/plot_3Dpca-Spheres.jpg');

% Record gif
% 1. Create the initial image file
% gifFile = '../processed/3dPCA.gif';
% exportgraphics(fig, gifFile);
% 
% % 2. Within a loop, append the gif image
% for i = 1:4:360
%     %   %   %   %   %   %    %
%     % Update the figure/axes %
%     %   %   %   %   %   %    %
%     view(i,30);
% 
%     exportgraphics(fig, gifFile, Append=true);
% end