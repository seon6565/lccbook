package org.fullstack4.lccbook.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.dto.AdminDTO;
import org.fullstack4.lccbook.dto.LoginDTO;
import org.fullstack4.lccbook.dto.MemberDTO;
import org.fullstack4.lccbook.service.AdminServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Log4j2
@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {
    private final AdminServiceIf adminServiceIf;
    @RequestMapping(value = "/main",method = RequestMethod.GET)
    public String adminMainGET(HttpServletRequest request, RedirectAttributes redirectAttributes){
        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null){
            redirectAttributes.addFlashAttribute("errorAlert","<script> alert('해당페이지는 관리자 로그인이 필요합니다.') </script>");
            return "redirect:/admin/login";
        }
        else{
            return "/admin/main";
        }
    }
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public void adminLoginGET(){
    }
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String adminLoginPOST(AdminDTO adminDTO,
                                 HttpServletRequest req,
                                 RedirectAttributes redirectAttributes){
        AdminDTO resultadminDTO = adminServiceIf.adminLogin(adminDTO);
        if(resultadminDTO !=null){
            HttpSession session = req.getSession();
            session.setAttribute("adminDTO",adminDTO);
                return "redirect:/admin/main";
        }
        redirectAttributes.addFlashAttribute("errors","사용자 정보가 일치하지 않습니다.");
        redirectAttributes.addFlashAttribute("errorAlert","<script> alert('정확한 관리자 계정 정보를 입력하세요.') </script>");
        return "redirect:/admin/login";
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest req, HttpServletResponse response){
        HttpSession session = req.getSession(false);
        if(session!=null) {
            session.invalidate();
        }
        return "redirect:/";
    }
}
