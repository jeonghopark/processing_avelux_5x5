import controlP5.*;

ControlP5 cp5;

int pixelSize = 45;
int captureXPos = 0;
int captureYPos = 0;


color[] pixelColors;

ArrayList<AniFrame> aniFrames;

Table table;

int frameCountNum = 0;

//----------------------------------------------------------------------------
void setup() {

    size(500, 500);

    table = loadTable("test.csv", "header");

    pixelColors = new color[25];
    aniFrames = new ArrayList<AniFrame>();

    int _index = 0;
    int frameNum = table.getRowCount() / 25;

    for (int i = 0; i < frameNum; i++) {
        color _c = color(0, 0, 0);
        
        AniFrame _frame = new AniFrame();
        for (int j = i * 25; j < 25 + i * 25; j++) {
            int fr = table.getInt(j, 0);
            int r = table.getInt(j, 1);
            int g = table.getInt(j, 2);
            int b = table.getInt(j, 3);
            _frame.pixelColor[j % 25] = color(r, g, b);
        }
        aniFrames.add(_frame);

    }

    println(aniFrames.size());

}


//----------------------------------------------------------------------------
void draw() {


    if (frameCount % 10 == 0) {
        frameCountNum++;
    }

    pushStyle();

    int rectSize = 100;
    int _aniframe = frameCountNum % aniFrames.size();
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            int index = i + j * 5;
            fill(aniFrames.get(_aniframe).pixelColor[index]);
            rect(i * rectSize, j * rectSize, rectSize, rectSize);
        }
    }

    popStyle();

}


//----------------------------------------------------------------------------
void keyPressed() {


}



//--------------------------------------------------------
class AniFrame {

    color[] pixelColor = new color[25];

    AniFrame() {
        // for (int i = 0; i < pixelColor.length; i++) {
        //     pixelColor[i] = _c;
        // }
    }

}

