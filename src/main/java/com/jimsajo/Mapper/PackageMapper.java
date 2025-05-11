package com.jimsajo.Mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jimsajo.Dto.PackageDto;

@Mapper
public interface PackageMapper {
    void insertPackage(PackageDto packageDto);
    ArrayList<PackageDto> selectPackage();
	PackageDto selectPackageById(Integer pNum);
    void updatePackage(PackageDto dto) throws Exception;
    void deletePackage(Integer pNum) throws Exception;
    List<PackageDto> selectPackageByCountry(String pCountry);
}
