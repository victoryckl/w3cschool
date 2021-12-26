package com.bjpowernode.service.impl;

import com.bjpowernode.dao.StudentDao;
import com.bjpowernode.domain.Student;
import com.bjpowernode.service.StudentService;

public class StudentServiceImpl implements StudentService {
    private StudentDao dao;

    public void setDao(StudentDao dao) {
        this.dao = dao;
    }

    @Override
    public int addStudent(Student student) {
        //检查是否已经添加，例如名字唯一或者身份证唯一等逻辑处理

        int rows = dao.insertStudent(student);

        return rows;
    }

    @Override
    public Student findStudentById(Integer id) {
        return dao.selectById(id);
    }
}
