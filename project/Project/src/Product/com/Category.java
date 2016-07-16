package Product.com;

public class Category {
    private String _catid;
    private String _catname;
    private Integer _status;

    public Integer get_status() {
        return _status;
    }

    public void set_status(Integer _status) {
        this._status = _status;
    }

    public Category(String catid, String catname, Integer status) {
        _catid = catid;
        _catname = catname;
        _status = status;
    }

    public Category() {
    }

    public String getCatID() {
        return _catid;
    }

    public void setCatID(String value) {
        _catid = value;
    }

    public String getCatName() {
        return _catname;
    }

    public void setCatName(String value) {
        _catname = value;
    }
}
