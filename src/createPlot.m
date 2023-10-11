function createPlot(ax1, dataByAge, plotLegend)

    [time, data] = timeTableStruct2Array(dataByAge);

    names = fieldnames(dataByAge);
    cm = colorMapInterpolated(length(names));
    chrt = area(ax1, time, data);

    for ageGroup = 1:length(names)
        chrt(ageGroup).FaceColor = cm(ageGroup, 1:3);
        chrt(ageGroup).EdgeColor = cm(ageGroup, 1:3);
        chrt(ageGroup).DisplayName = names{ageGroup};
    end

    ax1.XAxis.TickLabelFormat = 'dd-MMM-yyyy';
    ax1.XAxis.TickLabelRotation = 30;
    ax1.XAxis.MinorTick = 'on';
    ax1.YMinorGrid = 'on';
    ax1.XMinorGrid = 'on';

    if plotLegend
        legend(ax1);
        ax1.Legend.Location = 'westoutside';
        ax1.Legend.Interpreter = 'none';
    end

end
