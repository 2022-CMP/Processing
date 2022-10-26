import processing.sound.*;

class SoundManager {
  // By using HashMap, How about soundFile call by that String?

  HashMap<String, SoundFile> soundCollection = new HashMap<String, SoundFile>();
  String[] soundNames = {"Background.wav", "Bomb.wav", "Chopsticks.wav",
    "Fire.wav", "Punch.wav", "Thunder.wav", "Wind.wav"
  };

  SoundManager () {
    // Please Put sounds to soundCollection
    for (String soundName : soundNames) {
      soundCollection.put(soundName, new SoundFile(myClass, soundName));
    }

    // soundCollection.get("Song.mp3").loop(); // (Background Music)
  }

  void SoundPlay (String soundName) {
    soundCollection.get(soundName).play();
  }
  void BackgroundMusic (String background) {
    soundCollection.get(background).loop();
  }
  void SoundAmp(String soundName, float soundAmp) {
    soundCollection.get(soundName).amp(soundAmp);
  }
}
