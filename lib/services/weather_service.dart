import 'dart:convert'; // JSON ko badalne ke liyei
import '../models/weathermodel.dart'; // Hamara Model
import 'package:http/http.dart' as http;

class WeatherService{
  final String apiKey = "02e25fe6823ddc54262877c42b738e84";

  Future<WeatherModel?> getWeatherData(String cityName) async{

    try{
      final String geoURL ="http://api.openweathermap.org/geo/1.0/direct?q=$cityName&limit=1&appid=$apiKey";

      final geoResponse = await http.get(Uri.parse(geoURL));

      if(geoResponse.statusCode !=200 || (jsonDecode(geoResponse.body) as List).isEmpty)
        {
          throw Exception("data not found");
        }

      final geoData = jsonDecode(geoResponse.body)[0];
      double lat = geoData['lat'];
      double lon = geoData['lon'];

      final String weatherURL = "https://api.openweathermap.org/data/4.0/onecall/current?lat=$lat&lon=$lon&appid=$apiKey&units=metric";
      final response = await http.get(Uri.parse(weatherURL));

      if(response.statusCode==200){
        var jsonData = jsonDecode(response.body);
        return WeatherModel.fromJson(jsonData);
      }
      else{
        print("failed here");
        throw Exception("Failed to load the data");
      }
    }
    catch(e){
      print("failed here $e");
      throw Exception("Error: $e");
    }
  }
}