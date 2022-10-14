String turl = "http://worldtimeapi.org/api/timezone/Asia/Seoul";
String API_KEY = "4d54a1ec2d1746a823e46b9a79d59fde";
String wurl = "https://api.openweathermap.org/data/2.5/weather?q=Suwon,kr&lat={lat}&lon={lon}&appid="+API_KEY;
void setup() {
  size(100,100);
  JSONObject tjson = loadJSONObject(turl);
  String tt = tjson.getString("datetime");
  tt = tt.substring(tt.length() - 21,tt.length() - 13);
  JSONObject wjson = loadJSONObject(wurl);
  String tw = wjson.getJSONArray("weather").getJSONObject(0).getString("icon");
   println("Time is "+tt);
  println(tw + " success?");
}
