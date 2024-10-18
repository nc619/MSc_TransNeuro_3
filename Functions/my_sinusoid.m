function [] = my_sinusoid(frequencies)
% output1 is empty because we are not returning anything since we are only
% doing a plot
figure;
hold on;
grid on;
x = 0:0.05:4*pi;
for w = frequencies
    plot(x,sin(w*x),'DisplayName', "\omega = "+w)
end
xlabel("Frequency (rad)")
ylabel("sin(\omega x)")
ylim([-1,1])
xlim([0,4*pi])
xticks(0:pi/2:4*pi)
yticks(-1:0.25:1)
xticklabels(["0","\pi/2","\pi","3\pi/2","2\pi","5\pi/2","3\pi","7\pi/2","4\pi"])
legend()
title("Cool waves!")
end

