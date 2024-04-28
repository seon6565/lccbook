package org.fullstack4.lccbook.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.dto.FaqDTO;
import org.fullstack4.lccbook.dto.NoticeDTO;
import org.fullstack4.lccbook.service.FaqServiceIf;
import org.fullstack4.lccbook.service.NoticeServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Log4j2
@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {

    private final FaqServiceIf faqService;
    private final NoticeServiceIf noticeService;

    @GetMapping(value ="/afaq/list")
    public void afaqList(Model model){
        log.info("==========");
        log.info("AdminController >> afaqList()");
        List<FaqDTO> faqDTOList = faqService.list();
        log.info("faqDTOList :" + faqDTOList.toString());

        model.addAttribute("faqList", faqDTOList);
        log.info("==========");
    }

    @GetMapping(value = "/afaq/view")
    public void afaqView(Model model,
                            @RequestParam(name="faq_idx", defaultValue = "0") int faq_idx){
        FaqDTO faqDTO = faqService.view(faq_idx);
        model.addAttribute("faq",faqDTO);
    }

    @GetMapping(value = "/afaq/regist")
    public void afaqRegistGet(){
        log.info("==========");
        log.info("AdminController >> afaqRegistGet()");
        log.info("==========");
    }

    @PostMapping(value = "/afaq/regist")
    public String afaqRegistPost(FaqDTO faqDTO,
                                    RedirectAttributes redirectAttributes){

        log.info("==========");
        log.info("AdminController >> afaqRegistPost()");

        int result = faqService.regist(faqDTO);
        if(result > 0) {
            return "redirect:/admin/afaq/list";
        } else {
            return "/admin/afaq/regist";
        }
    }

    @GetMapping(value = "/afaq/modify")
    public void afaqModifyGet(Model model,
                                 @RequestParam(name="faq_idx", defaultValue = "0") int faq_idx){
        FaqDTO faqDTO = faqService.view(faq_idx);
        model.addAttribute("faq",faqDTO);
    }

    @PostMapping(value = "/afaq/modify")
    public String afaqModifyPost(FaqDTO faqDTO,
                                    RedirectAttributes redirectAttributes){

        log.info("==========");
        log.info("AdminController >> afaqModifyGet()");

        int result = faqService.modify(faqDTO);
        if(result > 0) {
            return "redirect:/admin/afaq/view?faq_idx=" + faqDTO.getFaq_idx();
        } else {
            return "/admin/afaq/modify?faq_idx=" + faqDTO.getFaq_idx();
        }
    }

    @PostMapping("/afaq/delete")
    public String afaqDeletePost(@RequestParam(name="faq_idx", defaultValue = "0") int faq_idx){
        log.info("==========");
        log.info("AdminController >> afaqDeletePost()");
        int result = noticeService.delete(faq_idx);
        if(result > 0) {
            return "redirect:/admin/afaq/list";
        } else {
            return "/admin/afaq/view?faq_idx="+faq_idx;
        }
    }

    @GetMapping(value ="/anotice/list")
    public void anoticeList(Model model){
        List<NoticeDTO> noticeDTOList = noticeService.list();
        model.addAttribute("noticeList", noticeDTOList);
    }

    @GetMapping(value = "/anotice/view")
    public void anoticeView(Model model,
                            @RequestParam(name="notice_idx", defaultValue = "0") int notice_idx){
        NoticeDTO noticeDTO = noticeService.view(notice_idx);
        model.addAttribute("notice",noticeDTO);
    }

    @GetMapping(value = "/anotice/regist")
    public void anoticeRegistGet(){
        log.info("==========");
        log.info("AdminController >> anoticeRegistGet()");
        log.info("==========");
    }

    @PostMapping(value = "/anotice/regist")
    public String anoticeRegistPost(NoticeDTO noticeDTO,
                                  RedirectAttributes redirectAttributes){

        log.info("==========");
        log.info("AdminController >> anoticeRegistPost()");

        int result = noticeService.regist(noticeDTO);
        if(result > 0) {
            return "redirect:/admin/anotice/list";
        } else {
            return "/admin/anotice/regist";
        }
    }

    @GetMapping(value = "/anotice/modify")
    public void anoticeModifyGet(Model model,
                    @RequestParam(name="notice_idx", defaultValue = "0") int notice_idx){
        NoticeDTO noticeDTO = noticeService.view(notice_idx);
        model.addAttribute("notice",noticeDTO);
    }

    @PostMapping(value = "/anotice/modify")
    public String anoticeModifyPost(NoticeDTO noticeDTO,
                                    RedirectAttributes redirectAttributes){

        log.info("==========");
        log.info("AdminController >> anoticeModifyPost()");

        int result = noticeService.modify(noticeDTO);
        if(result > 0) {
            return "redirect:/admin/anotice/view?notice_idx=" + noticeDTO.getNotice_idx();
        } else {
            return "/admin/anotice/modify?notice_idx=" + noticeDTO.getNotice_idx();
        }
    }

    @PostMapping("/anotice/delete")
    public String anoticeDeletePost(@RequestParam(name="notice_idx", defaultValue = "0") int notice_idx){
        log.info("==========");
        log.info("AdminController >> anoticeDeletePost()");
        int result = noticeService.delete(notice_idx);
        if(result > 0) {
            return "redirect:/admin/anotice/list";
        } else {
            return "/admin/anotice/view?notice_idx="+notice_idx;
        }
    }


    @GetMapping(value ="/adelivery/list")
    public void adeliveryList(){

    }

    @GetMapping(value ="/amember/list")
    public void amemberList(){

    }



}
