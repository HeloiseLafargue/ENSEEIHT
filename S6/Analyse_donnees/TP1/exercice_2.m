clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);
figure('Name','Separation des canaux RVB','Position',[0,0,0.67*L,0.67*H]);
figure('Name','Nuage de pixels dans le repere RVB','Position',[0.67*L,0,0.33*L,0.45*H]);

% Lecture et affichage d'une image RVB :
I = imread('ishihara-0.png');
figure(1);				% Premiere fenetre d'affichage
subplot(2,2,1);				% La fenetre comporte 2 lignes et 2 colonnes
imagesc(I);
axis off;
axis equal;
title('Image RVB','FontSize',20);

% Decoupage de l'image en trois canaux et conversion en doubles :
R = double(I(:,:,1));
V = double(I(:,:,2));
B = double(I(:,:,3));

% Affichage du canal R :
colormap gray;				% Pour afficher les images en niveaux de gris
subplot(2,2,2);
imagesc(R);
axis off;
axis equal;
title('Canal R','FontSize',20);

% Affichage du canal V :
subplot(2,2,3);
imagesc(V);
axis off;
axis equal;
title('Canal V','FontSize',20);

% Affichage du canal B :
subplot(2,2,4);
imagesc(B);
axis off;
axis equal;
title('Canal B','FontSize',20);

% Affichage du nuage de pixels dans le repere RVB :
figure(2);				% Deuxieme fenetre d'affichage
plot3(R,V,B,'b.');
axis equal;
xlabel('R');
ylabel('V');
zlabel('B');
rotate3d;

% Matrice des donnees :
X = [R(:) V(:) B(:)];			% Les trois canaux sont vectorises et concatenes

% Matrice de variance/covariance :
n = length(X);
Xc = X - mean(X);
Sigma = Xc'*Xc/n;

% Coefficients de correlation lineaire :
rRV = Sigma(1,2)/sqrt(Sigma(1,1)*Sigma(2,2));
rRB = Sigma(1,3)/sqrt(Sigma(1,1)*Sigma(3,3));
rVB = Sigma(2,3)/sqrt(Sigma(2,2)*Sigma(3,3));

% Proportions de contraste :
denom = Sigma(1,1) + Sigma(2,2) + Sigma(3,3);
cr = Sigma(1,1)/denom;
cv = Sigma(2,2)/denom;
cb = Sigma(3,3)/denom;

% Vecteurs propres et valeurs propres de Sigma :
[W,D] = eig(Sigma);

% Valeurs propres par ordre décroissant et matrice des vecteurs propres associés:
[valp, indices] = sort(diag(D),'descend');

W = W(:, indices);

% Matrice des composantes principales :
C = Xc*W;

% Les trois colonnes de C :
C1 = reshape(C(:,1), size(V));
C2 = reshape(C(:,2), size(V));
C3 = reshape(C(:,3), size(V));
figure
% Affichage du canal R :
colormap gray;				% Pour afficher les images en niveaux de gris
subplot(2,2,1);
imagesc(C1);
axis off;
axis equal;
title('Canal R','FontSize',20);

% Affichage du canal V :
subplot(2,2,2);
imagesc(C2);
axis off;
axis equal;
title('Canal V','FontSize',20);

% Affichage du canal B :
subplot(2,2,3);
imagesc(C3);
axis off;
axis equal;
title('Canal B','FontSize',20);