package com.admin.bean;

import java.util.Map;

public class temp{
    public int all_order;
    public int all_user;
    public int all_person;
    public int all_flight;
    public int new_order;
    public Map<String, Integer> map=null;
    public temp(int all_order,int all_user,int all_person , int all_flight){
        this.all_order=all_order;
        this.all_user=all_user;
        this.all_person=all_person;
        this.all_flight=all_flight;
    }
}
