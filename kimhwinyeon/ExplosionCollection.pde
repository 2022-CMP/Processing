class ExplosionCollection {

final int NUM_SHARDS = 100;  // number of particles in an explosion
ArrayList<Shard> shards;  // initialized to null

ExplosionCollection() {
  // an explosion consists of many small shards
  shards = new ArrayList<Shard>();
  for(int i = 0; i < NUM_SHARDS; ++i) {
    Shard s = new Shard();
    shards.add(s);
  }
}

void drawExplosion() {
    smooth();
  noStroke();
  fill(255, 255, 0);   // yellow

  for(Shard s : shards) {
    s.render();
    s.update();
  }
}
}