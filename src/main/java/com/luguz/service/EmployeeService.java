package com.luguz.service;

import com.luguz.bean.Employee;
import com.luguz.bean.EmployeeExample;
import com.luguz.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Guz
 * @create 2021-08--22 18:12
 */
@Service
public class EmployeeService {
    @Autowired
    EmployeeMapper employeeMapper;

    public List<Employee> getAll() {
        return employeeMapper.selectByExampleWithDept(null);
    }

    public void saveEmp(Employee employee){
        employeeMapper.insertSelective(employee);
    }
    public boolean checkUserName(String userName){
        EmployeeExample employee = new EmployeeExample();
        EmployeeExample.Criteria criteria = employee.createCriteria();
        criteria.andEmpNameEqualTo(userName);
        long count = employeeMapper.countByExample(employee);
        return (count == 0);
    }
    public Employee getEmp(Integer id){
        Employee employee = employeeMapper.selectByPrimaryKey(id);
        return employee;
    }

    public void updateEmp(Employee employee) {
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    public void deleEmp(Integer id) {
        employeeMapper.deleteByPrimaryKey(id);
    }

    public void deleIds(List<Integer> ids) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpIdIn(ids);
//        delete from xxx where emp_id in ( ids )
        employeeMapper.deleteByExample(example);
    }
}
