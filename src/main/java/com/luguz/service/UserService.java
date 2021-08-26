package com.luguz.service;

import com.luguz.bean.Employee;
import com.luguz.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author Guz
 * @create 2021-08--22 17:43
 */
public class UserService {
    @Autowired
    private SqlSession sqlSession;
    public void addUser(Employee employee){
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        mapper.updateByPrimaryKey(employee);
    }

}
