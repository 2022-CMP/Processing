class Tower {
  Stack<Block> Tower = new Stack<>();

  // DEFAULT Constructor
  Tower() {};

  void drawTower() {
    for (int i = 0; i < Tower.size(); i++) {
      if (Tower.get(i).isTextureMode) {
        Tower.get(i).drawTextureBlock();
      }
      else {
        Tower.get(i).drawColorBlock();
      }
    }

    return;
  }

  void pushBlock(Block block) {
    if (Tower.isEmpty()) {
      Tower.push(block);
    }
    else {
      block.y = Tower.peek().y - Tower.peek().blockHeight;
      println(block.y);
      Tower.push(block);
    }

    return;
  }

  Block popBlock() {
    return Tower.pop();
  }
}