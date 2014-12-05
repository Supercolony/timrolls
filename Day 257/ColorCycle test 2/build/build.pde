PImage img;

int arrayMax = 200; //array size
color[] arrayColor;
int[]   arrayInt;

int assetCounter = 0;
int assetMax = 100; //max particles
ArrayList<Particle> stuff; //array list of particles

int artnum   = 7;
PImage[] art = new PImage[artnum];

PVector startVector = new PVector (0,0,0);

void setup() {
	size(1000, 1000, P3D);
	background(#111111);
	smooth();

	img = loadImage("color.png");

	arrayColor = new color[ arrayMax ]; // aray of colors
	arrayInt   = new color[ arrayMax ]; // array of corresponding positions

	for (int i = 0; i < arrayMax; i++) {
		float tempPos = (img.width / arrayMax) * i;
		arrayColor[i] = img.get(Math.round(tempPos), 0); //get color based on tempPos
		arrayInt[i] = i; //fill int array with sequential values
	}

	stuff = new ArrayList<Particle>();

	for (int j = 0; j < assetMax; j++) {
		stuff.add(new Particle((int)random(art.length),startVector, assetCounter));
		assetCounter++;
		if(assetCounter == arrayMax) assetCounter = 0;
	}

        for (int i = 0; i < artnum; ++i) { // fill array with pngs
          String temp = (String)"0"+(i+1)+".png";
          art[i] = loadImage(temp);
        }
}

void draw() {
	background(#111111);

	for (int i = 0; i < arrayMax; ++i) {
		int tempNum = arrayInt[i];
		tempNum++;
		if(tempNum == arrayMax) tempNum = 0;
		arrayInt[i] = tempNum;
	}

	for (Particle p : stuff) p.display();

	image(img, 0, 0);
}
