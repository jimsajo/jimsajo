package com.jimsajo.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.jimsajo.Dto.PackageDto;
@Mapper
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

    // 추천된 패키지 확인
    int checkPackageRecommendation(Integer pNum);

    // 추천 등록
    void insertPackageRecommendation(Integer pNum);

    // 추천된 패키지 목록 조회
    List<PackageDto> selectRecommendedPackages();
    
    //결제한 패키지만 불러오기
    List<PackageDto> selectPackagesByMemberAndCountry(@Param("mNum") int mNum, @Param("country") String country);

}
