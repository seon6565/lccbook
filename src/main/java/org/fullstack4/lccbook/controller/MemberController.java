package org.fullstack4.lccbook.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.dto.MemberDTO;
import org.fullstack4.lccbook.service.MemberServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;

@Log4j2
@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {
    private final MemberServiceIf memberServiceIf;
    @GetMapping("/view")
    public void view(@RequestParam(name="user_id", defaultValue = "") String user_id, Model model){
        log.info("============================");
        log.info("MemberController view");
        log.info("user_id : " +user_id);
        MemberDTO memberDTO = memberServiceIf.view(user_id);
        log.info("memberDTO : " +memberDTO);
        log.info("============================");
        model.addAttribute("memberDTO",memberDTO);
    }
    @GetMapping("/join")
    public void joinGET(){
        log.info("============================");
        log.info("MemberController joinGET");
        log.info("============================");
    }
    @PostMapping("/join")
    public String joinPOST(@Valid MemberDTO memberDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes){
        log.info("============================");
        log.info("MemberController joinPOST");
        log.info("MemberDTO : " +memberDTO);
        log.info("============================");

        if(bindingResult.hasErrors()){
            log.info("bindingResult Errors : " +memberDTO);
            redirectAttributes.addFlashAttribute("errors",bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("memberDTO",memberDTO);
            return "redirect:/member/join";
        }


        int result = memberServiceIf.join(memberDTO);
        if(result > 0 ){
            return "redirect:/bbs/list";
        }
        else{
            return "/member/join";
        }
    }
    @GetMapping("/duplecheck")
    public void duplecheckGET(HttpServletRequest request, HttpServletResponse response){
        log.info("============================");
        log.info("MemberController duplecheckGET");
        log.info("============================");
        String user_id = request.getParameter("user_id");
        int count = 0;
        if(memberServiceIf.idCheck(user_id) >0){
            count = memberServiceIf.idCheck(user_id);
        }
        if(count > 0) {
            try {
                response.getWriter().print("N");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }

        }else {
            try {
                response.getWriter().print("Y");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }
    @GetMapping("/modify")
    public void modifyGET(@RequestParam(name="user_id", defaultValue = "") String user_id, Model model){
        log.info("============================");
        log.info("MemberController modifyGET");
        log.info("============================");
        MemberDTO memberDTO = memberServiceIf.view(user_id);
        model.addAttribute("memberDTO",memberDTO);
    }
    @PostMapping("/modify")
    public String modifyPOST(MemberDTO memberDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes){
        log.info("============================");
        log.info("MemberController modifyPOST");
        log.info("============================");

        if(bindingResult.hasErrors()){
            log.info("bindingResult Errors : " +memberDTO);
            redirectAttributes.addFlashAttribute("errors",bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("memberDTO",memberDTO);
            redirectAttributes.addAttribute("user_id",memberDTO.getUser_id());
            return "redirect:/member/modify";
        }
        int result = memberServiceIf.modify(memberDTO);
        if(result > 0 ){
            return "redirect:/member/view?user_id="+memberDTO.getUser_id();
        }
        else{
            return "/member/modify";
        }
    }
    @PostMapping("/delete")
    public String deletePOST(String user_id, HttpServletRequest request){
        log.info("============================");
        log.info("MemberController deletePOST");
        log.info("============================");
        int result = memberServiceIf.delete(user_id);
        if(result > 0 ){
            request.getSession().invalidate();
            return "redirect:/bbs/list";
        }
        else{
            return "/member/view?user_id="+user_id;
        }
    }
}
