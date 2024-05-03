package org.fullstack4.lccbook.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.dto.*;
import org.fullstack4.lccbook.service.IndexServiceIf;
import org.fullstack4.lccbook.service.LoginServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Log4j2
@Controller
@RequiredArgsConstructor
public class IndexController {
    private final IndexServiceIf indexService;

    @RequestMapping(value = "/")
    public String indexView(Model model){

        List<BookDTO> bookDTONewList = indexService.newList();
        List<BookDTO> bookDTOBestList = indexService.bestList();
        List<FaqDTO> faqDTOList = indexService.faqList();
        List<NoticeDTO> noticeDTOList = indexService.noticeList();
        List<QnaDTO> qnaDTOList = indexService.qnaList();

        model.addAttribute("bookDTONewList", bookDTONewList);
        model.addAttribute("bookDTOBestList", bookDTOBestList);
        model.addAttribute("faqDTOList", faqDTOList);
        model.addAttribute("noticeDTOList", noticeDTOList);
        model.addAttribute("qnaDTOList", qnaDTOList);

        return "index";
    }

}
