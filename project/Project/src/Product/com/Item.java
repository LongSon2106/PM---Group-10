package Product.com;


public class Item {
    private Product p = new Product();
    private int _total;

    public Item(Product p, int _total) {
        this.p = p;
        this._total = _total;
    }

    public Item() {
    }

    public int get_total() {
        return _total;
    }

    public void set_total(int _total) {
        this._total = _total;
    }

    public Product getP() {
        return p;
    }

    public void setP(Product p) {
        this.p = p;
    }
}
