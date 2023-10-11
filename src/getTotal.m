function dataByTime = getTotal(dataByAge, dates, numberOfDays)

    total = [];
    names = fieldnames(dataByAge);

    for day = 1:numberOfDays

        dailyTotal = 0;

        for ageGroup = 1:length(names)
            f = dataByAge.(names{ageGroup});
            dailyTotal = dailyTotal + f.Var1(day);
        end

        total = [total dailyTotal];
    end

    dataByTime = timetable(dates', total');
end
