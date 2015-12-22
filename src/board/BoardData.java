package board;

/*
create table board_list(
	board_num number(10) not null, 
	gno number(7), 
	ono number(7), 
	nested number(7), 
	id varchar2(20), 
	name varchar2(20), 
	title varchar2(100), 
	content varchar2(4000), 
	wdate varchar2(50), 
	readno number(7), 
		pseq number default 0, // ¾È¾¸ 
		reply number default 0, // ¾È¾¸ 
	constraint board_pk primary key (board_num));
create index inx_board_gno on board_list(gno, ono desc);
create sequence board_num start with 1 increment by 1 nocache; // board_numÀÇ ÀÚµ¿ ¹øÈ£
*/

import java.util.*;

public class BoardData {

	private int num, group, order, nested, readno, pseq, reply;
	private String id, name, title, content, wdate;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getGroup() {
		return group;
	}

	public void setGroup(int group) {
		this.group = group;
	}

	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
	}

	public int getNested() {
		return nested;
	}

	public void setNested(int nested) {
		this.nested = nested;
	}

	public int getReadno() {
		return readno;
	}

	public void setReadno(int readno) {
		this.readno = readno;
	}

	public int getPseq() {
		return pseq;
	}

	public void setPseq(int pseq) {
		this.pseq = pseq;
	}

	public int getReply() {
		return reply;
	}

	public void setReply(int reply) {
		this.reply = reply;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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
