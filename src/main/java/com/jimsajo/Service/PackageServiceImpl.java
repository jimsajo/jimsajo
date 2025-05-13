package com.jimsajo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jimsajo.Dto.PackageDto;
import com.jimsajo.Mapper.PackageMapper;

@Service
public class PackageServiceImpl implements PackageService {

    @Autowired
    private PackageMapper packageMapper;

    // 패키지 등록
    @Override
    public void registerPackage(PackageDto packageDto) {
        packageMapper.insertPackage(packageDto);
    }

    // 전체 패키지 목록 조회
    @Override
    public List<PackageDto> selectPackage() {
        return packageMapper.selectPackage();
    }

    // 특정 패키지 조회
    @Override
    public PackageDto getPackageById(Integer pNum) {
        return packageMapper.selectPackageById(pNum); // selectPackageById 메소드 호출
    }

    // 패키지 수정
    @Override
    public void updatePackage(PackageDto packageDto) {
        packageMapper.updatePackage(packageDto);
    }

    // 패키지 삭제
    @Override
    public void deletePackage(Integer pNum) {
        packageMapper.deletePackage(pNum);
    }

    // 국가별 패키지 조회
    @Override
    public List<PackageDto> getPackagesByCountry(String pCountry) {
        return packageMapper.selectPackageByCountry(pCountry);
    }
}
