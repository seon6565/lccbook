package org.fullstack4.lccbook.controller.admin;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.dto.PageRequestDTO;
import org.fullstack4.lccbook.dto.PageResponseDTO;
import org.fullstack4.lccbook.dto.QnaDTO;
import org.fullstack4.lccbook.service.QnaServiceIf;
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

@Log4j2
@Controller
@RequestMapping("/admin/aqna")
@RequiredArgsConstructor
public class AqnaController {
    private final QnaServiceIf qnaServiceIf;
    private final CommonLoginCheck commonLoginCheck;

    @GetMapping("/list")
    public String list(@Valid PageRequestDTO pageRequestDTO, BindingResult bindingResult, HttpServletRequest request, RedirectAttributes redirectAttributes, Model model){
        if (bindingResult.hasErrors()){
            log.info("BbsController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
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
        return "/admin/aqna/list";
    }

    @GetMapping("/view")
    public String view(@RequestParam(name="idx", defaultValue = "0") int idx, Model model, HttpServletRequest request, RedirectAttributes redirectAttributes){
        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
        }
        QnaDTO qnaDTO = qnaServiceIf.view(idx);
        model.addAttribute("qnaDTO",qnaDTO);
        return "/admin/aqna/view";
    }
    @GetMapping("/regist")
    public String registGET(@RequestParam(name="idx", defaultValue = "0") int idx, Model model, HttpServletRequest request, RedirectAttributes redirectAttributes){
        QnaDTO qnaDTO = qnaServiceIf.view(idx);
        model.addAttribute("qnaDTO",qnaDTO);
        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
        }
        return "admin/aqna/regist";
    }

    @PostMapping("/regist")
    public String registPOST(QnaDTO qnaDTO, BindingResult bindingResult
            ,HttpServletRequest request,RedirectAttributes redirectAttributes){
        if(bindingResult.hasErrors()){
            redirectAttributes.addFlashAttribute("errors",bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("qnaDTO",qnaDTO);
            return "redirect:/admin/aqna/regist";
        }
        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
        }
        int result = qnaServiceIf.regist_answer(qnaDTO);
        if(result > 0 ){
            return "redirect:/admin/aqna/view?idx="+qnaDTO.getQna_idx();
        }
        else{
            return "/admin/aqna/list";
        }

    }
    @GetMapping("/delete")
    public String deletePOST(@RequestParam(name="idx", defaultValue = "0") int idx, RedirectAttributes redirectAttributes, HttpServletRequest request){
        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
        }
        int result = qnaServiceIf.delete(idx);
        if(result > 0 ){
            return "redirect:/admin/aqna/list";
        }
        else{
            return "/admin/aqna/view?idx="+idx;
        }
    }

    @PostMapping("/deletecheck")
    public String deleteCheckPOST(@RequestParam(name="qna_idx", defaultValue = "0") int[] qna_idx, RedirectAttributes redirectAttributes, HttpServletRequest request){
        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
        }
        log.info("qna_idx = "+qna_idx);
        for(int i : qna_idx) {
            qnaServiceIf.delete(i);
        }
            return "redirect:/admin/aqna/list";
    }

    @PostMapping("/deleteanswer")
    public String deleteAnswerPOST(@RequestParam(name="idx", defaultValue = "0") int idx, RedirectAttributes redirectAttributes, HttpServletRequest request){
        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
        }
        int result = qnaServiceIf.delete_answer(idx);
        if(result > 0 ){
            return "redirect:/admin/aqna/view?idx="+idx;
        }
        else{
            return "/admin/aqna/view?idx="+idx;
        }
    }

}
