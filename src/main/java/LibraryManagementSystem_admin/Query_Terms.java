package LibraryManagementSystem_admin;

public class Query_Terms {
    public Query_Terms(){}
    private String isbn;
    private String book_name;
    private String publisher;
    private String author;
    private int category_id;
    private boolean available;
    private String order;//按照...排序
    private boolean desc;//倒序

    public String getIsbn() {
        return isbn;
    }
    public String getBook_name() {
        return book_name;
    }
    public String getPublisher() {
        return publisher;
    }
    public String getAuthor() {
        return author;
    }
    public int getCategory_id() {
        return category_id;
    }
    public String getOrder() {
        return order;
    }
    public boolean isAvailable() {
        return available;
    }
    public boolean isDesc() {
        return desc;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }
    public void setAuthor(String author) {
        this.author = author;
    }
    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }
    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }
    public void setAvailable(boolean available) {
        this.available = available;
    }
    public void setDesc(boolean desc) {
        this.desc = desc;
    }
    public void setOrder(String order) {
        this.order = order;
    }
    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }
}