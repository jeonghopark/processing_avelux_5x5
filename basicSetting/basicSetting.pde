// Für Simulation (Mac)
// ~/Projects/LED_Fassade/opc/openpixelcontrol-master(master*) » make && ./bin/gl_server_avelux_5x5 -l ./layouts/freespace_avelux_5x5.json


// Fesnter Number
//  0  1  2  3  4
//  5  6  7  8  9
// 10 11 12 13 14 
// 15 16 17 18 19
// 20 21 22 23 24 


OPC opc[];
Fenster fenster[];

PImage dot;

int runPixelLineX;
int simWidth;

PFont font;

//----------------------------------------------------------------------------
void setup() {

    // Das Size soll man erst lassen.
    size(1000, 700);

    font = createFont("verdana.ttf", 20);
    textFont(font);
    textSize(20);

    int simWidth = 500;

    dot = loadImage("color-dot.png");

    opcSetup();

    fenster = new Fenster[25];
    int _index = 0;
    int _wWidth = simWidth / 6;
    int _wHeight = height / 7;
    for (int j=0; j<5; j++) {
        for (int i=0; i<5; i++) {
            fenster[_index] = new Fenster(i * _wWidth, j * _wHeight, _wWidth, _wHeight);
            _index++;
        }
    }

    runPixelLineX = 0;

}


//----------------------------------------------------------------------------
void draw(){
    background(0);

    pushMatrix();
    for (int i=0; i<fenster.length; i++) {
        fenster[i].basicDisplay();
    }
    popMatrix();

    // Beim index Nummer (zB. [21]) kann man eigene Fenster "an" oder "aus" machen.
    // Die Nummer sind ganz oben.
    fill(255, 0, 0);
    rect(fenster[21].xPos, fenster[21].yPos, fenster[21].width, fenster[21].height);

    // basicMouseInteraction();

}



//----------------------------------------------------------------------------
void basicMouseInteraction(){
    
    // basic mouse interaction : Pixel
    pushMatrix();
    float dotSize = 50;
    image(dot, mouseX - dotSize/2, mouseY - dotSize/2, dotSize * 2, dotSize * 2);
    // rect(mouseX - dotSize/2, mouseY - dotSize/2, dotSize, dotSize);
    popMatrix();

}





//----------------------------------------------------------------------------
void opcSetup() {

    opc = new OPC[5];
    for (int i=0; i<opc.length; i++) {
        opc[i] = new OPC(this, "127.0.0.1", 7890 + i);
    }

    opc[4].ledStrip(0, 60, width/12 * 1, height/7 * 2, 1.0, 0, true);
    opc[4].ledStrip(60, 60, width/12 * 2, height/7 * 2, 1.0, 0, true);
    opc[4].ledStrip(120, 60, width/12 * 3, height/7 * 2, 1.0, 0, false);
    opc[4].ledStrip(180, 60, width/12 * 4, height/7 * 2, 1.0, 0, false);
    opc[4].ledStrip(240, 60, width/12 * 5, height/7 * 2, 1.0, 0, false);
    opc[3].ledStrip(0, 60, width/12 * 1, height/7 * 3, 1.0, 0, true);
    opc[3].ledStrip(60, 60, width/12 * 2, height/7 * 3, 1.0, 0, true);
    opc[3].ledStrip(120, 60, width/12 * 3, height/7 * 3, 1.0, 0, false);
    opc[3].ledStrip(180, 60, width/12 * 4, height/7 * 3, 1.0, 0, false);
    opc[3].ledStrip(240, 60, width/12 * 5, height/7 * 3, 1.0, 0, false);
    opc[2].ledStrip(0, 60, width/12 * 1, height/7 * 4, 1.0, 0, true);
    opc[2].ledStrip(60, 60, width/12 * 2, height/7 * 4, 1.0, 0, true);
    opc[2].ledStrip(120, 60, width/12 * 3, height/7 * 4, 1.0, 0, false);
    opc[2].ledStrip(180, 60, width/12 * 4, height/7 * 4, 1.0, 0, false);
    opc[2].ledStrip(240, 60, width/12 * 5, height/7 * 4, 1.0, 0, false);
    opc[1].ledStrip(0, 60, width/12 * 1, height/7 * 5, 1.0, 0, true);
    opc[1].ledStrip(60, 60, width/12 * 2, height/7 * 5, 1.0, 0, true);
    opc[1].ledStrip(120, 60, width/12 * 3, height/7 * 5, 1.0, 0, false);
    opc[1].ledStrip(180, 60, width/12 * 4, height/7 * 5, 1.0, 0, false);
    opc[1].ledStrip(240, 60, width/12 * 5, height/7 * 5, 1.0, 0, false);
    opc[0].ledStrip(0, 60, width/12 * 1, height/7 * 6, 1.0, 0, true);
    opc[0].ledStrip(60, 60, width/12 * 2, height/7 * 6, 1.0, 0, true);
    opc[0].ledStrip(120, 60, width/12 * 3, height/7 * 6, 1.0, 0, false);
    opc[0].ledStrip(180, 60, width/12 * 4, height/7 * 6, 1.0, 0, false);
    opc[0].ledStrip(240, 60, width/12 * 5, height/7 * 6, 1.0, 0, false);

}


//----------------------------------------------------------------------------
class Fenster {

    float xPos;
    float yPos;
    float width;
    float height;

    float xMid;
    float yMid;

    boolean onoff;
    float fadeValue;

    PVector _offSetPos = new PVector(50, 125);

    Fenster(float x, float y, float w, float h){
        xPos = x + _offSetPos.x;
        yPos = y + _offSetPos.y;
        width = w * 0.8;
        height = h * 0.8;
        xMid = xPos + width * 0.5;
        yMid = yPos + height * 0.5;
        onoff = false;
        fadeValue = 0;
    }

    void basicDisplay(){
        // basic window click drawing
        pushStyle();
        noFill();
        stroke(255, 120);
        rect(xPos, yPos, width, height);
        popStyle();
    }



}