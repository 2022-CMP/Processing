class NewLightnings {
    ArrayList<NewLightning> lightnings = new ArrayList<NewLightning>(); 
    boolean firstOccur = false;

    // Check Running
    boolean isRunning = false;

    void Update () {
        if(firstOccur) {
            firstOccur = false;
            for (int i = 0 ; i < 7 ; i++)
                lightnings.add(new NewLightning(new PVector(random(0, width), 0), 0, 7));

            isRunning = true;
        }

        for (int i = lightnings.size() - 1; i >=0; i--) {
            lightnings.get(i).Update();
            lightnings.get(i).show();

            if (lightnings.get(i).dead) {
                lightnings.remove(i);
            }
        } 
        
        if (lightnings.size() == 0 && isRunning) {
            isRunning = false;

            // signal
            BlockRemove();
        }
    }

    void ResetLightnings () {
        firstOccur = true;
    }

}
