% Camera identification example

'Example - Do the three images represent the same camera that took the image Pxxx.jpg?'
im1 = 'Images\P1.jpg',
im2 = 'Images\P2.jpg',
im3 = 'Images\P3.jpg',
Images(1).name = im1;  Images(2).name = im2;  Images(3).name = im3; 
RP = getFingerprint(Images);
RP = rgb2gray1(RP);
    sigmaRP = std2(RP);
Fingerprint = WienerInDFT(RP,sigmaRP);

imx = 'Images\Pxxx.jpg',
% Noisex = NoiseExtractFromImage(imx,2);
Noisex1 = NoiseExtractFromImage(imx,2);
%Noisex = WienerInDFT(Noisex,std2(Noisex));
Noisex = WienerInDFT(Noisex1,std2(Noisex1));
% figure(10), imshow(Noisex1)
% figure(20), imshow(Noisex)

% The optimal detector (see publication "Large Scale Test of Sensor Fingerprint Camera Identification")
Ix = double(rgb2gray(imread(imx)));
C = crosscorr(Noisex,Ix.*Fingerprint);
C1 = crosscorr(Noisex1,Ix.*Fingerprint);

figure(30), imshow(C)
figure(40), imshow(C1)

detection = PCE(C)
detection1 = PCE(C1)

addpath(pdw, "Filter");
addpath(pdw, "Functions");

