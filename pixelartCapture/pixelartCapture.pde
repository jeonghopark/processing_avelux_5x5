import processing.video.*;

PWindow subWindow;
Capture cam;

color[] pixelColors;

ArrayList<AniFrame> aniFrames;

//----------------------------------------------------------------------------
public void settings() {
    size(640, 480);

}


//----------------------------------------------------------------------------
void setup(){

    subWindow = new PWindow();
    cam = new Capture(this, 640, 480);
    cam.start();

    pixelColors = new color[25];
    aniFrames = new ArrayList<AniFrame>();

}


//----------------------------------------------------------------------------
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


//----------------------------------------------------------------------------
void keyPressed(){
    
    if (key == 'c') {
        
        color[] _cBuff = new color[25];
        for (int i=0; i<_cBuff.length; i++) {
            _cBuff[i] = color(0, 0, 0);
        }
        for (int i=0; i<pixelColors.length; i++) {
            _cBuff[i] = pixelColors[i];
            // println(i, red(_cBuff[i]), green(_cBuff[i]), blue(_cBuff[i]));
        }
        AniFrame _oneFrame = new AniFrame(_cBuff);

        aniFrames.add(_oneFrame);
    } else if (key == 's') {
        selectOutput("Select a file to write to:", "fileSelected");
    }

}



//----------------------------------------------------------------------------
void fileSelected(File selection) {
    if (selection == null) {
        // println("Window was closed or the user hit cancel.");
    } else {
        Table _table = new Table();
        _table.addColumn("frame");
        _table.addColumn("r");
        _table.addColumn("g");
        _table.addColumn("b");

        for (int i=0; i<aniFrames.size(); i++) {
            for (int j=0; j<aniFrames.get(i).pixelColor.length; j++) {
                TableRow _newRow = _table.addRow();
                _newRow.setInt("frame", i);
                _newRow.setInt("r", int(red(aniFrames.get(i).pixelColor[j])));
                _newRow.setInt("g", int(green(aniFrames.get(i).pixelColor[j])));
                _newRow.setInt("b", int(blue(aniFrames.get(i).pixelColor[j])));
            }
        }
    
        saveTable(_table, selection.getAbsolutePath());
        // saveTable(_table, selection.getName());
    }
}



//----------------------------------------------------------------------------
void captureEvent(Capture c){
    c.read();
}




//--------------------------------------------------------
class AniFrame {

    color[] pixelColor = new color[25];

    AniFrame(color[] _c){
        for (int i=0; i<pixelColor.length; i++) {
            pixelColor[i] = _c[i];
        }
    }

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