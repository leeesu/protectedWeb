package org.protectedog.service.domain;

import java.util.Date;

public class Message {

	///Field
	//Message DB
	private int messageNo;
	private String messageTitle;
	private String messageContent;
	private Date sendDate;
	private Date receiveDate;
	private String messageStatus;
	private String senderNick;
	private String receiverNick;
	private String delCode;

	
	///Constructor
	
	///Method
	public int getMessageNo() {
		return messageNo;
	}
	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}
	public String getMessageTitle() {
		return messageTitle;
	}
	public void setMessageTitle(String messageTitle) {
		this.messageTitle = messageTitle;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	public Date getSendDate() {
		return sendDate;
	}
	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}
	public Date getReceiveDate() {
		return receiveDate;
	}
	public void setReceiveDate(Date receiveDate) {
		this.receiveDate = receiveDate;
	}
	public String getMessageStatus() {
		return messageStatus;
	}
	public void setMessageStatus(String messageStatus) {
		this.messageStatus = messageStatus;
	}
	public String getSenderNick() {
		return senderNick;
	}
	public void setSenderNick(String senderNick) {
		this.senderNick = senderNick;
	}
	public String getReceiverNick() {
		return receiverNick;
	}
	public void setReceiverNick(String receiverNick) {
		this.receiverNick = receiverNick;
	}
	
	public String getDelCode() {
		return delCode;
	}
	public void setDelCode(String delCode) {
		this.delCode = delCode;
	}
	@Override
	public String toString() {
		return "Message [messageNo=" + messageNo + ", messageTitle=" + messageTitle + ", messageContent="
				+ messageContent + ", sendDate=" + sendDate + ", receiveDate=" + receiveDate + ", messageStatus="
				+ messageStatus + ", senderNick=" + senderNick + ", receiverNick=" + receiverNick + ", delCode=" + delCode + "]";
	}

	
	
	
}
