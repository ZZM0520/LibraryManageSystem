package LibraryManagementSystem_admin;
import java.util.*;

public class Borrow_record{
    private int borrow_id;
    private int user_id;
    private int book_id;
    private int serial;
    private Date borrowOutTime;
    private Date predictReturnTime;
    boolean if_Return;//1：归还 0：未归还
    private Date actualReturnTime;
    double price;

    public int getBorrow_id(){return borrow_id;}
    public int getBook_id(){return book_id;}
    public int getUser_id(){return user_id;}
    public int getSerial(){return serial;}
    public Date getBorrowOutTime(){return borrowOutTime;}
    public Date getPredictReturnTime(){return predictReturnTime;}
    public Date getActualReturnTime(){return actualReturnTime;}
    public boolean isIf_Return(){return if_Return;}
    public double getPrice(){return price;}

    public void setBook_id(int theBook_id){book_id=theBook_id;}
    public void setSerial(int theSerial){serial=theSerial;}
    public void setIf_Return(boolean theIf_return){if_Return=theIf_return;}
    public void setPrice(double thePrice){price=thePrice;}
    public void setUser_id(int theUser_id){user_id=theUser_id;}
    public void setBorrow_id(int theRecord_id){borrow_id=theRecord_id;}
    public void setBorrowOutTime(Date theBorrowOutTime){borrowOutTime=theBorrowOutTime;}
    public void setPredictReturnTime(Date thePredictReturnTime){predictReturnTime=thePredictReturnTime;}
    public void setActualReturnTime(Date theActualReturnTime){actualReturnTime=theActualReturnTime;}



}
