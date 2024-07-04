format long;
%% Use of ar_fit_model:
[y, Fs] = audioread('gong.wav');
disp("First element: ")
% disp(y(1));
% p = 4;
p = 300;
a = ar_fit_model(y, p); 

% disp("A matrix: ");
% disp(a);

%% Use of ar_predict:
N = length(y); 
y0 = y(1:p); 
[y_pred] = ar_predict(a, y0, N); 

% show predicted signal (truncated)
h = figure();
K = 10000; 
plot(y(1:K), 'b'); hold on 
plot(y_pred(1:K), 'r'); hold off 

audiowrite('gong_predicted.wav', y_pred, Fs);
