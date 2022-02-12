package LibraryManagementSystem_admin;


public class Library_date {
    private int year;
    private int month;
    private int day;

    public int getYear(){return year;}
    public int getMonth(){return month;}
    public int getDay(){return day;}

    public void setYear(int theYear){year=theYear;}
    public void setMonth(int theMonth){month= theMonth;}
    public void setDay(int theDay){day=theDay;}

    public Library_date(int theYear,int theMonth, int theDay){
        year=theYear;
        month=theMonth;
        day=theDay;
    }
}
