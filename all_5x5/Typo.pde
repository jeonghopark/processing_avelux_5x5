//----------------------------------------------------------------------------
class Typo {

    Typo(){   
    }

void alphaDisplay(char k, color c){
    pushMatrix();
    pushStyle();

    fill(c);

    switch(k) {
        case 'a':
        case 'A':
        rectDraw( "11, 12, 13, 14, 21, 24, 31, 32, 33, 34, 41, 44, 51, 54" );
        break;

        case 'b':
        case 'B':
        rectDraw("11, 12, 13, 21, 24, 31, 32, 33, 34, 41, 44, 51, 52, 53, 54");
        break;
        
        case 'c':
        case 'C':
        rectDraw("11, 12, 13, 21, 31, 41, 51, 52, 53");
        break;

        case 'd':
        case 'D':
        rectDraw("11, 12, 13, 21, 24, 31, 34, 41, 44, 51, 52, 53");
        break;

        case 'e':
        case 'E':
        rectDraw("11, 12, 13, 21, 31, 32, 41, 51, 52, 53");
        break;

        case 'f':
        case 'F':
        rectDraw("11, 12, 13, 21, 31, 32, 41, 51");
        break;

        case 'g':
        case 'G':
        rectDraw("11, 12, 13, 14, 21, 31, 33, 34, 41, 44, 51, 52, 53, 54");
        break;

        case 'h':
        case 'H':
        rectDraw("11, 14, 21, 24, 31, 32, 33, 34, 41, 44, 51, 54");
        break;

        case 'i':
        case 'I':
        rectDraw("11, 21, 31, 41, 51");
        break;

        case 'j':
        case 'J':
        rectDraw("12, 13, 23, 33, 41, 43, 51, 52, 53");
        break;

        case 'k':
        case 'K':
        rectDraw("11, 14, 21, 23, 31, 32, 41, 43, 51, 54");
        break;

        case 'l':
        case 'L':
        rectDraw("11, 21, 31, 41, 51, 52, 53");
        break;

        case 'm':
        case 'M':
        rectDraw("11, 12, 13, 14, 15, 16, 21, 23, 25, 31, 33, 35, 41, 45, 51, 55");
        break;

        case 'n':
        case 'N':
        rectDraw("11, 14, 21, 22, 24, 31, 33, 34, 41, 44, 51, 54");
        break;

        case 'o':
        case 'O':
        rectDraw("11, 12, 13, 14, 21, 24, 31, 34, 41, 44, 51, 52, 53, 54");
        break;

        case 'p':
        case 'P':
        rectDraw("11, 12, 13, 14, 21, 24, 31, 32, 33, 34, 41, 51");
        break;

        case 'q':
        case 'Q':
        rectDraw("11, 12, 13, 14, 21, 24, 31, 34, 41, 43, 44, 51, 52, 53, 54");
        break;

        case 'r':
        case 'R':
        rectDraw("11, 12, 13, 14, 21, 24, 31, 32, 33, 34, 41, 43, 51, 54");
        break;

        case 's':
        case 'S':
        rectDraw("11, 12, 13, 21, 31, 32, 33, 43, 51, 52, 53");
        break;

        case 't':
        case 'T':
        rectDraw("11, 12, 13, 22, 32, 42, 52");
        break;

        case 'u':
        case 'U':
        rectDraw("11, 14, 21, 24, 31, 34, 41, 44, 51, 52, 53, 54");
        break;

        case 'v':
        case 'V':
        rectDraw("11, 15, 21, 25, 32, 34, 42, 44, 53");
        break;

        case 'w':
        case 'W':
        rectDraw("11, 15, 21, 25, 31, 33, 35, 41, 43, 45, 51, 52, 53, 54, 55");
        break;

        case 'x':
        case 'X':
        rectDraw("11, 13, 21, 23, 32, 41, 43, 51, 53");
        break;

        case 'y':
        case 'Y':
        rectDraw("11, 13, 21, 23, 32, 42, 52");
        break;

        case 'z':
        case 'Z':
        rectDraw("11, 12, 13, 23, 32, 41, 51, 52, 53");
        break;

        case ' ':
        rectDraw("");
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

}