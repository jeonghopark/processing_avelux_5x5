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

    color oneColor;

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
        oneColor = color(0);
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
        rect(xPos, yPos, width, height);
        popStyle();
    }


    void clickDisplay(){
        if (onoff == false) {
            oneColor = color(0);
        } 

        pushStyle();
        fill(oneColor);
        rect(xPos, yPos, width, height);
        popStyle();
    }


    void fadeDisplay(){
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
        fill(colorFadeDrawing, fadeValue);
        rect(xPos, yPos, width, height);
        popStyle();
    }

}