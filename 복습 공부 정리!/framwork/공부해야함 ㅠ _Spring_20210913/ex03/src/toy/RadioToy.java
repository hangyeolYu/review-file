package toy;

import battery.Battery;

// 3��
// ���͸� �и��� ���� �峭��
// �峭���� ��� ���͸��� �⺻���� �־���
// => ���� ���� ���!
public class RadioToy {
	private Battery battery;
	
	// ���� ������ �����ڸ� ���� ��
	public RadioToy(Battery battery) {
		this.battery = battery;
	}
	
	// ���� ������ setter�� ���� ��
	public void setBattery(Battery battery) {
		this.battery = battery;
	}
}
