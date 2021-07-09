package shape_line;

public class Rectangle extends Shape{
    int w;
    int h;



    public Rectangle(int x, int y, int w, int h) {
        super(x, y);
        this.w = w;
        this.h = h;
    }

    @Override
    public double getArea() {
        return w*h;
    }

    @Override
    public String toString() {
        return "Rectangle{" +
                "w=" + w +
                ", h=" + h +
                ", x=" + x +
                ", y=" + y +
                '}';
    }



    public int getW() {
        return w;
    }

    public void setW(int w) {
        this.w = w;
    }

    public int getH() {
        return h;
    }

    public void setH(int h) {
        this.h = h;
    }
}
