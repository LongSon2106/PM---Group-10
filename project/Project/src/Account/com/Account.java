package Account.com;

public class Account {
    private String username;
    private String password;
    private String repassword;
    private Integer status;
    private String email;
    private String comment;
    private String phone;
    private String dateRes;
    private String dateLast;
    private String nameuser;
    private String address;

    public Account(String _username, String _password) {
        username = _username;
        password = _password;
    }

    public Account(String username, String email, String repassword, String password, String cmt, Integer stt, String name, String add, String tel, String dateRes, String dateLast) {
        this.username = username;
        this.email = email;
        this.repassword = repassword;
        this.password = password;
        this.comment = cmt;
        this.status = stt;
        this.nameuser = name;
        this.address = add;
        this.phone = tel;
        this.dateRes = dateRes;
        this.dateLast = dateLast;
    }

    public Account() {
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getDateLast() {
        return dateLast;
    }

    public void setDateLast(String dateLast) {
        this.dateLast = dateLast;
    }

    public String getDateRes() {
        return dateRes;
    }

    public void setDateRes(String dateRes) {
        this.dateRes = dateRes;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getNameuser() {
        return nameuser;
    }

    public void setNameuser(String nameuser) {
        this.nameuser = nameuser;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRepassword() {
        return repassword;
    }

    public void setRepassword(String repassword) {
        this.repassword = repassword;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
