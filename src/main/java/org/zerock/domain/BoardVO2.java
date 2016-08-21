package org.zerock.domain;

import java.util.Date;

public class BoardVO2 {
	
	private int id;
	private String title;
	private String content;
	private Date date;
	private int viewcnt;
	private int rootid;
	private int nodeid;
	
	public int getRootid() {
		return rootid;
	}


	public void setRootid(int rootid) {
		this.rootid = rootid;
	}


	public int getNodeid() {
		return nodeid;
	}


	public void setNodeid(int nodeid) {
		this.nodeid = nodeid;
	}


	public Integer getId() {
		return id;
	}


	public void setId(int id) {
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
		return "BoardVO2 [id=" + id + ", title=" + title + ", content=" + content + ", date=" + date + ", viewcnt="
				+ viewcnt + ", rootid=" + rootid + ", nodeid=" + nodeid + "]";
	}

}
