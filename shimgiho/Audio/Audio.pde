import processing.sound.*;
SoundFile[] song = new SoundFile[3]; // 만약에 여러 이펙트가 들어가게 된다면 배열로 변경할 것

void setup() {
  size(800, 600);
  background(255);
  for(int i =0;i<song.length;i++)
  song[i] =  new SoundFile(this, "Soundsample.mp3"); // 배열로 변경한다면 for문 돌려서 음악 넣을 것
  song[0].loop(); // 배경음악에 사용할 듯
}

void draw() {
}

void mousePressed() {
  if ( mouseButton == LEFT) {
    song[1].play(); // 이펙트 (필요하다면 동작마다 1개씩 + 무너지는 사운드(?) 정도)
  }
}
