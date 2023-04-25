class ApiConstants {
  ApiConstants._();

  static const String baseUrl = "https://api.openweathermap.org/data/2.5/weather";
  static const String appId = 'bb7d26000bd3179d887121ada2ff0ac1';

   static String currentCityWeather(String city) => "$baseUrl/weather?q=$city&appid=&units=metric";


}
