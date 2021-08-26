package com.luguz.bean;

import com.github.pagehelper.PageInfo;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Guz
 * @create 2021-08--23 10:26
 */
public class Msg {
    private String code;
    private String msg;
    private Map<String, Object> extend = new HashMap<String, Object>();

    public Msg() {
    }

    public Msg(String code, String msg, Map<String, Object> extend) {
        this.code = code;
        this.msg = msg;
        this.extend = extend;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }


    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
//    常用
    public Msg(String code, String msg) {
        this.code = code;
        this.msg = msg;

    }
        public static Msg success(){
        Msg result = new Msg("100","处理成功");
        return result;
    }
    public static Msg error(){
        Msg result = new Msg("200","处理失败");
        return result;
    }
    public Msg add(String key,Object value){
        this.getExtend().put(key, value);
        return this;
    }
}
