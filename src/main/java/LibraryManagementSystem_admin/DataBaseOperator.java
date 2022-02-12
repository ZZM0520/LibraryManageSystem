package LibraryManagementSystem_admin;

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader;

import java.sql.*;
import java.util.*;

public class DataBaseOperator {
    Connection conn = null;
    static DataBaseOperator instance = null;

    DataBaseOperator() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            String user = "library_admin";
            String password = "123456";
            conn = DriverManager.getConnection(url, user, password);
            conn.setAutoCommit(false);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static DataBaseOperator getInstance() {
        if (instance == null) {
            instance = new DataBaseOperator();
        }
        return instance;
    }

    public void close() {
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //将sql的date转换为util的date
    public java.util.Date SQLtoUTIL(java.sql.Date date_sql) {
        return new java.util.Date(date_sql.getTime());
    }

    //将util的date转换为sql的date
    public java.sql.Date UTILtoSQL(java.util.Date date_util) {
        return new java.sql.Date(date_util.getTime());
    }

    public Admin_Info getAdminInfo(int theAdmin_id)
    {
        Admin_Info admin_info=new Admin_Info();
        try {
            int i=0;
            Statement st = conn.createStatement();
            ResultSet rs = null;
            String sql = "select admin_id from library_creator.admin_info where admin_id = " + theAdmin_id;
            rs = st.executeQuery(sql);
            while (rs.next()) {
                admin_info.setAdmin_id(rs.getInt(1));
                i++;
            }
            if(i==0)
                return null;
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return admin_info;
    }

    public ArrayList<Lost_record> getAllLost_record(){
        ArrayList<Lost_record> lost_records=new ArrayList<Lost_record>();
        try {
            int i=0;
            Statement st = conn.createStatement();
            ResultSet rs = null;
            String sql = "select lost_id, serial,borrow_id, price, if_compensate," +
                    " compensation_way from library_creator.lost_record ";
            rs = st.executeQuery(sql);
            while (rs.next()) {
                Lost_record lost_record=new Lost_record();
                lost_record.setLost_id(rs.getInt(1));
                lost_record.setSerial(rs.getInt(2));
                lost_record.setBorrow_record_id(rs.getInt(3));
                lost_record.setPrice(rs.getDouble(4));
                lost_record.setIf_compensate(rs.getBoolean(5));
                lost_record.setCompensation_way(rs.getInt(6));
                lost_records.add(lost_record);
                i++;
            }
            if(i==0)
                return null;
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return lost_records;
    }

    public ArrayList<Notice_Info> getAllNotice_Info()
    {
        ArrayList<Notice_Info> notice_infos = new ArrayList<Notice_Info>();
        try {
            int i=0;
            Statement st = conn.createStatement();
            ResultSet rs = null;
            String sql = "select notice_id,notice_title,notice_author," +
                    "notice_release_time,notice_content" +
                    " from library_creator.notice ";
            rs = st.executeQuery(sql);
            while (rs.next()) {
                Notice_Info notice_info=new Notice_Info();
                notice_info.setNotice_id(rs.getInt(1));
                notice_info.setNotice_title(rs.getString(2));
                notice_info.setNotice_author(rs.getString(3));
                //Date类转换
                notice_info.setNotice_release_time(SQLtoUTIL(rs.getDate(4)));
                //判断是否为空
                String content = rs.getString(5);
                if (content != null)
                    notice_info.setNotice_content(content);
                notice_infos.add(notice_info);
                i++;
            }
            if(i==0)
                return null;
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return notice_infos;
    }

    public boolean modifyPassword(int admin_id, String oldPassword, String newPassword){
        boolean result = false;
        String password_in_database = "";
        try{
            Statement st = conn.createStatement();
            ResultSet rs = null;
            String sql1 = "select password from library_creator.admin_password where admin_id = "+ admin_id;
            rs = st.executeQuery(sql1);
            while(rs.next()){
                password_in_database = rs.getString(1);
            }
            if(!oldPassword.equals(password_in_database)){
                result = false;
            }else{
                String sql2 = "update library_creator.admin_password set password = '" + newPassword +
                        "' where admin_id = " + admin_id;
                int result2 = st.executeUpdate(sql2);
                if(result2 > 0){
                    result = true;
                    conn.commit();
                }
            }
            rs.close();
            st.close();
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
        return result;
    }

    public int getUser_ID(String phoneNumber) {//登录时，根据输入的电话号码获取id
        int user_id = -1;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = null;
            String sql = "select user_id from library_creator.user_info where phone_number = " + phoneNumber;
            rs = st.executeQuery(sql);
            while (rs.next()) {
                user_id = rs.getInt(1);
            }
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user_id;
    }

    public boolean canLogin(int theAdmin_id,String password){
        try {
            int i=0;
            Statement st = conn.createStatement();
            ResultSet rs = null;
            String sql = "select password from library_creator.admin_password" +
                    " where admin_id = " + theAdmin_id;
            rs = st.executeQuery(sql);
            String password_in_database="";
            while (rs.next()) {
                password_in_database=rs.getString(1);
                i++;
            }
            if(i==0)
                return false;
            if(password_in_database.equals(password))
                return true;
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public ArrayList<Book_Info> searchBookInfo(Query_Terms query){
        ArrayList<Book_Info> list = new ArrayList<Book_Info>();
        Book_Info temp;
        try{
            Statement st = conn.createStatement();
            ResultSet rs = null;
            String sql = "select book_id,isbn,book_name,publisher,author,category_id," +
                    "price,total_number,available_number from library_creator.book_info " +
                    "where 1 = 1";
            if(!query.getAuthor().equals("")){
                sql += "and author like '%" + query.getAuthor() + "%' ";
            }
            if(!query.getBook_name().equals("")){
                sql += "and book_name like '%" + query.getBook_name() + "%' ";
            }
            if(!query.getIsbn().equals("")){
                sql += "and isbn like '%" + query.getIsbn() + "%' ";
            }
            if(!query.getPublisher().equals("")){
                sql += "and publisher like '%" + query.getPublisher() + "%' ";
            }
            if(query.getCategory_id()!=-1){
                sql += "and category_id = " + query.getCategory_id() + " ";
            }
            if(query.isAvailable()){
                sql += "and available_number > 0 ";
            }
            if(!query.getOrder().equals("")){
                sql += "order by "+query.getOrder()+" ";
                if(query.isDesc()){
                    sql += "desc";
                }
            }
            rs = st.executeQuery(sql);
            while(rs.next()){
                temp = new Book_Info();
                temp.setBook_id(rs.getInt(1));
                temp.setIsbn(rs.getString(2));
                temp.setBook_name(rs.getString(3));
                temp.setPublisher(rs.getString(4));
                temp.setAuthor(rs.getString(5));
                temp.setCategory_id(rs.getInt(6));
                temp.setPrice(rs.getDouble(7));
                temp.setTotal_number(rs.getInt(8));
                temp.setAvailable_number(rs.getInt(9));
                list.add(temp);
            }
            rs.close();
            st.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    public User_Info getUserInfo(int user_id) {
        User_Info user = new User_Info();
        try {
            int i=0;
            Statement st = conn.createStatement();
            ResultSet rs = null;
            String sql = "select user_id, phone_number, name, birthday, " +
                    "identity, email, qq, credit, register_time" +
                    " from library_creator.user_info where user_id = " + user_id;
            rs = st.executeQuery(sql);
            while (rs.next()) {
                user.setUser_id(rs.getInt(1));
                user.setPhone_number(rs.getString(2));
                user.setName(rs.getString(3));
                user.setBirthday(rs.getDate(4));
                user.setIdentity(rs.getString(5));
                user.setEmail(rs.getString(6));
                user.setQq(rs.getString(7));
                user.setCredit(rs.getInt(8));
                user.setRegister_time(rs.getDate(9));
                i++;
            }
            if(i==0)
                return null;
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return user;
    }

    public String getBookCategory_name(int Category_id)
    {
        String BookCategory_name="";
        try {
            int i=0;
            Statement st = conn.createStatement();
            ResultSet rs = null;
            String sql = "select  CATEGORY_NAME from library_creator.book_category " +
                    "where CATEGORY_ID="+Integer.toString(Category_id);
            rs = st.executeQuery(sql);
            while (rs.next()) {
                BookCategory_name=rs.getString(1);
                i++;
            }
            if(i==0)
                return null;
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return BookCategory_name;
    }

    public ArrayList<Book_Category> getBookCategory() {
        ArrayList<Book_Category> list = new ArrayList<Book_Category>();
        Book_Category temp;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = null;
            String sql = "select CATEGORY_ID, CATEGORY_NAME from library_creator.book_category order by CATEGORY_ID";
            rs = st.executeQuery(sql);
            while (rs.next()) {
                temp = new Book_Category();
                temp.setCategory_id(rs.getInt(1));
                temp.setCategory_name(rs.getString(2));
                list.add(temp);
            }
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return list;
    }

    public ArrayList<Book_Info> searchBookInfoByCategory(int book_category_id){
        ArrayList<Book_Info> list = new ArrayList<Book_Info>();
        Book_Info temp;
        try{
            Statement st = conn.createStatement();
            ResultSet rs = null;
            String sql = "select book_id,isbn,book_name,publisher,author,category_id," +
                    "price,total_number,available_number from library_creator.book_info " +
                    "where category_id = "+book_category_id +" order by book_name";
            rs = st.executeQuery(sql);
            while(rs.next()){
                temp = new Book_Info();
                temp.setBook_id(rs.getInt(1));
                temp.setIsbn(rs.getString(2));
                temp.setBook_name(rs.getString(3));
                temp.setPublisher(rs.getString(4));
                temp.setAuthor(rs.getString(5));
                temp.setCategory_id(rs.getInt(6));
                temp.setPrice(rs.getDouble(7));
                temp.setTotal_number(rs.getInt(8));
                temp.setAvailable_number(rs.getInt(9));
                list.add(temp);
            }
            rs.close();
            st.close();
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
        return list;
    }

    public ArrayList<Book_Info> searchBookInfoByBookName(String book_name){
        ArrayList<Book_Info> list = new ArrayList<Book_Info>();
        Book_Info temp;
        try{
            Statement st = conn.createStatement();
            ResultSet rs = null;
            String sql = "select book_id,isbn,book_name,publisher,author,category_id," +
                    "price,total_number,available_number from library_creator.book_info " +
                    "where book_name like '%" + book_name + "%' order by book_name";
            rs = st.executeQuery(sql);
            while(rs.next()){
                temp = new Book_Info();
                temp.setBook_id(rs.getInt(1));
                temp.setIsbn(rs.getString(2));
                temp.setBook_name(rs.getString(3));
                temp.setPublisher(rs.getString(4));
                temp.setAuthor(rs.getString(5));
                temp.setCategory_id(rs.getInt(6));
                temp.setPrice(rs.getDouble(7));
                temp.setTotal_number(rs.getInt(8));
                temp.setAvailable_number(rs.getInt(9));
                list.add(temp);
            }
            rs.close();
            st.close();
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
        return list;
    }

    public ArrayList<Book_Info> searchBookInfoByAuthorName(String author_name){
        ArrayList<Book_Info> list = new ArrayList<Book_Info>();
        Book_Info temp;
        try{
            Statement st = conn.createStatement();
            ResultSet rs = null;
            String sql = "select book_id,isbn,book_name,publisher,author,category_id," +
                    "price,total_number,available_number from library_creator.book_info " +
                    "where author like '%" + author_name + "%' order by book_name";
            rs = st.executeQuery(sql);
            while(rs.next()){
                temp = new Book_Info();
                temp.setBook_id(rs.getInt(1));
                temp.setIsbn(rs.getString(2));
                temp.setBook_name(rs.getString(3));
                temp.setPublisher(rs.getString(4));
                temp.setAuthor(rs.getString(5));
                temp.setCategory_id(rs.getInt(6));
                temp.setPrice(rs.getDouble(7));
                temp.setTotal_number(rs.getInt(8));
                temp.setAvailable_number(rs.getInt(9));
                list.add(temp);
            }
            rs.close();
            st.close();
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
        return list;
    }

    public Book_Info getBookInfo(int book_id){
        Book_Info book_info = null;
        try{
            int i=0;
            Statement st = conn.createStatement();
            ResultSet rs = null;
            String sql = "select book_id,isbn,book_name,publisher,author,category_id," +
                    "price,total_number,available_number from library_creator.book_info " +
                    "where book_id = "+book_id;
            rs = st.executeQuery(sql);
            while(rs.next()){
                book_info = new Book_Info();
                book_info.setBook_id(rs.getInt(1));
                book_info.setIsbn(rs.getString(2));
                book_info.setBook_name(rs.getString(3));
                book_info.setPublisher(rs.getString(4));
                book_info.setAuthor(rs.getString(5));
                book_info.setCategory_id(rs.getInt(6));
                book_info.setPrice(rs.getDouble(7));
                book_info.setTotal_number(rs.getInt(8));
                book_info.setAvailable_number(rs.getInt(9));
                i++;
            }
            if(i==0)
                return null;
            rs.close();
            st.close();
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
        return book_info;
    }

    public int insertBook_category(String theBook_category_name){
        try{
            String sql = "insert  into library_creator.book_category "+
                    "values (library_creator.category_id.nextval,?)";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1,theBook_category_name);
            ps.executeUpdate();
            conn.commit();
            ps.close();
            return 1;
        }catch(Exception e){
            e.printStackTrace();
            return 0;
        }
    }

    public int modifyBook_category(int theCategory_id,String theBook_category_name)
    {
        try {
            String sql = "update library_creator.book_category set " +
                    "category_name=? where category_id=" + theCategory_id;
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, theBook_category_name);
            ps.executeUpdate();
            conn.commit();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
        return 1;
    }

    //通过bookid来查书
    public ArrayList<Single_book> getSingle_Book_Set(int theBookId) {
        ArrayList<Single_book> theSingle_book_set = new ArrayList<Single_book>();
        try {
            int i=0;
            Statement st = conn.createStatement();
            ResultSet rs = null;
            String sql = "select serial, book_id, if_borrow, if_lost" +
                    " from library_creator.single_book where book_id = " + theBookId;
            rs = st.executeQuery(sql);
            while (rs.next()) {
                Single_book theSingle_book = new Single_book();
                theSingle_book.setSerial(rs.getInt(1));
                theSingle_book.setBook_id(rs.getInt(2));
                theSingle_book.setIf_borrow(rs.getBoolean(3));
                theSingle_book.setIf_lost(rs.getBoolean(4));
                theSingle_book_set.add(theSingle_book);
                i++;
            }
            if(i==0)
                return null;
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return theSingle_book_set;
    }


    public Single_book getSingle_Book(int theSerial){
        Single_book theSingle_book = new Single_book();
        try {
            int i=0;
            Statement st = conn.createStatement();
            ResultSet rs = null;
            String sql = "select serial, book_id, if_borrow, if_lost" +
                    " from library_creator.single_book where serial = " + theSerial;
            rs = st.executeQuery(sql);
            while (rs.next()) {
                theSingle_book.setSerial(rs.getInt(1));
                theSingle_book.setBook_id(rs.getInt(2));
                theSingle_book.setIf_borrow(rs.getBoolean(3));
                theSingle_book.setIf_lost(rs.getBoolean(4));
                i++;
            }
            if(i==0)
                return null;
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return theSingle_book;
    }
    public ArrayList<Borrow_record> getAll_Borrow_record_set() {
        ArrayList<Borrow_record> Borrow_records=new ArrayList<Borrow_record>();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = null;
            String sql = "select borrow_id,user_id, book_id, serial," +
                    "borrowouttime,predictreturntime,actualreturntime,if_return,price" +
                    " from library_creator.borrow_record";
            rs = st.executeQuery(sql);
            while (rs.next()) {
                Borrow_record theBorrow_record = new Borrow_record();
                theBorrow_record.setBorrow_id((rs.getInt(1)));
                theBorrow_record.setUser_id(rs.getInt(2));
                theBorrow_record.setBook_id(rs.getInt(3));
                theBorrow_record.setSerial(rs.getInt(4));

                //借出时间 BorrowOutTime
                theBorrow_record.setBorrowOutTime(SQLtoUTIL(rs.getDate(5)));
                //预期归还时间 PredictReturnTime
                theBorrow_record.setPredictReturnTime(SQLtoUTIL(rs.getDate(6)));
                //实际归还时间 ActualReturnTime
                if (rs.getDate(7) != null)
                    theBorrow_record.setActualReturnTime(SQLtoUTIL(rs.getDate(7)));

                theBorrow_record.setIf_Return(rs.getBoolean(8));
                theBorrow_record.setPrice(rs.getDouble(9));

                Borrow_records.add(theBorrow_record);
            }
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return Borrow_records;
    }
    public ArrayList<Borrow_record> getBorrow_record_set(int user_id) {
        ArrayList<Borrow_record> Borrow_records=new ArrayList<Borrow_record>();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = null;
            String sql = "select borrow_id,user_id, book_id, serial," +
                    "borrowouttime,predictreturntime,actualreturntime,if_return,price" +
                    " from library_creator.borrow_record where user_id = " + user_id;
            rs = st.executeQuery(sql);
            while (rs.next()) {
                Borrow_record theBorrow_record = new Borrow_record();
                theBorrow_record.setBorrow_id((rs.getInt(1)));
                theBorrow_record.setUser_id(rs.getInt(2));
                theBorrow_record.setBook_id(rs.getInt(3));
                theBorrow_record.setSerial(rs.getInt(4));

                //借出时间 BorrowOutTime
                theBorrow_record.setBorrowOutTime(SQLtoUTIL(rs.getDate(5)));
                //预期归还时间 PredictReturnTime
                theBorrow_record.setPredictReturnTime(SQLtoUTIL(rs.getDate(6)));
                //实际归还时间 ActualReturnTime
                if (rs.getDate(7) != null)
                    theBorrow_record.setActualReturnTime(SQLtoUTIL(rs.getDate(7)));

                theBorrow_record.setIf_Return(rs.getBoolean(8));
                theBorrow_record.setPrice(rs.getDouble(9));

                Borrow_records.add(theBorrow_record);
            }
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return Borrow_records;
    }


    public int insertBorrow_record(int theUser_id,
                                   int theSerial,String theBorTime,String thePreTime
                                   )//增加一个借书记录 1是成功0是失败
    {
        try{
            Single_book temp=getSingle_Book(theSerial);
            Book_Info temp_book=getBookInfo(temp.getBook_id());
            if(temp==null)
            {
                System.out.println("查不到该书");
                return 0;
            }
            if(temp.getIf_borrow()==true||temp.getIf_lost()==true)
            {
                System.out.println("该书已借出或已丢失，不可借书");
                return 0;
            }
            String theBorrowTime="to_date('" +theBorTime+ " ','yyyymmdd')";
            String thePredictTime="to_date('" +thePreTime+ " ','yyyymmdd')";

            String sql = "insert  into library_creator.borrow_record(borrow_id,USER_ID,BOOK_ID,SERIAL," +
                    "BORROWOUTTIME,PREDICTRETURNTIME,ACTUALRETURNTIME,IF_RETURN,PRICE)" +
                    "values (library_creator.borrow_id.nextval,?,?,?,"+ theBorrowTime +","
                    +thePredictTime+",null,0,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1,theUser_id);
            ps.setInt(2,temp_book.getBook_id());
            ps.setInt(3,theSerial);
            ps.setDouble(4,temp_book.getPrice());

            ps.executeUpdate();
            conn.commit();
            ps.close();
            return 1;
        }catch(Exception e){
            e.printStackTrace();
            return 0;
        }
    }

    //还书
    public int return_singleBook(int theBorrow_record_id,String theActualReturnTime)
    {
        try {
            Statement st = conn.createStatement();
            String actualReturnTime="to_date('" +theActualReturnTime+ " ','yyyymmdd')";
            String sql = "update library_creator.borrow_record set " +
                    "if_return=1 , ACTUALRETURNTIME="+actualReturnTime;
            st.executeUpdate(sql);
            conn.commit();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
        return 1;
    }

    //添加一条丢书记录，若borrow_record_id为
    public int insertLost_record(int serial, int borrow_record_id,
                                 int compensation_way) {
        try {
            Single_book temp=getSingle_Book(serial);
            Book_Info temp_book=getBookInfo(temp.getBook_id());
            if(temp==null)
            {
                System.out.println("查不到该书");
                return 0;
            }
            if(temp.getIf_borrow()==false||temp.getIf_lost()==true)
            {
                System.out.println("该书未借出或已丢失，不可添加丢失记录");
                return 0;
            }

            Statement st = conn.createStatement();
            String sql = "insert into library_creator.lost_record values(library_creator.lost_id.nextval,?,?," +
                    "?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, borrow_record_id);
            ps.setDouble(2, temp_book.getPrice());
            ps.setBoolean(3, true);
            ps.setInt(4, compensation_way);
            ps.setInt(5, serial);
            ps.executeUpdate();
            conn.commit();
            ps.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
        return 1;
    }

    public Lost_record getLost_record(int theLost_record_id) {
        Lost_record theLost_record = new Lost_record();
        try {
            int i=0;
            Statement st = conn.createStatement();
            ResultSet rs = null;
            String sql = "select lost_id, serial,borrow_id, price, if_compensate," +
                    " compensation_way from library_creator.lost_record where lost_id = " + theLost_record_id;
            rs = st.executeQuery(sql);
            while (rs.next()) {
                theLost_record.setLost_id(rs.getInt(1));
                theLost_record.setSerial(rs.getInt(2));
                theLost_record.setBorrow_record_id(rs.getInt(3));
                theLost_record.setPrice(rs.getDouble(4));
                theLost_record.setIf_compensate(rs.getBoolean(5));
                theLost_record.setCompensation_way(rs.getInt(6));
                i++;
            }
            if(i==0)
                return null;
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return theLost_record;
    }


    public int modifyBook_Info(int book_id, String isbn, String book_name, String publisher,
                               String author, int category_id, double price
                               ) {
        try {
            Statement st = conn.createStatement();
            String sql = "update library_creator.book_info set " +
                    "isbn=?,book_name=?,publisher=?,author=?,category_id=?," +
                    "price=?,total_number=?,available_number=? where book_id=" + book_id;
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, isbn);
            ps.setString(2, book_name);
            ps.setString(3, publisher);
            ps.setString(4, author);
            ps.setInt(5, category_id);
            ps.setDouble(6, price);

            ps.executeUpdate();
            conn.commit();
            ps.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
        return 1;
    }

    public int insertBook_Info(String isbn, String book_name, String publisher,
                               String author, int category_id, double price) {
        try {
            Statement st = conn.createStatement();
            String sql = "insert into library_creator.book_info values(library_creator.book_id.nextval,?,?," +
                    "?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, isbn);
            ps.setString(2, book_name);
            ps.setString(3, publisher);
            ps.setString(4, author);
            ps.setInt(5, category_id);
            ps.setDouble(6, price);
            ps.setInt(7,0);
            ps.setInt(8,0);
            ps.executeUpdate();
            conn.commit();
            ps.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
        return 1;
    }

    public int insertSingleBook(int book_id) {
        try {
            Statement st = conn.createStatement();
            String sql = "insert into library_creator.single_book values(library_creator.serial.nextval,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, book_id);
            boolean if_index=false;
            ps.setBoolean(2, if_index);
            ps.setBoolean(3, if_index);
            ps.executeUpdate();
            conn.commit();
            ps.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
        return 1;
    }

    public int deleteBook_Info(int book_id) {
        try {
            Statement st = conn.createStatement();
            ArrayList<Single_book> single_books=getSingle_Book_Set(book_id);
            if(single_books!=null)
            {
                if(single_books.size()!=0)
                    return 2;//如果该书有还未删除的single_book，则返回2
            }
            String sql = "delete from library_creator.book_info where book_id=" + book_id;
            st.executeUpdate(sql);
            conn.commit();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
        return 1;
    }

    public int deleteSingle_book(int serial)
    {
        try {
            Statement st = conn.createStatement();
            Single_book single_book=getSingle_Book(serial);
            if(single_book==null)
                return 0;
            String sql = "delete from library_creator.Single_book where serial=" + serial;
            st.executeUpdate(sql);
            conn.commit();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
        return 1;
    }

    public Notice_Info getNotice_Info(int theNotice_id) {
        Notice_Info theNotice_Info = new Notice_Info();
        try {
            int i=0;
            Statement st = conn.createStatement();
            ResultSet rs = null;
            String sql = "select notice_id,notice_title,notice_author," +
                    "notice_release_time,notice_content" +
                    " from library_creator.notice where notice_id = " + theNotice_id;
            rs = st.executeQuery(sql);
            while (rs.next()) {
                theNotice_Info.setNotice_id(rs.getInt(1));
                theNotice_Info.setNotice_title(rs.getString(2));
                theNotice_Info.setNotice_author(rs.getString(3));
                //Date类转换
                theNotice_Info.setNotice_release_time(SQLtoUTIL(rs.getDate(4)));
                //判断是否为空
                String content = rs.getString(5);
                if (content != null)
                    theNotice_Info.setNotice_content(content);
                i++;
            }
            if(i==0)
                return null;
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return theNotice_Info;
    }

    public int insertNotice(String theNotice_title, String theNotice_author,
                            String Notice_release_time, String theNotice_content) {
        try {
            String theNotice_release_time = "to_date('" + Notice_release_time + "','yyyymmdd')";
            Statement st = conn.createStatement();
            String sql = "insert into library_creator.Notice values(library_creator.NOTICE_ID.nextval,?,?," +
                    theNotice_release_time + ",?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, theNotice_title);
            ps.setString(2, theNotice_author);
            ps.setString(3, theNotice_content);
            ps.executeUpdate();
            conn.commit();
            ps.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
        return 1;
    }

    public int deleteNotice(int theNotice_id) {
        try {
            Statement st = conn.createStatement();
            String sql = "delete from library_creator.notice where notice_id=" + theNotice_id;
            st.executeUpdate(sql);
            conn.commit();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
        return 1;
    }

    public Borrow_record getBorrow_record(int borrow_id)
    {
        Borrow_record borrow_record=new Borrow_record();
        try {
            int i=0;
            Statement st = conn.createStatement();
            ResultSet rs = null;
            String sql = "select borrow_id, user_id, book_id, serial," +
                    "borrowouttime,predictreturntime,actualreturntime,"+
                    "if_return,price"+
                    " from library_creator.borrow_record where borrow_id = " + borrow_id;
            rs = st.executeQuery(sql);
            while (rs.next()) {
                borrow_record.setBorrow_id(rs.getInt(1));
                borrow_record.setUser_id(rs.getInt(2));
                borrow_record.setBook_id(rs.getInt(3));
                borrow_record.setSerial(rs.getInt(4));
                borrow_record.setBorrowOutTime(SQLtoUTIL(rs.getDate(5)));
                borrow_record.setPredictReturnTime(SQLtoUTIL(rs.getDate(6)));
                if(rs.getDate(7)!=null)
                    borrow_record.setActualReturnTime(SQLtoUTIL(rs.getDate(7)));
                else
                    borrow_record.setActualReturnTime(null);
                borrow_record.setIf_Return(rs.getBoolean(8));
                borrow_record.setPrice(rs.getDouble(9));
                i++;
            }
            if(i==0)
                return null;
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return borrow_record;
    }

    //添加一条丢书记录，若borrow_record_id为
    public int insertLost_record(int borrow_record_id,
                                 int compensation_way) {
        try {
            Borrow_record borrow_record=getBorrow_record(borrow_record_id);
            if(borrow_record==null)//未找到该记录
                return 0;
            if(borrow_record.isIf_Return()==true)
            {
                System.out.println("该书已归还，不可添加丢失记录");
                return 0;
            }

            Statement st = conn.createStatement();
            String sql = "insert into library_creator.lost_record values(library_creator.lost_id.nextval,?,?," +
                    "?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, borrow_record_id);
            ps.setDouble(2, borrow_record.getPrice());
            ps.setBoolean(3, true);
            ps.setInt(4, compensation_way);
            ps.setInt(5, borrow_record.getSerial());
            ps.executeUpdate();
            conn.commit();
            ps.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
        return 1;
    }
}

