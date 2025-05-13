package com.jimsajo.Dto;

import java.time.LocalDateTime;

import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;

public class PackageDto {
    private Integer pNum;
    
    private MultipartFile uploadFile;
    @NotBlank(message = "패키지 이름은 필수입니다.")
    private String pName;

    @NotBlank(message = "국가는 필수입니다.")
    private String pCountry;

    @NotBlank(message = "상세 내용은 필수입니다.")
    private String pDescription;

    private LocalDateTime pCreate = LocalDateTime.now();  // 기본값을 현재 시간으로 설정

    @NotNull(message = "가격은 필수입니다.")
    @Positive(message = "가격은 0보다 커야 합니다.")
    private Integer pPrice;

    private String pImage;

    public PackageDto() {}

    public PackageDto(String pName, String pCountry, String pDescription, Integer pPrice) {
        this.pName = pName;
        this.pCountry = pCountry;
        this.pDescription = pDescription;
        this.pPrice = pPrice;
        this.pCreate = LocalDateTime.now(); // 생성 시점의 시간
    }

    // Getter 및 Setter 생략

    public MultipartFile getUploadFile() {
        return uploadFile;
    }

    public void setUploadFile(MultipartFile uploadFile) {
        this.uploadFile = uploadFile;
    }
    public Integer getpNum() {
		return pNum;
	}

	public void setpNum(Integer pNum) {
		this.pNum = pNum;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpCountry() {
		return pCountry;
	}

	public void setpCountry(String pCountry) {
		this.pCountry = pCountry;
	}

	public String getpDescription() {
		return pDescription;
	}

	public void setpDescription(String pDescription) {
		this.pDescription = pDescription;
	}

	public LocalDateTime getpCreate() {
		return pCreate;
	}

	public void setpCreate(LocalDateTime pCreate) {
		this.pCreate = pCreate;
	}

	public Integer getpPrice() {
		return pPrice;
	}

	public void setpPrice(Integer pPrice) {
		this.pPrice = pPrice;
	}

	public String getpImage() {
		return pImage;
	}

	public void setpImage(String pImage) {
		this.pImage = pImage;
	}

	@Override
    public String toString() {
        return "PackageDto{" +
               "pNum=" + pNum +
               ", pName='" + pName + '\'' +
               ", pCountry='" + pCountry + '\'' +
               ", pDescription='" + pDescription + '\'' +
               ", pCreate=" + pCreate +
               ", pPrice=" + pPrice +
               ", pImage='" + pImage + '\'' +
               '}';
    }
}
