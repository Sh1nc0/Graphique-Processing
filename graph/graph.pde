PFont font12;
PFont font18;
PFont font32;

int[] value = new int[101];
boolean messure = false;
int u = 0;
void setup(){
  size(900,500);
  font12 = loadFont("Verdana-12.vlw");
  font18 = loadFont("Verdana-18.vlw");
  font32 = loadFont("Verdana-32.vlw");

}
void draw(){
  background(#576574);
  graph(100,100,700,300,2,#1dd1a1,#54a0ff);
  
  if(messure == false){
    for(int i = 0; i <=100;i++){
      float r = random(100);
      value[i] = int(r);
    }

    messure = true;
  }
}
void graph(int x, int y, int w, int h,int p,color c,color s){
  
  int ratioX = w/100;
  int ratioY = h/100;

  
  fill(c);
  stroke(s);
  strokeWeight(p);
  rect(x,y,w,h);
  
  
  for(byte z = 0; z <= 100; z++){
    if(z%10 == 0){
      strokeWeight(2);
      stroke(s);
      line(x+ratioX*z,y+h-p,x+ratioX*z,y+p);
      
      fill(255);
      textFont(font12);
      textAlign(LEFT, CENTER);
      text(z,x+ratioX*z-ratioX,y+h+ratioX*2);
      

    }
    else{
      strokeWeight(1);
      stroke(s);
      line(x+ratioX*z,y+h-p,x+ratioX*z,y+p);
    }
  }
  for(byte u = 0; u <= 100; u++){
    if(u%10 == 0){
      strokeWeight(2);
      stroke(s);
      line(x+p,y+ratioY*u,x+w-p,y+ratioY*u);

      fill(255);
      textFont(font18);
      textAlign(CENTER, BOTTOM);
      text(u,x-ratioX*4, y+h-ratioY*u + ratioX);
    }
  }
  courbe(x,y,w,h,ratioX, ratioY);
  curssor(x,y,w,h,ratioY);
}
void courbe(int x, int y, int w, int h,int rX, int rY){
  for(byte i = 0; i < 100; i++){
    strokeWeight(2);
    stroke(0);
    line(x+rX*i,y+h-value[i]*rY, x+rX*(i+1), y+h-value[i+1]*rY);
  }
}
void curssor(int x, int y ,int w,int h, int rY){
  if(mouseX > x && mouseX <x+w){
    if(mouseY > y && mouseY < y+h){
      if(mousePressed){
        u = mouseX;
        int v = ((u-x)*100)/w;
        
        stroke(200,150,56);
        line(u,y+h-2,u,y+2);
        fill(255,0,0);
        stroke(255,0,0);
        ellipse(u,y+h-value[v]*rY,5,5);
        
        fill(255);
        textFont(font32);
        text(value[v], u+3,y+h-value[v]*rY);
        
      }
    }
  }
  
}
