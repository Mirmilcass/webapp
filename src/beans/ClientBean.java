package beans;

/**
 * 
 * @author jaewo
 *
 *         create table user2 (name varchar(20), phone varchar(20), job
 *         varchar(20));
 */

public class ClientBean {
	private String name, phone, job;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

}
