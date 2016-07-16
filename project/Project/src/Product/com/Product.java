package Product.com;

import java.util.Date;

public class Product {

    private int _stt;
    private String _sku;
    private String _name;
    private double _price;
    private int _quantity;
    private Date _date;
    private int _view;
    private String _url;
    private String _comment;
    private String _comment2;
    private String _comment3;
    private String _comment4;
    private String _comment5;
    private String _comment6;
    private String _comment7;
    private Integer _status;


    public Integer get_status() {
        return _status;
    }

    public void set_status(Integer _status) {
        this._status = _status;
    }

    public Product(int stt, String id, String name, double price, int quantity, Date date, int view, String url, String comment, String comment2, String comment3, String comment4, String comment5, String comment6, String comment7, Integer status) {
        _stt = stt;
        _sku = id;
        _name = name;
        _price = price;
        _quantity = quantity;
        _date = date;
        _view = view;
        _url = url;
        _comment = comment;
        _comment2 = comment2;
        _comment3 = comment3;
        _comment4 = comment4;
        _comment5 = comment5;
        _comment6 = comment6;
        _comment7 = comment7;

        _status = status;
    }

    public Product() {
    }

    public String get_comment() {
        return _comment;
    }

    public void set_comment(String _comment) {
        this._comment = _comment;
    }

    public String get_url() {
        return _url;
    }

    public void set_url(String _url) {
        this._url = _url;
    }

    public int getStt() {
        return _stt;
    }

    public void setStt(int value) {
        _stt = value;
    }

    public String getID() {
        return _sku;
    }

    public void setID(String value) {
        _sku = value;
    }

    public String get_comment2() {
        return _comment2;
    }

    public void set_comment2(String _comment2) {
        this._comment2 = _comment2;
    }

    public String get_comment3() {
        return _comment3;
    }

    public void set_comment3(String _comment3) {
        this._comment3 = _comment3;
    }

    public String get_comment4() {
        return _comment4;
    }

    public void set_comment4(String _comment4) {
        this._comment4 = _comment4;
    }

    public String get_comment5() {
        return _comment5;
    }

    public void set_comment5(String _comment5) {
        this._comment5 = _comment5;
    }

    public String get_comment6() {
        return _comment6;
    }

    public void set_comment6(String _comment6) {
        this._comment6 = _comment6;
    }

    public String get_comment7() {
        return _comment7;
    }

    public void set_comment7(String _comment7) {
        this._comment7 = _comment7;
    }

    public String getName() {
        return _name;
    }

    public void setName(String value) {
        _name = value;
    }

    public double getPrice() {
        return _price;
    }

    public void setPrice(double value) {
        _price = value;
    }

    public int getQuantity() {
        return _quantity;
    }

    public void setQuantity(int value) {
        _quantity = value;
    }

    public Date getDate() {
        return _date;
    }

    public void setDate(Date value) {
        _date = value;
    }

    public int getView() {
        return _view;
    }

    public void setView(int value) {
        _view = value;
    }
}
