package Bill.com;

/**
 * Created by KUBO0212 on 12/9/2015.
 */
public class DetailBill {
    private String nameBill;
    private String product;
    private Integer quantity;
    private Integer stt;
    private Integer idbill;

    public Integer getIdbill() {
        return idbill;
    }

    public void setIdbill(Integer idbill) {
        this.idbill = idbill;
    }

    public String getNameBill() {
        return nameBill;
    }

    public void setNameBill(String nameBill) {
        this.nameBill = nameBill;
    }

    public String getProduct() {
        return product;
    }

    public Integer getStt() {
        return stt;
    }

    public void setStt(Integer stt) {
        this.stt = stt;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public DetailBill(String nameBill, String product, Integer quantity, Integer stt, Integer idbill) {
        this.nameBill = nameBill;
        this.product = product;
        this.quantity = quantity;
        this.stt = stt;
        this.idbill = idbill;
    }

    public DetailBill() {
    }
}
