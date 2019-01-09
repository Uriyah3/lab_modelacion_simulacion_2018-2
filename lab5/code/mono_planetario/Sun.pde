class Sun {
  PVector pos;
  float mass;
  float radius;
  Planet[] planets;
  
  Sun(float x, float y, float m, float r) {
    pos = new PVector(x, y);
    mass = m;
    radius = r;
    planets = new Planet[0];
  }
  
  void addPlanet(Planet newPlanet) {
    planets = (Planet[]) append(planets, newPlanet);
  }
  
  void calculatePlanetsOrbit() {
    if(planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].addGravitationForce(this.pos, this.mass);
        for(int j = 0; j < planets.length; j++) {
          if(j != i) {
            planets[i].addGravitationForce(planets[j].pos, planets[i].mass);
          }
        }
      }
    }
  }
  
  void movePlanets() {
    if(planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].calculateNewPos();
      }
    }
  }
  
  void display() {
    pushMatrix();
    fill(255, 50, 50);
    ellipse(pos.x, pos.y, radius*2, radius*2);
    
    
    if(planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].display();
      }
    }
    popMatrix();
  }

}
