package com.jimsajo.Controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jimsajo.Dto.boardDto;
import com.jimsajo.Dto.memberDto;
import com.jimsajo.Mapper.boardMapper;
import com.jimsajo.Mapper.memberMapper;

@Controller
public class boardController {

    @Autowired
    boardMapper mapper;
	@Autowired
	memberMapper mMapper;

    // 공지사항 목록
    @RequestMapping("/board")
    public String list(Model model) throws Exception {
        List<boardDto> list = mapper.selectBoard();
        model.addAttribute("boards", list);
        return "board/board";
    }
    @RequestMapping("/newBoard")
    public String newBoard(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        // 로그인은 했지만 관리자 권한이 아님
        boolean isAdmin = auth.getAuthorities().stream()
            .map(GrantedAuthority::getAuthority)
            .noneMatch(role -> role.equals("ROLE_admin"));

        if (isAdmin) {
            model.addAttribute("errorMessage", "접근 권한이 없습니다.");
            return "error/accessDeniedBoard";
        }

        // 관리자일 경우 접근 허용
        return "board/boardForm";
    }



    @RequestMapping("/boardSave")
    public String saveBoard(boardDto dto) throws Exception {

        // SecurityContext에서 인증 정보 가져오기
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName(); // 로그인한 사용자 ID
        String role = auth.getAuthorities().iterator().next().getAuthority(); // 

        if (!role.equals("ROLE_admin")) {
            return "redirect:/accessDenied";
        }

        // DB에서 사용자 mNum을 조회
        memberDto member = mMapper.selectMemberById(username); // 이미 정의돼 있다고 가정
        Integer mNum = member.getmNum();

        dto.setmNum(mNum);
        dto.setbTime(LocalDate.now());
        dto.setbCnt(0);
        mapper.insertBoard(dto);

        return "redirect:/board";
    }


    // 상세 보기
    @RequestMapping("/board/{bNum}/detail")
    public String detailBoard(@PathVariable int bNum, Model model) throws Exception{
        mapper.updateCnt(bNum); // 조회수 증가
        boardDto board = mapper.selectBoardById(bNum);
        model.addAttribute("board", board);
        return "board/boardDetail";
    }

    // 수정 폼
    @RequestMapping("/board/{bNum}/update")
    public String updateBoard(@PathVariable int bNum, Model model) throws Exception {
        boardDto board = mapper.selectBoardById(bNum);
        model.addAttribute("board", board);
        return "board/boardUpdate";
    }

    // 수정처리
    @RequestMapping("/boardUpdate")
    public String updateBoard(boardDto dto) throws Exception {
        dto.setbTime(LocalDate.now());
        mapper.updateBoard(dto);
        return "redirect:/board/" + dto.getbNum() + "/detail";
    }

    // 삭제하기
    @RequestMapping("board/{bNum}/delete")
    public String deleteBoard(@PathVariable int bNum) throws Exception{
        mapper.deleteBoard(bNum);
        return "redirect:/board";
    }
    //공지사항 접근권한 거부 페이지
    @RequestMapping("/accessDeniedBoard")
    public String accessDenied(Model model) {
        model.addAttribute("errorMessage", "접근 권한이 없습니다.");
        return "board/accessDeniedBoard";
    }
}
