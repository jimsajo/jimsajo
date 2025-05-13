package com.jimsajo.Service;

import com.jimsajo.Dto.PackageDto;
import java.util.List;

public interface PackageService {

    // 패키지 등록
    void registerPackage(PackageDto packageDto);

    // 전체 패키지 목록 조회
    List<PackageDto> selectPackage();

    // 특정 패키지 조회
    PackageDto getPackageById(Integer pNum);  // 메소드 이름 통일

    // 패키지 수정
    void updatePackage(PackageDto packageDto);

    // 패키지 삭제
    void deletePackage(Integer pNum);

    // 국가별 패키지 조회
    List<PackageDto> getPackagesByCountry(String pCountry);
}
