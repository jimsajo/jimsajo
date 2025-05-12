package com.jimsajo.Service;

import java.util.ArrayList;
import java.util.List;

import com.jimsajo.Dto.PackageDto;

public interface PackageService {
    void registerPackage(PackageDto packageDto);
    ArrayList<PackageDto> selectPackage();
    public PackageDto selectPackageById(Integer pNum);
    void updatePackage(PackageDto dto) throws Exception;
    void deletePackage(Integer pNum) throws Exception;
    public List<PackageDto> selectPackageByCountry(String pCountry);
}
