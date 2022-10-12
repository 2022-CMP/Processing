String API_KEY = "4d54a1ec2d1746a823e46b9a79d59fde";
String url = "https://api.openweathermap.org/data/2.5/weather?q=Suwon,kr&lat={lat}&lon={lon}&appid="+API_KEY;
void setup() {
  size(800, 600);
  JSONObject json = loadJSONObject(url);
  println(json);
}
//weather icon이 09d, 09n, 10d, 10n(rain) and 11d,11n(thunderstorm) 50d,50n (snow)
