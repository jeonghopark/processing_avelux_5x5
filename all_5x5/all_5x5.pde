// ~/Projects/LED_Fassade/opc/openpixelcontrol-master(master*) » make && ./bin/gl_server_avelux_5x5 -l ./layouts/freespace_avelux_5x5.json

import controlP5.*;
ControlP5 cp5;
ControlP5 cp5Sub;

ListBox sceneList;

OPC opc[];
Fenster fenster[];

PImage dot;

int runPixelLineX;
int simWidth;

PFont font;

int stringIndexNum;

color mousePointColor;
color allColor;
boolean allOnOff = false;

//----------------------------------------------------------------------------
void setup() {
    size(1000, 700);


    cp5 = new ControlP5(this);
    setupControlP5();
    cp5Sub = new ControlP5(this);

    font = createFont("verdana.ttf", 20);
    textFont(font);
    textSize(20);

    simWidth = 500;

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
    stringIndexNum = 0;

}


//----------------------------------------------------------------------------
void draw(){
    background(0);

    pushStyle();
    fill(30);
    rect(width * 0.5, 0, width * 0.5, height);
    popStyle();

    pushMatrix();
    for (int i=0; i<fenster.length; i++) {
        fenster[i].basicDisplay();
    }
    popMatrix();


    switch(int(sceneList.getValue())) {
        case 0:
        basicMouseInteraction();
        break;
        
        case 1:
        allWindows();
        break;
        
        case 2:
        basicClickDrawing();
        break;

        case 3:
        basicFadeDrawing();
        break;

        case 4:
        basicLineMoving();
        break;

        case 5:
        if (frameCount % 20 == 0) {
            stringIndexNum++;
        }
        stingView("avelux!");
        break;
    }


    alphaDisplay(key);


}




//----------------------------------------------------------------------------
void stingView(String str) {

    char _c = str.charAt(stringIndexNum % str.length());
    alphaDisplay(_c);

}



//----------------------------------------------------------------------------
void basicMouseInteraction(){

    pushMatrix();

    fill(mousePointColor);

    float dotSize = 50;
    // image(dot, mouseX - dotSize/2, mouseY - dotSize/2, dotSize, dotSize);
    if (mouseX < width * 0.5 ) {
        rect(mouseX - dotSize/2, mouseY - dotSize/2, dotSize, dotSize);
    }
    popMatrix();

}


//----------------------------------------------------------------------------
void allWindows(){

    pushMatrix();
    pushStyle();
    if (allOnOff) {
        for (int i=0; i<fenster.length; i++) {
            fenster[i].display(allColor);
        }
    }
    popStyle();
    popMatrix();

}


//----------------------------------------------------------------------------
void basicClickDrawing(){

    pushMatrix();
    for (int i=0; i<fenster.length; i++) {
        float distX = dist(mouseX, 0, fenster[i].xMid, 0);
        float distY = dist(0, mouseY, 0, fenster[i].yMid);
        fenster[i].clickDisplay();
        fenster[i].basicDisplay();
    }
    popMatrix();

}


//----------------------------------------------------------------------------
void basicFadeDrawing(){

    pushMatrix();
    for (int i=0; i<fenster.length; i++) {
        float distX = dist(mouseX, 0, fenster[i].xMid, 0);
        float distY = dist(0, mouseY, 0, fenster[i].yMid);
        if (distX < fenster[i].width * 0.5 && distY < fenster[i].height * 0.5) {
            fenster[i].onoff = true;
        } else {
            fenster[i].onoff = false;
        }
        
        fenster[i].fadeDisplay();
        fenster[i].basicDisplay();
    }
    popMatrix();

}


//----------------------------------------------------------------------------
void basicLineMoving(){

    pushStyle();
    runPixelLineX = runPixelLineX + 1;
    if (runPixelLineX > simWidth) {
        runPixelLineX = 0;
    }
    stroke(255);
    for (int i=0; i<5; i++) {
        line(runPixelLineX + i, 0, runPixelLineX, height);
    }
    popStyle();

}




