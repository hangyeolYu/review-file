package shape_line;

public class Circle extends Shape {
   private int r;

    public Circle(){
        super();
    }

    public Circle(int x, int y,int r) {
        super(x, y);
        this.r = r;

    }

    public double getR() {
        return r;
    }

    public void setR(int r) {
        this.r = r;
    }

    @Override
    public double getArea() {
        return r*r*3.14;
    }



    @Override
    public String toString() {
        return "Circle{" +
                "r=" + r +
                ", x=" + x +
                ", y=" + y +
                '}';
    }
}
