class NewLightnings {
    ArrayList<NewLightning> lightnings = new ArrayList<NewLightning>(); 
    boolean firstOccur = true;

    // Check Done
    boolean Done = false;

    void Update () {
        if(firstOccur) {
            firstOccur = false;
            for (int i = 0 ; i < 3 ; i++)
                lightnings.add(new NewLightning(new PVector(random(0, width), 0), 0, 7));
        }

        for (int i = lightnings.size() - 1; i >=0; i--) {
            lightnings.get(i).Update();
            lightnings.get(i).show();

            if (lightnings.get(i).dead) {
                lightnings.remove(i);
            }
        }
    }

    void ResetLightnings () {
        firstOccur = true;
    }

}
