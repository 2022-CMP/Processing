String url = "http://worldtimeapi.org/api/timezone/Asia/Seoul";

void setup() {
  size(100,100);
  JSONObject json = loadJSONObject(url);
  println(json);
}
