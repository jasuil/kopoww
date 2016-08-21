package org.zerock.domain;

import java.util.Date;

public class BoardVO {
	
	private Integer id;
	private String title;
	private String content;
	private Date date;
	private int viewcnt;
	
	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
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


	public Date getDate() {
		return date;
	}


	public void setDate(Date date) {
		this.date = date;
	}


	public int getViewcnt() {
		return viewcnt;
	}


	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}


	
	
	@Override
	public String toString() {
		return "BoardVO [id=" + id + ", title=" + title + ", content=" + content + ", date=" + date + ", viewcnt="
				+ viewcnt + "]";
	}

}
