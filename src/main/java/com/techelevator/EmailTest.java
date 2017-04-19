package com.techelevator;



public class EmailTest {
	
	
	MailSender sendMailTeacher = new MailSender("kyleDwine@gmail.com", "Hi!", "It's a body!");
	
	
	public void sendMail(){
		
		sendMailTeacher.start();
	}
	
	
	
}

