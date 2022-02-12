package LibraryManagementSystem_admin;

public class Admin_Info {
    private int admin_id;
    private String admin_pwd;

    public Admin_Info(){
        admin_id=-1;
        admin_pwd="";
    }

    public int getAdmin_id() {
        return admin_id;
    }
    public String getAdmin_pwd(){return admin_pwd;}

    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
    }
    public void setAdmin_pwd(String admin_pwd){this.admin_pwd=admin_pwd;}
}
