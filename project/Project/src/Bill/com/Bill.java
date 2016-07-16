package Bill.com;


import java.util.Date;

public class Bill {
    private Integer stt;
    private String name;
    private String address;
    private Integer product;
    private Integer status;
    private Date date;
    private String phone;

    public Bill(Integer stt, Date date, String name, String address, Integer product, Integer status, String phone) {
        this.stt = stt;
        this.date = date;
        this.name = name;
        this.address = address;
        this.product = product;
        this.status = status;
        this.phone = phone;
    }

    public Bill() {
    }

    public Integer getStt() {
        return stt;
    }

    public void setStt(Integer stt) {
        this.stt = stt;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getProduct() {
        return product;
    }

    public void setProduct(Integer product) {
        this.product = product;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
