package com.luguz;

import com.luguz.bean.Employee;
import com.luguz.dao.DeptMapper;
import com.luguz.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

@MapperScan("com.luguz.bean")
/**
 * @author Guz
 * @create 2021-08--21 10:08
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
        "classpath:application.xml"
})
public class test1{


    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    DeptMapper deptMapper;
    @Autowired
    private SqlSession sqlSession;

//    dao测试
    @Test
    public void testDao(){
        System.out.println(sqlSession.getClass().toString());

        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        long start = System.currentTimeMillis();
        for (int i=4; i< 1005; i++){
            String name = UUID.randomUUID().toString().substring(0, 5) + i;
            mapper.insertSelective(new Employee(null,name,"W",name+"@qq.com",1));
        }
        long end = System.currentTimeMillis();
        System.out.println("插入成功:" +(start - end));
//        -39850
    }


}
