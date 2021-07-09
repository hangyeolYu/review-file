package shape_line;

public class StraightLine extends Line  {
    public StraightLine(int x,int y) {
        super(x,y);
    }

    @Override
    public String toString() {
        return "StraightLine{" +
                "x=" + x +
                ", y=" + y +
                '}';
    }
}
