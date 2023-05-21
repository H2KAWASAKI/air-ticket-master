package com.admin.bean;

public class Order {
    private String orderId;
    private String orderName;
    private String orderUser;
    private String flightNumber;
    private String personName;
    private String orderDate;
    private String Grade;
    private String personId;
    private Double orderMoney1;
    private Double orderMoney2;
    private String contactName;
    private String contactPhone;

    public String getFlightNumber() {
        return flightNumber;
    }

    public Double getOederMoney2() {
        return orderMoney2;
    }

    public Double getOrderMoney1() {
        return orderMoney1;
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public String getContcatName() {
        return contactName;
    }

    public String getGrade() {
        return Grade;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public String getOrderId() {
        return orderId;
    }

    public String getOrderName() {
        return orderName;
    }

    public String getOrderUser() {
        return orderUser;
    }

    public String getPersonId() {
        return personId;
    }

    public String getPersonName() {
        return personName;
    }

    public void setFlightNumber(String flightNumber) {
        this.flightNumber = flightNumber;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }

    public void setContcatName(String contactName) {
        this.contactName = contactName;
    }

    public void setGrade(String grade) {
        Grade = grade;
    }

    public void setOederMoney2(Double orderMoney2) {
        this.orderMoney2 = orderMoney2;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public void setOrderMoney1(Double orderMoney1) {
        this.orderMoney1 = orderMoney1;
    }

    public void setOrderName(String orderName) {
        this.orderName = orderName;
    }

    public void setOrderUser(String orderUser) {
        this.orderUser = orderUser;
    }

    public void setPersonId(String personId) {
        this.personId = personId;
    }

    public void setPersonName(String personName) {
        this.personName = personName;
    }

}
