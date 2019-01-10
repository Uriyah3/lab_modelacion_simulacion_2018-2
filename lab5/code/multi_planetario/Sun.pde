class Sun {
  PVector pos;
  PVector speed;
  float mass;
  float radius;
  Planet[] planets;
  
  Sun(float x, float y, float m, float r) {
    this.pos = new PVector(x, y);
    this.mass = m;
    this.radius = r;
    this.planets = new Planet[0];
    this.speed = new PVector(0, -1);
  }
  
  void addPlanet(Planet newPlanet) {
    this.planets = (Planet[]) append(planets, newPlanet);
  }
  
  void calculatePlanetsOrbit() {
    if(this.planets != null) {
      for (int i = 0; i < this.planets.length; i++) {
        this.planets[i].addGravitationForce(this.pos, this.mass);
        for(int j = 0; j < this.planets.length; j++) {
          if(j != i) {
            this.planets[i].addGravitationForce(planets[j].pos, planets[i].mass);
          }
        }
      }
    }
  }
  
  void rotateSun() {
    float ax = -this.pos.x / sq(dist(0,0,this.pos.x,this.pos.y));
    float ay = -this.pos.y / sq(dist(0,0,this.pos.x,this.pos.y));
    this.speed.add(new PVector(ax, ay));
    this.pos.add(speed);
  }
  
  void movePlanets() {
    this.rotateSun();
    if(this.planets != null) {
      for (int i = 0; i < this.planets.length; i++) {
        this.planets[i].calculateNewPos();
      }
    }
  }
  
  void display() {
    pushMatrix();
    fill(255, 50, 50);
    ellipse(this.pos.x, this.pos.y, this.radius*2, this.radius*2);
    
    
    if(this.planets != null) {
      for (int i = 0; i < this.planets.length; i++) {
        this.planets[i].display();
      }
    }
    popMatrix();
  }

}
