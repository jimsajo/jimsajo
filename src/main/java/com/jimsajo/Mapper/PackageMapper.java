package com.jimsajo.Mapper;

import com.jimsajo.Dto.PackageDto;
import java.util.List;

public interface PackageMapper {

    // 패키지 등록
    void insertPackage(PackageDto packageDto);

    // 전체 패키지 목록 조회
    List<PackageDto> selectPackage();

    // 특정 패키지 조회
    PackageDto selectPackageById(Integer pNum);  // 이 메소드 확인 필요

    // 패키지 수정
    void updatePackage(PackageDto packageDto);

    // 패키지 삭제
    void deletePackage(Integer pNum);

    // 국가별 패키지 조회
    List<PackageDto> selectPackageByCountry(String pCountry);
}
