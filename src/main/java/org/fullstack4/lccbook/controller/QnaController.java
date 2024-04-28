package org.fullstack4.lccbook.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.dto.*;
import org.fullstack4.lccbook.service.MemberServiceIf;
import org.fullstack4.lccbook.service.QnaServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Log4j2
@Controller
@RequestMapping("/qna")
@RequiredArgsConstructor
public class QnaController {
    private final QnaServiceIf qnaServiceIf;

    @GetMapping("/list")
    public void list(@Valid PageRequestDTO pageRequestDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes, Model model){
        if (bindingResult.hasErrors()){
            log.info("BbsController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

        PageResponseDTO<QnaDTO> responseDTO = qnaServiceIf.bbsListByPage(pageRequestDTO);
        log.info("responseDTO test"+responseDTO);
        model.addAttribute("responseDTO", responseDTO);
        if(responseDTO.getSearch_type()!=null) {
            for (String i : responseDTO.getSearch_type()) {
                if (i.equals("t")) {
                    model.addAttribute("search_typeflag_0", "checked");
                }
                if (i.equals("u")) {
                    model.addAttribute("search_typeflag_1", "checked");
                }
            }
        }

    }

    @GetMapping("/view")
    public String view(@RequestParam(name="idx", defaultValue = "0") int idx, Model model, HttpServletRequest request, RedirectAttributes redirectAttributes){
        HttpSession httpsSession = request.getSession();
        MemberDTO memberDTO = (MemberDTO) httpsSession.getAttribute("memberDTO");
        String loginId = memberDTO.getUser_id();
        QnaDTO qnaDTO = qnaServiceIf.view(idx);
        if(!loginId.equals(qnaDTO.getUser_id())){
            redirectAttributes.addFlashAttribute("errorAlert","<script> alert('본인글만 열람 가능합니다.') </script>");
            return "redirect:/qna/list";
        }
        model.addAttribute("qnaDTO",qnaDTO);
        return "/qna/view";
    }
    @GetMapping("/regist")
    public void registGET(){

    }

    @PostMapping("/regist")
    public String registPOST(@Valid QnaDTO qnaDTO, BindingResult bindingResult
            ,RedirectAttributes redirectAttributes){
        if(bindingResult.hasErrors()){
            redirectAttributes.addFlashAttribute("errors",bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("qnaDTO",qnaDTO);
            return "redirect:/qna/regist";
        }
        int result = qnaServiceIf.regist(qnaDTO);
        if(result > 0 ){
            return "redirect:/qna/list";
        }
        else{
            return "/qna/regist";
        }

    }
    @GetMapping("/modify")
    public String modifyGET(@RequestParam(name="idx", defaultValue = "0") int idx, Model model, HttpServletRequest request, RedirectAttributes redirectAttributes){
        HttpSession httpsSession = request.getSession();
        MemberDTO memberDTO = (MemberDTO) httpsSession.getAttribute("memberDTO");
        String loginId = memberDTO.getUser_id();
        QnaDTO qnaDTO = qnaServiceIf.view(idx);
        String YN = qnaDTO.getAnswer_yn();
        if(YN.equals("Y")){
            redirectAttributes.addFlashAttribute("errorAlert","<script> alert('답변이 달린 글은 수정이 불가합니다.') </script>");
            return "redirect:/qna/view?idx="+qnaDTO.getQna_idx();
        }
        model.addAttribute("qnaDTO",qnaDTO);
        if(!loginId.equals(qnaDTO.getUser_id())){
            redirectAttributes.addFlashAttribute("errorAlert","<script> alert('본인글만 수정 가능합니다.') </script>");
            return "redirect:/qna/list";
        }
        return "/qna/modify";
    }
    @PostMapping("/modify")
    public String modifyPOST(@Valid QnaDTO qnaDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes){
        String YN = qnaServiceIf.view(qnaDTO.getQna_idx()).getAnswer_yn();
        if(YN.equals("Y")){
            redirectAttributes.addFlashAttribute("errorAlert","<script> alert('답변이 달린 글은 수정이 불가합니다.') </script>");
            return "redirect:/qna/view?idx="+qnaDTO.getQna_idx();
        }

        if(bindingResult.hasErrors()){
            log.info("bindingResult Errors : " +qnaDTO);
            redirectAttributes.addFlashAttribute("errors",bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("bbsDTO",qnaDTO);
            redirectAttributes.addAttribute("idx",qnaDTO.getQna_idx());
            return "redirect:/qna/modify";
        }
        int result = qnaServiceIf.modify(qnaDTO);
        if(result > 0 ){
            return "redirect:/qna/view?idx="+qnaDTO.getQna_idx();
        }
        else{
            return "/qna/modify";
        }

    }
    @PostMapping("/delete")
    public String deletePOST(@RequestParam(name="idx", defaultValue = "0") int idx, RedirectAttributes redirectAttributes, HttpServletRequest request){
        String YN = qnaServiceIf.view(idx).getAnswer_yn();
        if(YN.equals("Y")){
            redirectAttributes.addFlashAttribute("errorAlert","<script> alert('답변이 달린 글은 삭제가 불가합니다.') </script>");
            return "redirect:/qna/view?idx="+idx;
        }
        HttpSession httpsSession = request.getSession();
        QnaDTO qnaDTO = qnaServiceIf.view(idx);
        MemberDTO memberDTO = (MemberDTO) httpsSession.getAttribute("memberDTO");
        String loginId = memberDTO.getUser_id();
        if(!loginId.equals(qnaDTO.getUser_id())){
            redirectAttributes.addFlashAttribute("errorAlert","<script> alert('본인글만 삭제 가능합니다.') </script>");
            return "redirect:/qna/list";
        }
        int result = qnaServiceIf.delete(idx);
        if(result > 0 ){
            return "redirect:/qna/list";
        }
        else{
            return "/qna/view?idx="+idx;
        }
    }
}
