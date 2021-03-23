package board.bean;

import lombok.Data;

@Data
public class BoardDTO {
	private int seq;
	private String id;
	private String name;
	private String email;
	private String subject;
	private String content;
	private int ref;
	private String lev;
	private String step;
	private String pseq;
	private String reply;
	private String hit;
	private String logtime;
	
	
}
