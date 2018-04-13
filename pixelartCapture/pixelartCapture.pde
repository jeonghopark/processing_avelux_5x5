import processing.video.*;

PWindow win;

Capture cam;

color[] pixelColors;

public void settings() {
    size(640, 480);

}

void setup(){

    win = new PWindow();
    cam = new Capture(this, 640, 480);
    cam.start();

    pixelColors = new color[25];

}

void draw(){
    image(cam, 0, 0);

    pushStyle();
    noFill();
    stroke(0, 255, 0);
    int rectSize = 50;

    for (int i=0; i<5; i++) {
        for (int j=0; j<5; j++) {
            int index = i + j * 5;
            rect(i * rectSize + 320 - 125, j * rectSize + 240 - 125, rectSize, rectSize);
            int _x = i * rectSize + 320 - 100;
            int _y = j * rectSize + 240 - 100;
            pixelColors[index] = get(_x, _y);
        }
    }
    popStyle();

}


void keyPressed(){
    if (key == 'c') {
        for (int i=0; i<pixelColors.length; i++) {
            println(i, red(pixelColors[i]), green(pixelColors[i]), blue(pixelColors[i]));
        }
    }
}


void captureEvent(Capture c){
    c.read();
}




//--------------------------------------------------------
class PWindow extends PApplet {
    PWindow() {
        super();
        PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
    }

    int rectSize = 50;

    void settings() {
        size(250, 250);
        pixelColors = new color[25];
    }

    void setup() {
        background(0);
    }

    void draw() {
        pushStyle();
        if (pixelColors.length>0) {
            for (int i=0; i<5; i++) {
                for (int j=0; j<5; j++) {
                    int index = i + j * 5;
                    color _c = pixelColors[index];
                    // noStroke();
                    fill(_c);
                    rect(i * rectSize, j * rectSize, rectSize, rectSize);
                }
            }
        }
        popStyle();

    }

}