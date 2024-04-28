package org.fullstack4.lccbook.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.dto.*;
import org.fullstack4.lccbook.service.MemberServiceIf;
import org.fullstack4.lccbook.service.QnaServiceIf;
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
import java.util.List;

@Log4j2
@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {
    private final MemberServiceIf memberServiceIf;
    private final QnaServiceIf qnaServiceIf;
    @GetMapping("/view")
    public void view(@RequestParam(name="user_id", defaultValue = "") String user_id, Model model){
        log.info("============================");
        log.info("MemberController view");
        log.info("user_id : " +user_id);
        MemberDTO memberDTO = memberServiceIf.view(user_id);
        List<QnaDTO> qnaUserlist = qnaServiceIf.listUser(user_id);
        model.addAttribute("qnaUserlist", qnaUserlist);
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

    @GetMapping("/joinagree") public void joinagreeGET(){
        log.info("============================");
        log.info("MemberController joinagreeGET");
        log.info("============================");
    }

    @PostMapping("/joinagree")
    public String joinagreePOST(@Valid JoinagreeDTO joinagreeDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes){

        if(bindingResult.hasErrors()){
            log.info("bindingResult Errors : " +joinagreeDTO);
            redirectAttributes.addFlashAttribute("errors",bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("memberDTO",joinagreeDTO);
            return "redirect:/member/joinagree";
        }
            return "redirect:/member/join";
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
            return "redirect:/login/logout";
        }
        else{
            return "/member/view?user_id="+user_id;
        }
    }
    @GetMapping("/qna")
    public void qnalist(String user_id, RedirectAttributes redirectAttributes, Model model){
        List<QnaDTO> qnaUserlist = qnaServiceIf.listUser(user_id);
        model.addAttribute("qnaUserlist", qnaUserlist);
    }
}
