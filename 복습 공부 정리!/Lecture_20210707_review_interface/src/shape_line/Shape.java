package shape_line;

public abstract class Shape implements Graphic{//추상 클래스로 정의 되었으므로 객체 생성이 안됩니다!

    //super 클래스의 객체 생성을 원하는 상황에서 만약 추상 메서드를 사용해야되는 상황이라면 인터페이스를 사용하는게 현명함!
    int x;
    int y;
    Shape () {}
    Shape(int x, int y) {
        this.x = x;
        this.y = y;
    }
    public int getX() {
        return x;
    }


    public void setX(int x) {
        this.x = x;
    }

    public int getY() {
        return y;
    }


    public abstract double getArea();

    public void setY(int y) {
        this.y = y;
    }
    @Override
    public String toString() {
        return "Shape{" +
                "x=" + x +
                ", y=" + y +
                '}';
    }
}