//----------------------------------------------------------------------------
void alphaDisplay(char k){
    pushMatrix();
    pushStyle();

    fill(255);

    switch(k) {
        case 'a':
        rectDraw( "11, 12, 13, 14, 21, 24, 31, 32, 33, 34, 41, 44, 51, 54" );
        break;

        case 'b':
        rectDraw("11, 12, 13, 21, 24, 31, 32, 33, 34, 41, 44, 51, 52, 53, 54");
        break;
        
        case 'c':
        rectDraw("11, 12, 13, 21, 31, 41, 51, 52, 53");
        break;

        case 'd':
        rectDraw("11, 12, 13, 21, 24, 31, 34, 41, 44, 51, 52, 53");
        break;

        case 'e':
        rectDraw("11, 12, 13, 21, 31, 32, 41, 51, 52, 53");
        break;

        case 'f':
        rectDraw("11, 12, 13, 21, 31, 32, 41, 51");
        break;

        case 'g':
        rectDraw("11, 12, 13, 14, 21, 31, 33, 34, 41, 44, 51, 52, 53, 54");
        break;

        case 'h':
        rectDraw("11, 14, 21, 24, 31, 32, 33, 34, 41, 44, 51, 54");
        break;

        case 'i':
        rectDraw("11, 21, 31, 41, 51");
        break;

        case 'j':
        rectDraw("12, 13, 23, 33, 41, 43, 51, 52, 53");
        break;

        case 'k':
        rectDraw("11, 14, 21, 23, 31, 32, 41, 43, 51, 54");
        break;

        case 'l':
        rectDraw("11, 21, 31, 41, 51, 52, 53");
        break;

        case 'm':
        rectDraw("11, 12, 13, 14, 15, 16, 21, 23, 25, 31, 33, 35, 41, 45, 51, 55");
        break;

        case 'n':
        rectDraw("11, 14, 21, 22, 24, 31, 33, 34, 41, 44, 51, 54");
        break;

        case 'o':
        rectDraw("11, 12, 13, 14, 21, 24, 31, 34, 41, 44, 51, 52, 53, 54");
        break;

        case 'p':
        rectDraw("11, 12, 13, 14, 21, 24, 31, 32, 33, 34, 41, 51");
        break;

        case 'q':
        rectDraw("11, 12, 13, 14, 21, 24, 31, 34, 41, 43, 44, 51, 52, 53, 54");
        break;

        case 'r':
        rectDraw("11, 12, 13, 14, 21, 24, 31, 32, 33, 34, 41, 43, 51, 54");
        break;

        case 's':
        rectDraw("11, 12, 13, 21, 31, 32, 33, 43, 51, 52, 53");
        break;

        case 't':
        rectDraw("11, 12, 13, 22, 32, 42, 52");
        break;

        case 'u':
        rectDraw("11, 14, 21, 24, 31, 34, 41, 44, 51, 52, 53, 54");
        break;

        case 'v':
        rectDraw("11, 15, 21, 25, 32, 34, 42, 44, 53");
        break;

        case 'w':
        rectDraw("11, 15, 21, 25, 31, 33, 35, 41, 43, 45, 51, 52, 53, 54, 55");
        break;

        case 'x':
        rectDraw("11, 13, 21, 23, 32, 41, 43, 51, 53");
        break;

        case 'y':
        rectDraw("11, 13, 21, 23, 32, 42, 52");
        break;

        case 'z':
        rectDraw("11, 12, 13, 23, 32, 41, 51, 52, 53");
        break;

        case '.':
        rectDraw("51");
        break;

        case ',':
        rectDraw("42, 51");
        break;

        case '!':
        rectDraw("11, 21, 31, 51");
        break;

        case '?':
        rectDraw("11, 12, 13, 23, 32, 33, 52");
        break;

        case '-':
        rectDraw("31, 32, 33");
        break;

        case '>':
        rectDraw("21, 32, 41");
        break;

        case '<':
        rectDraw("22, 31, 42");
        break;

        case '+':
        rectDraw("23, 32, 33, 34, 43");
        break;

        case '=':
        rectDraw("22, 23, 24, 42, 43, 44");
        break;

    }
    popStyle();
    popMatrix();
}


