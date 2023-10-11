clear all; clc; close all;
h = figure;
ax1 = subplot(3, 1, 1);
ax2 = subplot(3, 1, 2);
% ax3 = subplot(3, 1, 3);

jsonName = 'newCasesBySpecimenDateAgeDemographics';
metric = 'cases';
data = fetchData(jsonName);
[dates, dataByAge, numberOfDays] = json2TimeTable(data, jsonName, metric);
dataByTime = getTotal(dataByAge, dates, numberOfDays);
createPlot(ax1, dataByAge, true);
ax1.Title.String = 'Cases';

jsonName = 'newDeaths28DaysByDeathDateAgeDemographics';
metric = 'deaths';
data = fetchData(jsonName);
[~, dataByAge, ~] = json2TimeTable(data, jsonName, metric);
createPlot(ax2, dataByAge, true);
ax2.Title.String = 'Deaths';

% jsonName = 'vaccinationsAgeDemographics';
% metric = 'cumPeopleVaccinatedFirstDoseByVaccinationDate';
% data = fetchData(jsonName);
% [~, dataByAge, ~] = json2TimeTable(data, jsonName, metric);
% createPlot(ax3, dataByAge, true);
% ax3.Title.String = 'First Vaccine Dose';

linkaxes([ax1 ax2], 'x');
