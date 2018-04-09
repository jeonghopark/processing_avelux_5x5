import processing.video.*;

Capture cam;

color[] pixelColors;

void setup(){
    size(640, 480);

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

    pushStyle();
    for (int i=0; i<5; i++) {
        for (int j=0; j<5; j++) {
            int index = i + j * 5;
            color _c = pixelColors[index];
            // noStroke();
            fill(_c);
            rect(i * rectSize * 0.2 + 20, j * rectSize * 0.2 + 20, rectSize * 0.2, rectSize * 0.2);
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


