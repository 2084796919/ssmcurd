package com.luguz.service;

import com.luguz.bean.Dept;
import com.luguz.dao.DeptMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Guz
 * @create 2021-08--23 21:13
 */
@Service
public class DeptService {
    @Autowired
    private DeptMapper deptMapper;
    public List<Dept> getDepts(){
        return deptMapper.selectByExample(null);
    }

}