//----------------------------------------------------------------------------
void rectDraw(String alpha_array){
    String[] list = split(alpha_array, ", ");
    for (int i=0; i<list.length; i++) {
        int _y = parseInt(list[i]) / 10 - 1;
        int _x = parseInt(list[i]) % 10 - 1;

        int _index = _x + _y * 5;
        fenster[_index].rectDisplay();
    }
}



//----------------------------------------------------------------------------
void mousePressed(){

    // basic window click drawing
    for (int i=0; i<fenster.length; i++) {
        float distX = dist(mouseX, 0, fenster[i].xMid, 0);
        float distY = dist(0, mouseY, 0, fenster[i].yMid);
        if (distX < fenster[i].width * 0.5 && distY < fenster[i].height * 0.5 && mousePressed) {
            fenster[i].onoff = !fenster[i].onoff;
        }
    }

}


//----------------------------------------------------------------------------
void keyPressed(){

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
void setupControlP5(){

    PFont pfont = createFont("Arial",11,true);
    ControlFont cfont = new ControlFont(pfont,11);

    sceneList = cp5.addListBox("Scene List")
    .setPosition(530, 30)
    .setSize(210, 100)
    .setFont(cfont)
    .setItemHeight(21)
    .setBarHeight(21)
    .setColorBackground(color(60))
    .setColorActive(color(220, 0, 0))
    .setColorForeground(color(120, 220, 120))
    ;

    sceneList.setValue(-1);
    sceneList.getCaptionLabel().toUpperCase(true);
    sceneList.getCaptionLabel().setHeight(20);
    // sceneList.getCaptionLabel().setColor(0xffff0000);
    sceneList.addItem("Mouse Interaction", 0);
    sceneList.addItem("All On Off", 1);
    sceneList.addItem("Click Drawing", 2);
    sceneList.addItem("Fade Drawing", 3);
    sceneList.addItem("Line Moving", 4);
    sceneList.addItem("AVELUX!", 5);

}


void controlEvent(ControlEvent theEvent) {

    if (theEvent.getName() == "Scene List") {
        int _index = (int)(theEvent.getController().getValue());
        switch (_index) {
            case 0:
            cp5Sub.remove(this);
            cp5Sub = new ControlP5(this);
            cp5Sub.addColorWheel("mousePointColor" , 500 + 270 , 30 , 200 ).setRGB(color(128,0,255));
            break;
            case 1:
            cp5Sub.remove(this);
            cp5Sub = new ControlP5(this);
            cp5Sub.addToggle("allOnOff")
            .setPosition(500 + 270, 30)
            .setSize(50,50)
            ;
            cp5Sub.addColorWheel("allColor" , 500 + 270 , 30 + 70 , 200 ).setRGB(color(128,0,255));
            break;
        }
    }

}



//----------------------------------------------------------------------------
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

    void display(){
        // basic window click drawing
        pushStyle();
        fill(255);
        rect(xPos, yPos, width, height);
        popStyle();
    }

    void display(color c){
        // basic window click drawing
        pushStyle();
        fill(c);
        rect(xPos, yPos, width, height);
        popStyle();
    }


    void rectDisplay(){
        pushStyle();
        fill(255);
        rect(xPos, yPos, width, height);
        popStyle();
    }


    void clickDisplay(){

        // basic window fade drawing
        if (onoff == false) {
            fadeValue = 0;
        } else {
            fadeValue = 255;
        }

        pushStyle();
        fill(fadeValue);
        rect(xPos, yPos, width, height);
        popStyle();
    }


    void fadeDisplay(){

        // basic window fade drawing
        if (onoff == false) {
            fadeValue = fadeValue - 5;
            if (fadeValue < 0) {
                onoff = true;
                fadeValue = 0;
            }
        } else {
            fadeValue = 255;
        }

        pushStyle();
        fill(fadeValue);
        rect(xPos, yPos, width, height);
        popStyle();

    }

}