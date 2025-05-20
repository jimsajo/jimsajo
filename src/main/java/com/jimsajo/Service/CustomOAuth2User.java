package com.jimsajo.Service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.core.user.OAuth2User;

import com.jimsajo.Dto.memberDto;

public class CustomOAuth2User implements OAuth2User {

    private final memberDto member;
    private final Map<String, Object> attributes;

    public CustomOAuth2User(memberDto member, Map<String, Object> attributes) {
        this.member = member;
        this.attributes = attributes;
    }

    @Override
    public Map<String, Object> getAttributes() {
        return attributes;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of(new SimpleGrantedAuthority("ROLE_" + member.getmRole()));
    }

    @Override
    public String getName() {
        return member.getmId(); // 보통 username 또는 유저 ID 반환
    }

    public memberDto getMember() {
        return member;
    }
}
