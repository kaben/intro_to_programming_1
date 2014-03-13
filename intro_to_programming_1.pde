Planet earth;
Planet sun;

ArrayList<Meteor> mets;
// Which meteor to tweak.
int met_idx;

void setup() {
  size(600, 600);
  frameRate(25);
  background(0);
  earth = new Planet();
  earth.name = "Earth";
  earth.myColor = color(0, 0, 255);
  earth.dx = earth.dy = -5;
  earth.loc[0] = 58;

  sun = new Planet();
  sun.name = "Sun";
  sun.mySize = 150;
  sun.dx = sun.dy = 5;

  mets = new ArrayList<Meteor>();
  met_idx = 0;
}

void draw() {
  background(0);

  sun.drawPlanet();
  earth.drawPlanet();

  for ( Meteor met : mets) {
    met.drawPlanet();
    if (met.following) {
      // Construct a displacement vector from the meteor to the mouse.
      float dx = mouseX - met.loc[0];
      float dy = mouseY - met.loc[1];
      // Get the length of said vector, so we can normalize.
      float d = sqrt(dx*dx+dy*dy);
      // Set meteor's new velocity vector, of speed five, pointing from the meteor to the mouse. 
      met.dx = dx*5/d;
      met.dy = dy*5/d;
    }
  }
}

void mouseClicked() {
  mets.add( new Meteor() );
}

void keyPressed() {
  if ( key == 'n' && !mets.isEmpty() ) {
    // Key 'n' selects the next meteor.
    met_idx = (met_idx + 1) % mets.size();  
  } else if (key == 'f' ) {
    // Key 'f' toggles the current meteor's following behavior.
    mets.get(met_idx).following = !(mets.get(met_idx).following);
  } else if (key == 'd') {
    // Key 'd' removes the current meteor.
    mets.remove(met_idx);
    if (!mets.isEmpty()) {
      met_idx = met_idx % mets.size();
    } else {
      met_idx = -1;
    }
  }
}

