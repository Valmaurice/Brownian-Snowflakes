// Coding Challenge 127: Brownian Motion Snowflake
// Daniel Shiffman
// https://thecodingtrain.com/CodingChallenges/127-brownian-snowflake.html
// https://youtu.be/XUA8UREROYE
// https://editor.p5js.org/codingtrain/sketches/SJcAeCpgE

Particle current;
ArrayList<Particle> snowflake;
PImage sf;
float r = random(255);
float g = random(255);
float b = random(255);


void setup() {
size (640,360);
sf = loadImage("snowflakebg.jpg");
current = new Particle(width/2, 0);
  snowflake = new ArrayList<Particle>();
}

void draw() {
  translate(width/2, height/2);
  rotate(PI/6);
  background(sf);

  int count = 0;
  while (!current.finished() && !current.intersects(snowflake)) {
    current.update();
    count++;
  }

  // If a particle doesn't move at all we're done
  // This is an exit condition not implemented in the video
  if (count == 0) {
    noLoop();
    println("snowflake completed");
  }

  snowflake.add(current);
  current = new Particle(width/2, 0);

  for (int i = 0; i < 6; i++) {
    rotate(PI/3);
    current.show();
    for (Particle p : snowflake) {
      p.show();
    }

    pushMatrix();
    scale(1, -1);
    current.show();
    for (Particle p : snowflake) {
      p.show();
    }
    popMatrix();
  }
}
