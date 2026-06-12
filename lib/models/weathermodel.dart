class WeatherConditions {
  final String main;
  final String description;

  WeatherConditions({
    required this.main,
    required this.description,
  });
}

class MainWeatherData {
  final double temperature;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  MainWeatherData({
    required this.temperature,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,

  });
}

class WeatherModel{
  final String cityName;
  final String countryName;
  final WeatherConditions condition;
  final MainWeatherData main;

  WeatherModel({
    required this.cityName,
    required this.countryName,
    required this.condition,
    required this.main,
});

}
