package org.fullstack4.lccbook.controller.admin;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.dto.BookDTO;
import org.fullstack4.lccbook.dto.FaqDTO;
import org.fullstack4.lccbook.dto.PageRequestDTO;
import org.fullstack4.lccbook.dto.PageResponseDTO;
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

import javax.validation.Valid;
import java.util.List;

@Log4j2
@Controller
@RequestMapping("/admin/afaq")
@RequiredArgsConstructor
public class AfaqController {
    private final FaqServiceIf faqService;


//    @GetMapping(value ="/list")
//    public void afaqList(Model model){
//        log.info("==========");
//        log.info("AdminController >> afaqList()");
//        List<FaqDTO> faqDTOList = faqService.list();
//        log.info("faqDTOList :" + faqDTOList.toString());
//
//        model.addAttribute("faqList", faqDTOList);
//        log.info("==========");
//    }

    @GetMapping(value = "/list")
    public void list(@Valid PageRequestDTO pageRequestDTO
            , BindingResult bindingResult
            , RedirectAttributes redirectAttributes
            , Model model) {
        log.info("==========");
        log.info("BookController >> list() START");
        log.info("pageRequestDTO : " + pageRequestDTO.toString());

        if (bindingResult.hasErrors()) {
            log.info("BookController >> list errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
        PageResponseDTO<FaqDTO> responseDTO = faqService.bbsListByPage(pageRequestDTO);
        model.addAttribute("responseDTO", responseDTO);

    }

    @GetMapping(value = "/view")
    public void afaqView(Model model,
                         @RequestParam(name="faq_idx", defaultValue = "0") int faq_idx){
        FaqDTO faqDTO = faqService.view(faq_idx);
        model.addAttribute("faq",faqDTO);
    }

    @GetMapping(value = "/regist")
    public void afaqRegistGet(){
        log.info("==========");
        log.info("AdminController >> afaqRegistGet()");
        log.info("==========");
    }

    @PostMapping(value = "/regist")
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

    @GetMapping(value = "/modify")
    public void afaqModifyGet(Model model,
                              @RequestParam(name="faq_idx", defaultValue = "0") int faq_idx){
        FaqDTO faqDTO = faqService.view(faq_idx);
        model.addAttribute("faq",faqDTO);
    }

    @PostMapping(value = "/modify")
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

    @PostMapping("/delete")
    public String afaqDeletePost(@RequestParam(name="faq_idx", defaultValue = "0") int faq_idx){
        log.info("==========");
        log.info("AdminController >> afaqDeletePost()");
        int result = faqService.delete(faq_idx);
        if(result > 0) {
            return "redirect:/admin/afaq/list";
        } else {
            return "/admin/afaq/view?faq_idx="+faq_idx;
        }
    }
}
