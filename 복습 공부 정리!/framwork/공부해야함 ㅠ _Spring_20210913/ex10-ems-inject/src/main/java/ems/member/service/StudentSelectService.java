package ems.member.service;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import ems.member.Student;
import ems.member.dao.StudentDao;

public class StudentSelectService {
	
	@Inject
	@Named(value="studentDao1")
	private StudentDao studentDao;
	
	public StudentSelectService() {}
	
	public StudentSelectService(StudentDao studentDao) {
		this.studentDao = studentDao;
	}
	
	
	public Student select(String sNum) {
		if(verify(sNum)) {
			return studentDao.select(sNum);
		} else {
			System.out.println("Student information is not available.");
		}
		
		return null;
	}

	public boolean verify(String sNum){
		Student student = studentDao.select(sNum);
		return student != null ? true : false;
	}
}
