package toy;

import battery.Battery;
import battery.NormalBattery;

// 1��
// ���͸� ��ü�� �ڵ���
// ���͸��� �������� �峭���� ���� �����ؾ� �� (��ȿ���� ..�Ф�)
public class CarToy {
	private Battery battery;
	
	// CarToy ��ü �ȿ��� Battery ��ü ����
	// ���ο��� �˾Ƽ� �����ؼ� ����!
	// DI ����� �ƴ�!
	public CarToy() {
		battery = new NormalBattery();
	}
}
