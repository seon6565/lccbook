package org.fullstack4.lccbook.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.dto.BbsReplyDTO;
import org.fullstack4.lccbook.service.BbsReplyServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Log4j2
@Controller
@RequestMapping("/bbsreply")
@RequiredArgsConstructor
public class BbsReplyController {
    private final BbsReplyServiceIf bbsReplyServiceIf;
    @PostMapping("/regist")
    public String registPOST(@Valid BbsReplyDTO bbsReplyDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes){
        log.info("============================");
        log.info("BbsReplyController registPOST");
        log.info("bbsDTO : " +bbsReplyDTO);
        log.info("============================");
        if(bindingResult.hasErrors()){
            log.info("bindingResult Errors : " +bbsReplyDTO);
            redirectAttributes.addFlashAttribute("errors",bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("bbsDTO",bbsReplyDTO);
            return "redirect:/bbs/view?idx="+bbsReplyDTO.getBbs_idx();
        }
        int result = bbsReplyServiceIf.reply_regist(bbsReplyDTO);
        return "redirect:/bbs/view?idx="+bbsReplyDTO.getBbs_idx();

    }
    @PostMapping("/delete")
    public String deletePOST(@RequestParam(name="idx", defaultValue = "0") int idx, @RequestParam(name="bbs_idx") int bbs_idx){
        log.info("============================");
        log.info("bbsController deletePOST");
        log.info("============================");
        int result = bbsReplyServiceIf.delete(idx);

        return "redirect:/bbs/view?idx="+bbs_idx;

    }



}
