package LibraryManagementSystem_admin;

public class Single_book {
    private int serial;
    private int book_id;
    boolean if_borrow=false;//true是借出 false是未借出
    boolean if_lost=false;//true是丢失 false是未丢失\

    public Single_book(){}

    public Single_book(int theSerial,int theBook_id,boolean theIf_borrow,boolean theIf_lost){
        serial=theSerial;
        book_id=theBook_id;
        if_borrow=theIf_borrow;
        if_lost=theIf_lost;
    }

    public int getSerial(){return serial;}
    public int getBook_id(){return book_id;}
    public boolean getIf_borrow(){return if_borrow;}
    public boolean getIf_lost(){return if_lost;}

    public void setSerial(int theSerial){this.serial=theSerial;}
    public void setBook_id(int theBookId){this.book_id=theBookId;}
    public void setIf_borrow(boolean theState){this.if_borrow=theState;}
    public void setIf_lost(boolean theState){this.if_lost=theState;}

    public void print(){
        System.out.println(book_id+"..."+serial+"\n");
    }
}
