package com.jimsajo.Service;

import java.time.LocalDate;
import java.util.Map;

import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.jimsajo.Dto.memberDto;
import com.jimsajo.Mapper.loginMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
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

        // 소셜 로그인용 mId, socialType 설정
        String mId = "kakao_" + kakaoId;

        // DB에 해당 회원이 있는지 확인
        memberDto member = loginMapper.selectMemberById(mId);

        if (member == null) {
            memberDto newMember = new memberDto();
            newMember.setmId(mId);
            newMember.setmName(nickname);
            newMember.setmRole("user");
            newMember.setSocialType("kakao");
            newMember.setSocialId(kakaoId);

            newMember.setmTel("미입력");
            newMember.setmBirth(LocalDate.now());

            loginMapper.insertSocialMember(newMember);
            member = loginMapper.selectMemberById(mId); // 다시 조회
        }

        // ✅ 세션에 로그인 유저 저장
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpServletRequest request = attr.getRequest();
        HttpSession session = request.getSession();
        session.setAttribute("loginUser", member);

        System.out.println("✅ 카카오 로그인 완료 - mName: " + member.getmName());

        return new CustomOAuth2User(member, oAuth2User.getAttributes());
    }
}
