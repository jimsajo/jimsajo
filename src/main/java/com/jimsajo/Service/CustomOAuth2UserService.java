package com.jimsajo.Service;

import java.util.Map;

import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.jimsajo.Dto.memberDto;
import com.jimsajo.Mapper.loginMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CustomOAuth2UserService extends DefaultOAuth2UserService {

    private final loginMapper loginMapper;

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        // 카카오에서 유저 정보 받아오기
        OAuth2User oAuth2User = super.loadUser(userRequest);
        Map<String, Object> kakaoAttributes = oAuth2User.getAttributes();

        // 사용자 정보 추출
        Map<String, Object> kakaoAccount = (Map<String, Object>) kakaoAttributes.get("kakao_account");
        Map<String, Object> profile = (Map<String, Object>) kakaoAccount.get("profile");

        String kakaoId = String.valueOf(kakaoAttributes.get("id")); // 숫자 → 문자열
        String nickname = (String) profile.get("nickname");

        // 소셜 로그인용 mId, socialType 설정 (중복 방지용 prefix 추천)
        String mId = "kakao_" + kakaoId;

        // DB에 해당 회원이 있는지 확인
        memberDto member = loginMapper.selectMemberById(mId);

        if (member == null) {
            // 회원이 없다면 새로 등록
            memberDto newMember = new memberDto();
            newMember.setmId(mId);
            newMember.setmName(nickname);
            newMember.setmRole("user"); // 기본 권한
            newMember.setSocialType("kakao");
            newMember.setSocialId(kakaoId);

            loginMapper.insertSocialMember(newMember);
            member = newMember;
        }

        // Spring Security에 사용자 정보를 전달할 수 있는 OAuth2User 리턴
        return new CustomOAuth2User(member, oAuth2User.getAttributes());
    }
}
