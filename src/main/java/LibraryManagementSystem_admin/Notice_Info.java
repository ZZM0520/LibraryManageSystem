package LibraryManagementSystem_admin;

import java.util.Date;

public class Notice_Info {
    private int notice_id;
    private String notice_title;
    private String notice_author;
    private Date notice_release_time;
    private String notice_content;

    public int getNotice_id(){return notice_id;}
    public String getNotice_title(){return notice_title;}
    public String getNotice_author(){return notice_author;}
    public Date getNotice_release_time(){return notice_release_time;}
    public String getNotice_content(){return notice_content;}

    public void setNotice_id(int theNotice_id){notice_id=theNotice_id;}
    public void setNotice_title(String theNotice_title){notice_title=theNotice_title;}
    public void setNotice_author(String theNotice_author){notice_author=theNotice_author;}
    public void setNotice_release_time(Date theNotice_release_time){notice_release_time=theNotice_release_time;}
    public void setNotice_content(String theNotice_content){notice_content=theNotice_content;}

    public void pp(){
        System.out.println(notice_title+"---"+notice_release_time);
    }
}
