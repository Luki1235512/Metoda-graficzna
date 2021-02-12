clear all
close all
clc

A = [3, 2, 1; 5, 4, 3; 1, 1, 0; -1, 0, 0; 0, -1, 0; 0, 0, -1];
B = [120; 300; 50; 0; 0; 0];
fc = [12, 8, 10];

w1 = [1, 2, 3, 4, 5, 6];

%nchoosek()
p1 = nchoosek(w1,3);

tab = [];

for i = 1:length(p1)
    
    v1 = A(p1(i,1),:);
    v2 = A(p1(i,2),:);
    v3 = A(p1(i,3),:);
    
    vs = [v1;v2;v3];
    p = [B(p1(i,1)); B(p1(i,2)); B(p1(i,3))];
    x = vs\p;
    eps = 10^(-13);1e-13;
    
    if all(A*x-B <= eps) 
        tab = [tab,x];
    end
end

conv = convhull(tab(1,:), tab(2,:), tab(3,:));
trisurf(conv,tab(1,:), tab(2,:), tab(3,:));
[v, indx] = max(fc*tab);
ret = tab(:, indx);

hold on

plot3(ret(1),ret(2),ret(3),'r*','MarkerSize',25);