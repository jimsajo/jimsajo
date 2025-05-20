package com.jimsajo.Dto;

import java.time.LocalDateTime;

public class CommentDto {
	private int cNum;          // 댓글 번호
    private Integer rNum;          // 리뷰 번호
    private int mNum;          // 작성자 번호
    private String mId;        // 작성자 ID
    private String cContent;   // 댓글 내용
    private LocalDateTime cCreate; // 작성 시간
    private Integer parentCNum;    // 부모 댓글 번호 (0이면 최상위)
    private int depth;         // JSP 들여쓰기용 (DB 저장 X)
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
	}
	public Integer getrNum() {
		return rNum;
	}
	public void setrNum(Integer rNum) {
		this.rNum = rNum;
	}
	public int getmNum() {
		return mNum;
	}
	public void setmNum(int mNum) {
		this.mNum = mNum;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getcContent() {
		return cContent;
	}
	public void setcContent(String cContent) {
		this.cContent = cContent;
	}
	public LocalDateTime getcCreate() {
		return cCreate;
	}
	public void setcCreate(LocalDateTime cCreate) {
		this.cCreate = cCreate;
	}
	public Integer getParentCNum() {
		return parentCNum;
	}
	public void setParentCNum(Integer parentCNum) {
		this.parentCNum = parentCNum;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
    
}
