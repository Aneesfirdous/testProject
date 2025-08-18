package com.studybuddy.model;

public class User {
	private String fullname;
	private String email;
	private String password;
	private int id;
    private String username;     

	private String profileImage;

	
	public String getProfileImage() {
		return profileImage;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public User(String fullname, String email, String password) {
		super();
		this.fullname = fullname;
		this.email = email;
		this.password = password;
	}
	public User() {
		
	}
	
	
}
    

    