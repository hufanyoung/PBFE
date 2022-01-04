clear;
close all;
clc;

T = zeros(1, 499);

for i = 1:499
   T(i) = 0.01*i+0.01; 
end

GM_names = load ('GM_names.mat', 'Filenames');
GM_Number = 200;

% Period 1 = 4.178674271512548 sec
% Period 2 = 1.3938011296189745 sec
% Period 3 = 0.8373734585127708 sec
% Period 4 = 0.5992975417225067 sec
% Period 5 = 0.4673412415179775 sec
% Period 6 = 0.38362402150394054 sec

Tstruc = 4.2; 
indexs = round(Tstruc/0.01);

T1 = Tstruc;
T2 = 1.39;
T3 = 0.84;
T4 = 0.60;

indexforratios(1) = round((T1-0.01)/0.01);
indexforratios(2) = round((T2-0.01)/0.01);
indexforratios(3) = round((T3-0.01)/0.01);
indexforratios(4) = round((T4-0.01)/0.01);

ratioAARS = zeros(GM_Number, 3);
ratioAMARS = zeros(GM_Number, 3);

for j = 115
    
    AARS = load(strcat(GM_names.Filenames(j),'.accout'));
    AMARS = load(strcat(GM_names.Filenames(j),'.maccout'));
    
    AARS2 = AARS*AMARS(indexs)/AARS(indexs);
    
    ratioAARS(j,1) = AARS(indexforratios(2))/AARS(indexforratios(1));
    ratioAARS(j,2) = AARS(indexforratios(3))/AARS(indexforratios(1));
    ratioAARS(j,3) = AARS(indexforratios(4))/AARS(indexforratios(1));
    
    ratioAMARS(j,1) = AMARS(indexforratios(2))/AMARS(indexforratios(1));
    ratioAMARS(j,2) = AMARS(indexforratios(3))/AMARS(indexforratios(1));
    ratioAMARS(j,3) = AMARS(indexforratios(4))/AMARS(indexforratios(1));    
  
%     figure;
%     plot(T,AARS,'r');
%     hold on;
%     plot(T,AMARS,'b');
%     hold off;
%     xlabel ('T [sec]');
%     ylabel ('Sa [g]'); 


end
        
for j = 115

    AARS = load(strcat(GM_names.Filenames(j),'.accout'));
    AMARS = load(strcat(GM_names.Filenames(j),'.maccout'));    
    AARS2 = AARS*AMARS(indexs)/AARS(indexs);

    figure;
    plot(T,AARS2,'r',T,AMARS,'b','linewidth',2);
    hold on;
    plot([T1,T1],[0,AMARS(indexforratios(1))],'k:','linewidth',1);
    hold on;
    plot([T2,T2],[0,AMARS(indexforratios(2))],'k:','linewidth',1);
    hold on;
    plot([T3,T3],[0,AMARS(indexforratios(3))],'k:','linewidth',1);
    hold on;
    plot([T4,T4],[0,AMARS(indexforratios(4))],'k:','linewidth',1);
    hold off;
    xlabel ('T [sec]');
	ylabel ('Sa [g]'); 
    legend('ARS','MARS')
    
end
        

% AARScheck = load('AARSc.txt');
% AMARScheck = load('AMARSc.txt');
% 
% figure;
% plot(AARScheck(:,2),AARScheck(:,1),'r');
% hold on;
% plot(AMARScheck(:,2),AMARScheck(:,1),'b');
% hold off;
% 
% figure;
% plot(AARScheck(:,3),AARScheck(:,1),'r');
% hold on;
% plot(AMARScheck(:,3),AMARScheck(:,1),'b');
% hold off;    
%     
% figure;
% plot(AARScheck(:,4),AARScheck(:,1),'r');
% hold on;
% plot(AMARScheck(:,4),AMARScheck(:,1),'b');
% hold off;     
