package LibraryManagementSystem_admin;

public class Lost_record {
    private int lost_id;
    private int serial;
    private int borrow_record_id;
    private double price;
    private boolean if_compensate;//0:未赔偿 1:已赔偿
    private int compensation_way;//0:书 1:现金

    public int getLost_id(){return lost_id;}
    public int getSerial(){return serial;}
    public int getBorrow_record_id(){return borrow_record_id;}
    public double getPrice(){return price;}
    public boolean getIf_compensate(){return if_compensate;}
    public int getCompensation_way(){return compensation_way;}

    public void setLost_id(int theLost_record_id) { this.lost_id = theLost_record_id; }
    public void setSerial(int theSerial){this.serial=theSerial;}
    public void setBorrow_record_id(int theBorrow_record_id){this.borrow_record_id=theBorrow_record_id;}
    public void setPrice(double thePrice){price=thePrice;}
    public void setIf_compensate(boolean theIf_compensate){if_compensate=theIf_compensate;}
    public void setCompensation_way(int theCompensation_way){compensation_way=theCompensation_way;}
}
