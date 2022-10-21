import processing.sound.*;

class SoundManager {
    // By using HashMap, How about soundFile call by that String?

    HashMap<String,SoundFile> soundCollection = new HashMap<String,SoundFile>();
    String[] soundNames = {"Soundsample.mp3",
                            
                            
                            };

    SoundManager () {
      // Please Put sounds to soundCollection
        for(String soundName : soundNames) {
            soundCollection.put(soundName, new SoundFile(myClass, soundName));
        }

        // soundCollection.get("Song.mp3").loop(); // (Background Music)
    }

    void SoundPlay (String soundName) {
        soundCollection.get(soundName).play();
    }
}
