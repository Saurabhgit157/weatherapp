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

class WeatherState {
  final bool isLoading;
  final String errorMessage;
  final WeatherModel? weather; // 1. Isse nullable (?) banaya kyunki shuru mein data nahi hota

  WeatherState({
    required this.isLoading,
    required this.errorMessage,
    this.weather, // 2. required hata diya kyunki shuru mein ye null ho sakta hai
  });


  WeatherState copyWith({
    bool? isLoading,
    String? errorMessage,
    WeatherModel? weather,
  }) {
    // 4. Return ke baad constructor call mein () aayega, {} nahi
    return WeatherState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      weather: weather ?? this.weather,
    );
  }
}