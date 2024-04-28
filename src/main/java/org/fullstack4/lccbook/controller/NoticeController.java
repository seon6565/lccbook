package org.fullstack4.lccbook.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.dto.*;
import org.fullstack4.lccbook.service.MemberServiceIf;
import org.fullstack4.lccbook.service.NoticeServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;

@Log4j2
@Controller
@RequestMapping("/notice")
@RequiredArgsConstructor
public class NoticeController {
    private final NoticeServiceIf noticeServiceIf;

    @GetMapping("/view")
    public void view(@RequestParam(name="idx", defaultValue = "0") int idx, Model model){
        NoticeDTO noticeDTO = noticeServiceIf.view(idx);
        model.addAttribute("noticeDTO",noticeDTO);
    }

    @GetMapping("/list")
    public void list(@Valid PageRequestDTO pageRequestDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes, Model model){

        if (bindingResult.hasErrors()){
            log.info("BbsController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

        PageResponseDTO<NoticeDTO> responseDTO = noticeServiceIf.bbsListByPage(pageRequestDTO);
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
