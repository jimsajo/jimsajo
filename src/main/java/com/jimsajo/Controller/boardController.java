package com.jimsajo.Controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jimsajo.Dto.boardDto;
import com.jimsajo.Mapper.boardMapper;

import jakarta.servlet.http.HttpSession;

@Controller
public class boardController {

    @Autowired
    boardMapper mapper;

    // 공지사항 목록
    @RequestMapping("/board")
    public String list(Model model) throws Exception {
        List<boardDto> list = mapper.selectBoard();
        model.addAttribute("boards", list);
        return "board/board";
    }

    // 작성 폼
    @RequestMapping("/newBoard")
    public String form() {
        return "board/boardForm";
    }

    // 공지사항 저장
    @RequestMapping("/boardSave")
    public String saveBoard(boardDto dto, HttpSession session) throws Exception {
        Integer mNum = (Integer) session.getAttribute("mNum");
        if (mNum == null) {
            mNum = 1; // 테스트용 회원번호
            session.setAttribute("mNum", mNum);
        }
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
}
