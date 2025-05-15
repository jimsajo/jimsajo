package com.jimsajo.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jimsajo.Dto.memberDto;

import jakarta.servlet.http.HttpSession;

@Controller
public class MainPageController {

	@RequestMapping("/")
	public String MainPage() {
		return "index";
	}

}