package com.jimsajo.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jimsajo.Dto.PackageDto;
import com.jimsajo.Mapper.PackageMapper;

@Service
public class PackageServiceImpl implements PackageService {
    @Autowired
    private PackageMapper packageMapper;

    @Override
    public void registerPackage(PackageDto packageDto) {
        packageDto.setpCreate(LocalDateTime.now()); // 작성 시간 설정
        packageMapper.insertPackage(packageDto);
    }
    @Override
    public ArrayList<PackageDto> selectPackage(){
    	ArrayList<PackageDto> list = packageMapper.selectPackage();
    	
    	return list;
    }
    @Override
    public PackageDto selectPackageById(Integer pNum) {
        return packageMapper.selectPackageById(pNum);
    }
	@Override
	public void updatePackage(PackageDto dto) throws Exception {
		packageMapper.updatePackage(dto);
		
	}
	@Override
	public void deletePackage(Integer pNum) throws Exception{
		packageMapper.deletePackage(pNum);
		
	}
	@Override
	public List<PackageDto> selectPackageByCountry(String pCountry) {
	    return packageMapper.selectPackageByCountry(pCountry);
	}
}
