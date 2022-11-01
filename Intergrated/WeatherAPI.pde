class WeatherAPI {
  // Weather
  String API_KEY = "4d54a1ec2d1746a823e46b9a79d59fde";
  String wurl = "https://api.openweathermap.org/data/2.5/weather?q=Suwon,kr&lat={lat}&lon={lon}&appid="+API_KEY;
  JSONObject weatherInfo;
  PImage weatherImage[] = new PImage[4]; // thanks for flaticon ()
  String tw;
  String timeChecker; //easy to checking time(hour) to chopstick condition
  String weatherChecker; // easy to checking weather to demolishing things condition
  PFont font; // time font 

  // Time
  String turl = "http://worldtimeapi.org/api/timezone/Asia/Seoul";
  JSONObject tjson;
  String tt;


  WeatherAPI () throws Exception {
    // Weather
    weatherInfo = loadJSONObject(wurl);
    font = createFont("h8514fix", height/12); // thanks for microsoft
    for (int i =0; i<4; i++) {
      weatherImage[i] = loadImage("Weather"+i+".png");
    }

    tw = weatherInfo.getJSONArray("weather").getJSONObject(0).getString("icon");

    // Time
    tjson = loadJSONObject(turl);
    tt = tjson.getString("datetime");
    tt = tt.substring(tt.length() - 21, tt.length() - 16); // showing  HH:MM
    timeChecker = tt.substring(tt.length() - 5, tt.length()-3); // only HH
  }


  int s;
  boolean sCheck = false;

  void run () {
    /*
        s = second();
     if (s == 0 && sCheck == false) {
     tjson = loadJSONObject(turl);
     tt = tjson.getString("datetime");
     tt = tt.substring(tt.length() - 21, tt.length() - 16);
     weatherInfo = loadJSONObject(wurl);
     tw = weatherInfo.getJSONArray("weather").getJSONObject(0).getString("icon");
     sCheck = true;
     timeChecker = tt.substring(tt.length() - 5, tt.length()-3);
     }
     */

    if (s == 1) sCheck = false;

    textFont(font, height/12);
    fill(0);
    text(tt, width-height/4, height/25);

    if (tw =="09d" || tw == "09n" || tw == "10d" || tw == "10n") { // rain
      image(weatherImage[2], width - height/4, height/6, height/8, height/8);
      weatherChecker = "rain";
    } else if (tw == "11d" || tw =="11n") { // rain and thunder(thunderstorm)
      image(weatherImage[3], width - height/4, height/6, height/8, height/8);
      weatherChecker = "thunder";
    } else if (tw == "50d" || tw == "50n") { // snow
      image(weatherImage[0], width - height/5, height/7, height/8, height/8);
      weatherChecker = "snow";
    } else { // other weather
      image(weatherImage[1], width - height/5, height/7, height/8, height/8);
      weatherChecker = "sun";
    }
  }
}
