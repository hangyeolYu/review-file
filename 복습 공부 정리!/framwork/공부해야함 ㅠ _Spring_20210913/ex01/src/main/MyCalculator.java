package main;

import operator.Calculator;

// IoC �����̳� ����
public class MyCalculator {
	public int left, right; 
	// ��ü
	public Calculator calculator; 
	// ��ü �����ϴ� �۾� (+, -, *, /)
	
	public MyCalculator(int l, int r, Calculator c) {
		// Calculator c = new CalAdd();
		// Calculator c = new CalSub();
		// Calculator c = new CalMul();
		// Calculator c = new CalDiv();....
		this.left = l;
		this.right = r;
		this.calculator = c;
	
	}
	
	public void result() {
		int value = calculator.operator(left, right);
		// � ��ü (CalAdd, CalSub, CalMul, CalDiv)��
		// ���������� ���� �Ҹ��� �Լ��� �ٸ�
		// => ������ (���� ���ε�, dynamic binding)
		System.out.println("result : " + value);
	}

	public int getLeft() {
		return left;
	}

	public void setLeft(int left) {
		this.left = left;
	}

	public int getRight() {
		return right;
	}

	public void setRight(int right) {
		this.right = right;
	}

	public Calculator getCalculator() {
		return calculator;
	}

	public void setCalculator(Calculator calculator) {
		this.calculator = calculator;
	}
	
	
}
