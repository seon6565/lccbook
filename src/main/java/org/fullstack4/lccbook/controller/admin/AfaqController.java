package org.fullstack4.lccbook.controller.admin;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.dto.FaqDTO;
import org.fullstack4.lccbook.dto.PageRequestDTO;
import org.fullstack4.lccbook.dto.PageResponseDTO;
import org.fullstack4.lccbook.service.FaqServiceIf;
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
@RequestMapping("/admin/afaq")
@RequiredArgsConstructor
public class AfaqController {
    private final FaqServiceIf faqService;
    private final CommonLoginCheck commonLoginCheck;

    @GetMapping(value = "/list")
    public String list(@Valid PageRequestDTO pageRequestDTO
            , BindingResult bindingResult
            , RedirectAttributes redirectAttributes
            , Model model
            , HttpServletRequest request) {

        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
        }

        if (bindingResult.hasErrors()) {
            log.info("BookController >> list errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
        PageResponseDTO<FaqDTO> responseDTO = faqService.bbsListByPage(pageRequestDTO);
        model.addAttribute("responseDTO", responseDTO);

        return "/admin/afaq/list";
    }

    @GetMapping(value = "/view")
    public String afaqView(Model model,
                         @RequestParam(name="faq_idx", defaultValue = "0") int faq_idx, HttpServletRequest request, RedirectAttributes redirectAttributes){
        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
        }
        FaqDTO faqDTO = faqService.view(faq_idx);
        model.addAttribute("faq",faqDTO);

        return "/admin/afaq/view";
    }

    @GetMapping(value = "/regist")
    public String afaqRegistGet(HttpServletRequest request, RedirectAttributes redirectAttributes){
        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
        }
        return "/admin/afaq/regist";
    }

    @PostMapping(value = "/regist")
    public String afaqRegistPost(FaqDTO faqDTO,
                                 RedirectAttributes redirectAttributes, HttpServletRequest request){
        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
        }

        int result = faqService.regist(faqDTO);
        if(result > 0) {
            return "redirect:/admin/afaq/list";
        } else {
            return "/admin/afaq/regist";
        }
    }

    @GetMapping(value = "/modify")
    public String afaqModifyGet(Model model,
                              @RequestParam(name="faq_idx", defaultValue = "0") int faq_idx, HttpServletRequest request, RedirectAttributes redirectAttributes){
        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
        }
        FaqDTO faqDTO = faqService.view(faq_idx);
        model.addAttribute("faq",faqDTO);

        return "/admin/afaq/modify";
    }

    @PostMapping(value = "/modify")
    public String afaqModifyPost(FaqDTO faqDTO,
                                 RedirectAttributes redirectAttributes,HttpServletRequest request){
        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
        }

        int result = faqService.modify(faqDTO);
        if(result > 0) {
            return "redirect:/admin/afaq/view?faq_idx=" + faqDTO.getFaq_idx();
        } else {
            return "/admin/afaq/modify?faq_idx=" + faqDTO.getFaq_idx();
        }
    }

    @PostMapping("/delete")
    public String afaqDeletePost(@RequestParam(name="faq_idx", defaultValue = "0") int faq_idx, HttpServletRequest request, RedirectAttributes redirectAttributes){
        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
        }
        int result = faqService.delete(faq_idx);
        if(result > 0) {
            return "redirect:/admin/afaq/list";
        } else {
            return "/admin/afaq/view?faq_idx="+faq_idx;
        }
    }

    @PostMapping("/deleteCheck")
    public String deleteCheck(@RequestParam(name="faq_idx", defaultValue = "0") int[] faq_idx, HttpServletRequest request, RedirectAttributes redirectAttributes){
        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
        }
        for(int i : faq_idx) {
            faqService.delete(i);
        }
        return "redirect:/admin/afaq/list";
    }
}
