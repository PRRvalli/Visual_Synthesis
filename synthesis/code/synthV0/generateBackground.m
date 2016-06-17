%%
% This code generates the "image of edges"

%%
clc;clear all; close all;
I0 = imread('backgroundFace.jpg');
I = I0(:,:,1); 

BW1 = edge(I,'sobel');
BW2 = edge(I,'canny');
BW3 = edge(I,'Prewitt');
% figure;
% imshow(I);
imwrite(BW3,'backgroundFaceEdge.jpg');
% imshowpair(BW1,BW3,'montage')
% title('Sobel Filter                                   Canny Filter');