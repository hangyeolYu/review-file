package shape_line;

public class LineSeg extends Line {
    int ex;
    int ey;

    public LineSeg(int x, int y, int ex, int ey) {
        super(x, y);
        this.ex = ex;
        this.ey = ey;
    }

    public int getEx() {
        return ex;
    }

    public void setEx(int ex) {
        this.ex = ex;
    }

    public int getEy() {
        return ey;
    }

    public void setEy(int ey) {
        this.ey = ey;
    }

    @Override
    public String toString() {
        return "LineSeg{" +
                "x=" + x +
                ", y=" + y +
                ", ex=" + ex +
                ", ey=" + ey +
                '}';
    }
}
