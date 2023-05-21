package com.admin.bean;

public class Person {
    private String userName;
    private String personName;
    private String personId;
    private int score;

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setPersonName(String personName) {
        this.personName = personName;
    }

    public void setPersonId(String personId) {
        this.personId = personId;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getUserName() {
        return userName;
    }

    public String getPersonName() {
        return personName;
    }

    public int getScore() {
        return score;
    }

    public String getPersonId() {
        return personId;
    }
}
