package org.fullstack4.lccbook.controller.admin;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.dto.AdminDTO;
import org.fullstack4.lccbook.service.AdminServiceIf;
import org.fullstack4.lccbook.util.CommonLoginCheck;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Log4j2
@Controller
@RequestMapping("/admin/adminmember")
@RequiredArgsConstructor
public class AdminMemberController {
    private final AdminServiceIf adminServiceIf;
    private final CommonLoginCheck commonLoginCheck;
    @GetMapping("/list")
    public String list(RedirectAttributes redirectAttributes, Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null){
            redirectAttributes.addFlashAttribute("errorAlert","<script> alert('해당페이지는 관리자 로그인이 필요합니다.') </script>");
            return "redirect:/admin/login";
        }
        List<AdminDTO> adminDTOList = adminServiceIf.list();
        model.addAttribute("adminDTOList", adminDTOList);
        return "/admin/adminmember/list";
    }

    @GetMapping("/regist")
    public String registGET(Model model, HttpServletRequest request, RedirectAttributes redirectAttributes){
        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
        }
        return "/admin/adminmember/regist";
    }
    @PostMapping("/regist")
    public String registPOST(@Valid AdminDTO adminDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes, HttpServletRequest request){
        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
        }
        if(bindingResult.hasErrors()){
            redirectAttributes.addFlashAttribute("errors",bindingResult.getAllErrors());
            return "redirect:/admin/adminmember/regist";
        }
        int result = adminServiceIf.regist(adminDTO);
        return "redirect:/admin/adminmember/list";

    }


    @PostMapping("/deletecheck")
    public String deleteCheckPOST(@RequestParam(name="admin_id", defaultValue = "0") String[] admin_id, RedirectAttributes redirectAttributes, HttpServletRequest request){
        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
        }
        log.info("qna_idx = "+admin_id);
        for(String i : admin_id) {
            adminServiceIf.delete(i);
        }
        return "redirect:/admin/adminmember/list";
    }
}
