package com.jimsajo.config.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.jimsajo.Dto.memberDto;
import com.jimsajo.Mapper.loginMapper;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private loginMapper mapper;
 
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        memberDto member = mapper.selectMemberById(username);
        if (member == null) {
            throw new UsernameNotFoundException("존재하지 않는 사용자입니다: " + username);
        }
        
        memberDto mem = mapper.selectMemberById(username);
        System.out.println("💡 SELECT 결과: " + mem);
        System.out.println("💡 mId: " + mem.getmId());
        System.out.println("💡 mPasswd: " + mem.getmPasswd());
        System.out.println("💡 mRole: " + mem.getmRole());

        return User.builder()
                .username(member.getmId())
                .password(member.getmPasswd()) // 암호화된 비밀번호
                .roles(member.getmRole())      // "user", "admin"
                .build();
    }
}
