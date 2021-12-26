package com.bjpowernode.dao;

import com.bjpowernode.domain.Student;
import org.apache.ibatis.annotations.Param;

public interface StudentDao {
    int insertStudent(Student student);

    Student selectById(@Param("studentId") Integer id);
}
