package Comment.com;

/**
 * Created by KUBO0212 on 11/27/2015.
 */
public class Comment {
    private Integer stt;
    private String username;
    private String email;
    private String comment;
    private String date;

    public Comment() {
    }

    public Comment(Integer stt, String username, String email, String comment, String date) {
        this.stt = stt;
        this.username = username;
        this.email = email;
        this.comment = comment;
        this.date = date;

    }

    public Integer getStt() {
        return stt;
    }

    public void setStt(Integer stt) {
        this.stt = stt;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
