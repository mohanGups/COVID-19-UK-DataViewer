function json = fetchData(metric)

    options = weboptions('Timeout', 60);
    api = ['https://api.coronavirus.data.gov.uk/v2/data?areaType=nation&areaCode=E92000001&metric=' metric '&format=json'];
    json = webread(api, options);
    json = json.body;

end
