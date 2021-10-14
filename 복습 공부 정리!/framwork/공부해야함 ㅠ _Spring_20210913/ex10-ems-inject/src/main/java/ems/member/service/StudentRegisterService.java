package ems.member.service;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import ems.member.Student;
import ems.member.dao.StudentDao;

public class StudentRegisterService {
	
	@Inject
	@Named(value="studentDao1")
	private StudentDao studentDao;
	
	public StudentRegisterService() {}
	
	public StudentRegisterService(StudentDao studentDao) {
		this.studentDao = studentDao;
	}
	
	public void register(Student student) {
		String sNum = student.getsNum();
		if(verify(student.getsNum())) {
			studentDao.insert(student);
		} else {
			System.out.println("The student has already registered.");
		}
	}
	public boolean verify(String sNum){
		Student student = studentDao.select(sNum);
		return student == null ? true : false;
	}
}
