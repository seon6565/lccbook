package org.fullstack4.lccbook.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.dto.FaqDTO;
import org.fullstack4.lccbook.dto.PageRequestDTO;
import org.fullstack4.lccbook.dto.PageResponseDTO;
import org.fullstack4.lccbook.service.FaqServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Log4j2
@Controller
@RequestMapping("/faq")
@RequiredArgsConstructor
public class FaqController {
    private final FaqServiceIf faqServiceIf;


    @GetMapping("/list")
    public void list(@Valid PageRequestDTO pageRequestDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes, Model model){

        if (bindingResult.hasErrors()){
            log.info("BbsController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

        PageResponseDTO<FaqDTO> responseDTO = faqServiceIf.bbsListByPage(pageRequestDTO);
        log.info(responseDTO);
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
}
