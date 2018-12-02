
T=[273,273,273,320,911,1572,1043,1042,663,663,358;...
259,259,256,266,865,1416,879,879,860,860,480;...
279,279,279,327,854,1051,574,574,525,525,503;...
442,442,442,519,981,2000,1546,1491,1398,1398,1161];

P=[100,100,100,170,5500,5335,969,969,147,147,159;...
41,41,39,43,2170,2105,291,291,266,266,131;...
68,68,65,111,2685,2604,211,211,145,145,125;...
150,150,116,197,1634,1585,544,562,430,430,405];

T2=[273,173,273,281,744,2000,1547,1470,1437,1437,528;...
259,159,259,267,706,1429,993,965,933,933,409;...
279,179,279,327,642,900,615,615,555,555,493;...
442,442,442,519,1019,2000,1507,1460,1367,1400,1162];

P2=[100,100,100,110,2801,2717,936,1012,921,921,406;...
    25,25,39,43,1105,1072,236,241,210,210,399;...
    68,68,65,111,1043,1011,207,207,136,131,118;...
    150,150,116,197,1854,1799,556,570,433,420,399];
%% Plot Temperatures individual parameters
figure
plot([1:11],T(1,:),[1:11],T(2,:),[1:11],T(3,:),[1:11],T(4,:));
xticks([1:11]);
xticklabels({'Toa','To1','To2','To3f','To3','To4','To5.1','To5m','To5.2','To6','To7'});
title('Temperature Profile for Individually Optimized Engines');
legend('Mission 1','Mission 2', 'Mission 3', 'Mission 4');
set(gcf, 'Position',  [100, 100, 900, 400])

%% Plot Pressures individual parameters
figure
plot([1:11],P(1,:),[1:11],P(2,:),[1:11],P(3,:),[1:11],P(4,:));
xticks([1:11]);
xticklabels({'Poa','Po1','Po2','Po3f','Po3','Po4','Po5.1','Po5m','Po5.2','Po6','Po7'});
title('Pressure Profile for Individually Optimized Engines');
legend('Mission 1','Mission 2', 'Mission 3', 'Mission 4');
set(gcf, 'Position',  [100, 100, 900, 400])

%% Plot Temperatures combined parameters
figure
plot([1:11],T2(1,:),[1:11],T2(2,:),[1:11],T2(3,:),[1:11],T2(4,:));
xticks([1:11]);
xticklabels({'Toa','To1','To2','To3f','To3','To4','To5.1','To5m','To5.2','To6','To7'});
title('Temperature Profile for Combined Optimized Engines');
legend('Mission 1','Mission 2', 'Mission 3', 'Mission 4');
set(gcf, 'Position',  [100, 100, 900, 400])

%% Plot Pressures combined parameters
figure
plot([1:11],P2(1,:),[1:11],P2(2,:),[1:11],P2(3,:),[1:11],P2(4,:));
xticks([1:11]);
xticklabels({'Poa','Po1','Po2','Po3f','Po3','Po4','Po5.1','Po5m','Po5.2','Po6','Po7'});
title('Pressure Profile for Combined Optimized Engines');
legend('Mission 1','Mission 2', 'Mission 3', 'Mission 4');
set(gcf, 'Position',  [100, 100, 900, 400])