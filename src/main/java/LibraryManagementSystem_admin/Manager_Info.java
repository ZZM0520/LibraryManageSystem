package LibraryManagementSystem_admin;

public class Manager_Info {
    private int serial;//编号，自增
    private String id;//账号
    private String password;

    public Manager_Info(){}

    public int getSerial() { return serial; }
    public String getId(){return id;}
    public String getPassword(){return password;}

    public void setPassword(String thePassword){password=thePassword;}
    public void setId(String theId){id=theId;}
}
