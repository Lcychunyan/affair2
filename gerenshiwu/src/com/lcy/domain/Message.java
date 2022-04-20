package com.shequ.domain;

public class Message {
	private int id;
	private String name;
	private String user_id;
	private String drug_id;
	private String starttime;
	private String lawyer_id;
	private String title;
	private String content;
	private String price;
	private String reback;
	private String addtime;
	
	
	public String getDrug_id() {
		return drug_id;
	}
	public void setDrug_id(String drug_id) {
		this.drug_id = drug_id;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getAddtime() {
		return addtime;
	}
	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLawyer_id() {
		return lawyer_id;
	}
	public void setLawyer_id(String lawyer_id) {
		this.lawyer_id = lawyer_id;
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
	public String getReback() {
		return reback;
	}
	public void setReback(String reback) {
		this.reback = reback;
	}


	
	
	
}
