function my_violinplot(data, labels, show_box)

arguments
    data
    labels = 'Data'+string(1:size(data,2))
    show_box=true
end

violinplot([1:size(data,2)],data);
hold on
box_h = boxplot(data, 'Labels',labels, 'PlotStyle','compact');
% Remove the boxes from the boxplot
if ~show_box
    set(findobj(gca, 'Tag', 'Box'), 'Visible', 'off');
end
% Customize the plot
grid on;
hold off
end

