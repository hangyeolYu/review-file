package main;

import org.springframework.context.support.GenericXmlApplicationContext;

public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// ��ü�� �츮�� ���� ���!
		// DI ���� X
		// HelloSpring h = new HelloSpring();
		// h.print();
		
		// ������ �����̳� ����
		GenericXmlApplicationContext ctx = 
				new GenericXmlApplicationContext("applicationContext.xml");
		
		// ������ �����̳ʿ� ������� ��ü�� ������ ��
		// ��ü ��Ȱ�� �ϱ� ����
		// �ܺ� ��ü ���� (DI)
		HelloSpring h 
		= ctx.getBean("spring", HelloSpring.class);
		
		h.print();
		
		ctx.close();
		
	}

}
