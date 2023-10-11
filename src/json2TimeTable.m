function [dates, dataByAge, numberOfDays] = json2TimeTable(data, jsonName, metric)

    numberOfDays = length(data);
    dates(1:numberOfDays) = datetime('now');
    numberOfAgeGroups = length(data(1).(jsonName));
    dataByAge = struct();

    for day = 1:numberOfDays
        dates(day) = datetime(data(day).date);
    end

    for ageGroup = 1:numberOfAgeGroups
        cases = [];
        ageString = ['Age_' num2str(strrep(data(1).(jsonName)(ageGroup).age, '+', 'plus'))];

        for day = 1:numberOfDays
            cases = [cases data(day).(jsonName)(ageGroup).(metric)];
        end

        cases = smoothData(cases);

        dataByAge.(ageString) = timetable(dates', cases');
    end

    if isfield(dataByAge, 'Age_60plus')
        dataByAge = rmfield(dataByAge, 'Age_60plus');
    end

    if isfield(dataByAge, 'Age_00_59')
        dataByAge = rmfield(dataByAge, 'Age_00_59');
    end

end
