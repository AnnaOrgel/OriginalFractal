public void setup() {
  size(1000, 1000);
  background(0);
  stroke(0, 255, 255);
  noFill();
  fractal(500, 500, 120);
}
public void fractal(int x, int y, int siz){
  spiral(x, y, siz/2);
  if(siz>=1){
    fractal(x-siz*2, y-siz*2, siz/2);
    fractal(x-siz*2, y+siz*2, siz/2);
    
  }
}
public int fibonacci(int n) {
  if (n==0) {
    return 0;
  }
  if (n==1) {
    return 1;
  } else {
    return fibonacci(n-2)+fibonacci(n-1);
  }
}
public void makeArcs(int centerX, int centerY, int radius, float startingAngle) {
  arc(centerX, centerY, radius, radius, startingAngle, startingAngle+PI/2);
}
public void spiral(int myX, int myY, int size){

  for (int i=1; i<=6; i++) {
    if (i>2) {
      if (Math.sin(PI/2+i*PI/2)>=0) { //if above x-axis
        if (i%2==0) {
          makeArcs(myX, myY-fibonacci(i-2)*size/2, size*fibonacci(i), PI/2+i*PI/2);
          myY-=fibonacci(i-2)*size/2;
        } else if (i%2==1) {
          makeArcs(myX-fibonacci(i-1)*size/2, myY, size*fibonacci(i), PI/2+i*PI/2);
          myX-=fibonacci(i-1)*size/2;
        }
      }else{
        if (i%2==0) {
          makeArcs(myX, myY+fibonacci(i-2)*size/2, size*fibonacci(i), PI/2+i*PI/2);
          myY+=fibonacci(i-2)*size/2;
        } else if (i%2==1) {
          makeArcs(myX+fibonacci(i-2)*size/2, myY, size*fibonacci(i), PI/2+i*PI/2);
          myX+=fibonacci(i-2)*size/2;
        }
      } 
    } else {
      makeArcs(myX, myY, size*fibonacci(i), PI/2+i*PI/2);
    }
  }
}
