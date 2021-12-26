package com.bjpowernode.service;

import com.bjpowernode.domain.Student;

public interface StudentService {
    int addStudent(Student student);

    Student findStudentById(Integer id);
}
