package LibraryManagementSystem_admin;

public class Book_Info {
    public Book_Info(){};
    private int book_id;
    private String isbn;
    private String book_name;
    private String publisher;
    private String author;
    int category_id;
    double price;
    int total_number=0;
    int available_number;

    public int getBook_id() {
        return book_id;
    }
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
    public double getPrice() {
        return price;
    }
    public int getTotal_number() {
        return total_number;
    }
    public int getAvailable_number() {
        return available_number;
    }
    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }
    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }
    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }
    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }
    public void setAuthor(String author) {
        this.author = author;
    }
    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }
    public void setPrice(double price) {
        this.price = price;
    }
    public void setTotal_number(int total_number) {
        this.total_number = total_number;
    }
    public void setAvailable_number(int available_number) {
        this.available_number = available_number;
    }


}
