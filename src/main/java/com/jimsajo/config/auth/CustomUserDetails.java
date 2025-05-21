package com.jimsajo.config.auth;

import java.util.Collection;
import java.util.Collections;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.jimsajo.Dto.memberDto;

public class CustomUserDetails implements UserDetails {
    
    private static final long serialVersionUID = 1L; // 🚨 경고 없애기용

    private final memberDto member;

    public CustomUserDetails(memberDto member) {
        this.member = member;
    }

    public memberDto getMember() {
        return member;
    }

    // 🔐 필수 메서드 구현
    @Override
    public String getUsername() {
        return member.getmId();
    }

    @Override
    public String getPassword() {
        return member.getmPasswd();
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        // 예: ROLE_user 또는 ROLE_admin
        return Collections.singleton(() -> "ROLE_" + member.getmRole());
    }

    @Override
    public boolean isAccountNonExpired() {
        return true; // 계정 만료 여부
    }

    @Override
    public boolean isAccountNonLocked() {
        return true; // 계정 잠김 여부
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true; // 비밀번호 만료 여부
    }

    @Override
    public boolean isEnabled() {
        return true; // 계정 활성화 여부
    }
}
