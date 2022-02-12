package LibraryManagementSystem_admin;

import java.sql.Date;

public class User_Info {
    public User_Info(){};
    private int user_id;
    private String phone_number;
    private String name; //姓名
    private Date birthday;
    private String identity;
    private String email;
    private String qq;
    private int credit;
    private Date register_time;

    public Date getBirthday() {
        return birthday;
    }
    public Date getRegister_time() {
        return register_time;
    }
    public int getCredit() {
        return credit;
    }
    public int getUser_id() {
        return user_id;
    }
    public String getEmail() {
        return email;
    }
    public String getIdentity() {
        return identity;
    }
    public String getName() {
        return name;
    }
    public String getPhone_number() {
        return phone_number;
    }
    public String getQq() {
        return qq;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }
    public void setCredit(int credit) {
        this.credit = credit;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public void setIdentity(String identity) {
        this.identity = identity;
    }
    public void setName(String name) {
        this.name = name;
    }
    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }
    public void setQq(String qq) {
        this.qq = qq;
    }
    public void setRegister_time(Date register_time) {
        this.register_time = register_time;
    }
}
