package toy;

//2번
//배터리 분리형 로봇 장난감
//장난감을 사면 기본으로 배터리를 제공하지 않음
import battery.*;

public class RobotToy {

    private Battery battery;

    public RobotToy () {}

    //네가 사서 알아서 장난감 구동시켜라!
    //의존 주입을 setter 를 통해서 함
    public void setBattery(Battery battery){
        this.battery = battery;
    }
}
