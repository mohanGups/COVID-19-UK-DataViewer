function [time, output] = timeTableStruct2Array(tt)

    output = [];
    names = fieldnames(tt);

    for f = 1:length(names)

        name = names{f};
        output = [output tt.(name).Var1];

    end

    time = tt.(name).Time;

end
