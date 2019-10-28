package org.protectedog.service.domain;

import java.sql.Date;

//==>회원정보를 모델링(추상화/캡슐화)한 Bean
public class Adopt {
	
	///Field
	private String boardCode;
	private int postNo;
	private String id;			// user
	private String nickname;			// user
	private String postTitle;
	private String postContent;
	private String phone;		// user
	private String adoptArea;
	private String areaKr;
	private String location;
	private String locationKr;
	private Date regDate;
	
	private String dogBreed;
	private String dogWeight;
	private String dogSize;
	private String dogGender;
	private int dogPay;
	private String dogStatus;
	private String dogChar;
	private String dogPersonality;
	private Date dogDate;
	
	private String mainFile;

	private String statusCode;
	

	
	
	
	public String getBoardCode() {
		return boardCode.trim();
	}

	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAdoptArea() {
		return adoptArea;
	}

	public void setAdoptArea(String adoptArea) {
		this.adoptArea = adoptArea;
	}

	public String getAreaKr() {
		return areaKr;
	}

	public void setAreaKr(String areaKr) {
		this.areaKr = areaKr;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getLocationKr() {
		return locationKr;
	}

	public void setLocationKr(String locationKr) {
		this.locationKr = locationKr;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getDogBreed() {
		return dogBreed;
	}

	public void setDogBreed(String dogBreed) {
		this.dogBreed = dogBreed;
	}

	public String getDogWeight() {
		return dogWeight;
	}

	public void setDogWeight(String dogWeight) {
		this.dogWeight = dogWeight;
	}

	public String getDogSize() {
		return dogSize;
	}

	public void setDogSize(String dogSize) {
		this.dogSize = dogSize;
	}

	public String getDogGender() {
		return dogGender;
	}

	public void setDogGender(String dogGender) {
		this.dogGender = dogGender;
	}

	public int getDogPay() {
		return dogPay;
	}

	public void setDogPay(int dogPay) {
		this.dogPay = dogPay;
	}

	public String getDogStatus() {
		return dogStatus;
	}

	public void setDogStatus(String dogStatus) {
		this.dogStatus = dogStatus;
	}

	public String getDogChar() {
		return dogChar;
	}

	public void setDogChar(String dogChar) {
		this.dogChar = dogChar;
	}

	public String getDogPersonality() {
		return dogPersonality;
	}

	public void setDogPersonality(String dogPersonality) {
		this.dogPersonality = dogPersonality;
	}

	public Date getDogDate() {
//		dogDate = dogDate.substring(0, 11);
		return dogDate;
	}

	public void setDogDate(Date dogDate) {
		this.dogDate = dogDate;
	}

	public String getMainFile() {
		return mainFile;
	}

	public void setMainFile(String mainFile) {
		this.mainFile = mainFile;
	}

	public String getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}

	
	
	@Override
	public String toString() {
		return "Adopt [boardCode=" + boardCode + ", postNo=" + postNo + ", id=" + id + ", postTitle=" + postTitle
				+ ", postContent=" + postContent + ", phone=" + phone + ", adoptArea=" + adoptArea + ", areaKr="
				+ areaKr + ", location=" + location + ", locationKr=" + locationKr + ", regDate=" + regDate
				+ ", dogBreed=" + dogBreed + ", dogWeight=" + dogWeight + ", dogSize=" + dogSize + ", dogGender="
				+ dogGender + ", dogPay=" + dogPay + ", dogStatus=" + dogStatus + ", dogChar=" + dogChar
				+ ", dogPersonality=" + dogPersonality + ", dogDate=" + dogDate + ", mainFile=" + mainFile
				+ ", statusCode=" + statusCode + "]";
	}
	

}