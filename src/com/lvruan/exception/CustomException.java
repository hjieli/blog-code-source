package com.lvruan.exception;

public class CustomException extends Exception{

	private String message;
	
	public CustomException(String message) {
		// TODO Auto-generated constructor stub
		super(message);
		this.message = message;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
}
