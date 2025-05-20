package com.jimsajo.Dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class MemberDto {
	private int mNum;                 // 회원 번호 (PK)
	private String mId;              // 아이디
	private String mPasswd;          // 비밀번호
	private String mName;            // 이름
	private String mGender;          // 성별
	private String mTel;             // 전화번호
	private LocalDateTime mDate;     // 가입일시
	private LocalDate mBirth;        // 생년월일
	private String mRoll;
}
