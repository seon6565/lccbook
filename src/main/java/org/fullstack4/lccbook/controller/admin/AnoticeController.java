package org.fullstack4.lccbook.controller.admin;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.dto.FaqDTO;
import org.fullstack4.lccbook.dto.NoticeDTO;
import org.fullstack4.lccbook.dto.PageRequestDTO;
import org.fullstack4.lccbook.dto.PageResponseDTO;
import org.fullstack4.lccbook.service.NoticeServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;


@Log4j2
@Controller
@RequestMapping("/admin/anotice")
@RequiredArgsConstructor
public class AnoticeController {
    private final NoticeServiceIf noticeService;

//    @GetMapping(value ="/list")
//    public void anoticeList(Model model){
//        List<NoticeDTO> noticeDTOList = noticeService.list();
//        model.addAttribute("noticeList", noticeDTOList);
//    }

    @GetMapping(value = "/list")
    public void list(@Valid PageRequestDTO pageRequestDTO
            , BindingResult bindingResult
            , RedirectAttributes redirectAttributes
            , Model model) {
        log.info("==========");
        log.info("AnoticeController >> list() START");
        log.info("pageRequestDTO : " + pageRequestDTO.toString());

        if (bindingResult.hasErrors()) {
            log.info("BookController >> list errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
        PageResponseDTO<NoticeDTO> responseDTO = noticeService.bbsListByPage(pageRequestDTO);
        model.addAttribute("responseDTO", responseDTO);
    }


    @GetMapping(value = "/view")
    public void anoticeView(Model model,
                            @RequestParam(name="notice_idx", defaultValue = "0") int notice_idx){
        NoticeDTO noticeDTO = noticeService.view(notice_idx);
        model.addAttribute("notice",noticeDTO);
    }

    @GetMapping(value = "/regist")
    public void anoticeRegistGet(){
        log.info("==========");
        log.info("AdminController >> anoticeRegistGet()");
        log.info("==========");
    }

    @PostMapping(value = "/regist")
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

    @GetMapping(value = "/modify")
    public void anoticeModifyGet(Model model,
                                 @RequestParam(name="notice_idx", defaultValue = "0") int notice_idx){
        NoticeDTO noticeDTO = noticeService.view(notice_idx);
        model.addAttribute("notice",noticeDTO);
    }

    @PostMapping(value = "/modify")
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

    @PostMapping("/delete")
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
}
