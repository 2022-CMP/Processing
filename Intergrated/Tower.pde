class Tower { // for store stacking block
  Stack<Block> Tower = new Stack<>();

  // DEFAULT Constructor
  Tower() {};

  void drawTower() { // to show
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

  void pushBlock(Block block) { // add
    if (Tower.isEmpty()) {
      Tower.push(block);
    }
    else {
      block.y = Tower.peek().y - Tower.peek().blockHeight;
      Tower.push(block);
    }

    return;
  }

  Block popBlock() { //remove
    return Tower.pop();
  }
}
