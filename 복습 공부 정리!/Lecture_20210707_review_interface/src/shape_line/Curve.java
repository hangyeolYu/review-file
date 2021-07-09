package shape_line;

public class Curve extends Line {
    int curveDeg;

    public Curve(int x, int y, int curveDeg) {
        super(x, y);
        this.curveDeg = curveDeg;
    }

    public int getCurveDeg() {
        return curveDeg;
    }

    public void setCurveDeg(int curveDeg) {
        this.curveDeg = curveDeg;
    }

    @Override
    public String toString() {
        return "Curve{" +
                "curveDeg=" + curveDeg +
                ", x=" + x +
                ", y=" + y +
                '}';
    }
}
