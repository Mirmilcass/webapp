package beans;

public class GuestBook {
	
	private int seq_guestbook;
	private String name, title, email, content, wdate;

	public int getSeq_guestbook() {
		return seq_guestbook;
	}

	public void setSeq_guestbook(int seq_guestbook) {
		this.seq_guestbook = seq_guestbook;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
}
