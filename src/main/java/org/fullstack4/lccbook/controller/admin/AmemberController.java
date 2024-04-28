package org.fullstack4.lccbook.controller.admin;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.dto.MemberDTO;
import org.fullstack4.lccbook.dto.PageRequestDTO;
import org.fullstack4.lccbook.dto.PageResponseDTO;
import org.fullstack4.lccbook.service.MemberServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
@Log4j2
@Controller
@RequestMapping("/admin/amember")
@RequiredArgsConstructor
public class AmemberController {
    private final MemberServiceIf memberServiceIf;
    @GetMapping("/list")
    public String list(@Valid PageRequestDTO pageRequestDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes, Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null){
            redirectAttributes.addFlashAttribute("errorAlert","<script> alert('해당페이지는 관리자 로그인이 필요합니다.') </script>");
            return "redirect:/admin/login";
        }
        if(bindingResult.hasErrors()) {
            log.info("BbsController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

        PageResponseDTO<MemberDTO> responseDTO = memberServiceIf.bbsListByPage(pageRequestDTO);
        model.addAttribute("responseDTO", responseDTO);
        if (responseDTO.getSearch_type() != null) {
            for (String i : responseDTO.getSearch_type()) {
                if (i.equals("t")) {
                    model.addAttribute("search_typeflag_0", "checked");
                }
                if (i.equals("u")) {
                    model.addAttribute("search_typeflag_1", "checked");
                }
            }
        }
        return "/admin/amember/list";
    }
}
