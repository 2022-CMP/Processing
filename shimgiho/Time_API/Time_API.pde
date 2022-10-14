String turl = "http://worldtimeapi.org/api/timezone/Asia/Seoul";
String API_KEY = "4d54a1ec2d1746a823e46b9a79d59fde";
String wurl = "https://api.openweathermap.org/data/2.5/weather?q=Suwon,kr&lat={lat}&lon={lon}&appid="+API_KEY;
JSONObject tjson;
String tt;
JSONObject wjson;
String tw;
PFont font;
PImage weatherImage[] = new PImage[4]; // thanks for flaticon
void setup() {
  size(displayWidth,displayHeight,P3D);
  font = createFont("h8514fix",height/12); // thanks for microsoft
  for(int i =0;i<4;i++){
    weatherImage[i] = loadImage("Weather"+i+".png");
  }
  tjson = loadJSONObject(turl);
  tt = tjson.getString("datetime");
  tt = tt.substring(tt.length() - 21, tt.length() - 16);
  wjson = loadJSONObject(wurl);
  tw = wjson.getJSONArray("weather").getJSONObject(0).getString("icon");
}
int s;
boolean sCheck = false;
  void draw() {
    background(255);
  s = second();
  if (s ==0 && sCheck == false) {
    tjson = loadJSONObject(turl);
    tt = tjson.getString("datetime");
    tt = tt.substring(tt.length() - 21, tt.length() - 16);
    wjson = loadJSONObject(wurl);
    tw = wjson.getJSONArray("weather").getJSONObject(0).getString("icon");
    sCheck = true;
  }else if(sCheck == true) sCheck = false;
  textFont(font,height/12);
  fill(0);
  text(tt,width-height/4,height/12);
  if(tw =="09d" || tw == "09n" || tw == "10d" || tw == "10n"){
    image(weatherImage[2],width - height/4,height/6,height/8,height/8);
  }else if(tw == "11d" || tw =="11n"){
    image(weatherImage[3],width - height/4,height/6,height/8,height/8);
  }else if(tw == "50d" || tw == "50n"){
    image(weatherImage[0],width - height/5,height/7,height/8,height/8);
  }else{
    image(weatherImage[1],width - height/5,height/7,height/8,height/8);
  }
}
