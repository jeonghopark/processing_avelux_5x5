// ~/Projects/LED_Fassade/opc/openpixelcontrol-master(master*) » make && ./bin/gl_server_avelux_5x5 -l ./layouts/freespace_avelux_5x5.json

OPC opc[];
Fenster fenster[];

PImage dot;

int runPixelLineX;
int simWidth;

PFont font;

//----------------------------------------------------------------------------
void setup() {
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


    switch(key) {
        case 49:
            basicMouseInteraction();
            text("Mouse Interaction", 30, 30);
            break;
        
        case 50:
            allWindows();
            text("All On Off", 30, 30);
            break;
        
        case 51:
            basicClickDrawing();
            text("Click Drawing", 30, 30);
            break;

        case 52:
            basicFadeDrawing();
            text("Fade Drawing", 30, 30);
            break;

        case 53:
            basicLineMoving();
            text("Line Moving", 30, 30);
            break;

    }


    alphaDisplay(key);

}



//----------------------------------------------------------------------------
void basicMouseInteraction(){
    
    // basic mouse interaction : Pixel
    pushMatrix();
    float dotSize = 50;
    // image(dot, mouseX - dotSize/2, mouseY - dotSize/2, dotSize, dotSize);
    rect(mouseX - dotSize/2, mouseY - dotSize/2, dotSize, dotSize);
    popMatrix();

}


//----------------------------------------------------------------------------
void allWindows(){
    
    // basic window setting
    pushMatrix();
    for (int i=0; i<fenster.length; i++) {
        fenster[i].display();
    }
    popMatrix();
   
}


//----------------------------------------------------------------------------
void basicClickDrawing(){

    // basic window click drawing
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

    // basic window fade drawing
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
        int[] a_array = {13, 22, 24, 31, 35, 41, 42, 43, 44, 45, 51, 55};
        rectDraw( a_array );
        break;
        case 'b':
        int[] b_array = {11, 12, 13, 14, 21, 25, 31, 32, 33, 34, 41, 45, 51, 52, 53, 54};
        rectDraw(b_array);
        break;
        case 'c':
        int[] c_array = {12, 13, 14, 21, 25, 31, 41, 45, 52, 53, 54};
        rectDraw(c_array);
        break;
    }
    popStyle();
    popMatrix();
}


//----------------------------------------------------------------------------
void rectDraw(int[] alpha_array){
    for (int i=0; i<alpha_array.length; i++) {
        int _y = alpha_array[i] / 10 - 1;
        int _x = alpha_array[i] % 10 - 1;
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