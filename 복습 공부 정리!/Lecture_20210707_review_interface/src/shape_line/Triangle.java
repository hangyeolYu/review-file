package shape_line;

public class Triangle extends Shape {
    int b;
    int h;



    public Triangle(int x, int y, int b, int h) {
        super(x, y);
        this.b = b;
        this.h = h;
    }

    public int getB() {
        return b;
    }

    public void setB(int b) {
        this.b = b;
    }

    public int getH() {
        return h;
    }

    public void setH(int h) {
        this.h = h;
    }

    @Override
    public double getArea() {
        return b*h/2;
    }



    @Override
    public String toString() {
        return "Triangle{" +
                "x=" + x +
                ", y=" + y +
                ", b=" + b +
                ", h=" + h +
                '}';
    }
}
