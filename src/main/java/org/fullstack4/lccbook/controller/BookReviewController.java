package org.fullstack4.lccbook.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.dto.BookReviewDTO;
import org.fullstack4.lccbook.service.BookReviewServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Log4j2
@Controller
@RequestMapping("/bookReview")
@RequiredArgsConstructor
public class BookReviewController {

    private final BookReviewServiceIf bookReviewService;


    @PostMapping("/regist")
    public String registPost(BookReviewDTO bookReviewDTO,
                             BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        log.info("==========");
        log.info("BookReviewController >> registPost()");

        if (bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/book/view?idx="+bookReviewDTO.getBook_idx();
        }

        log.info("bbsReplyDTO : " + bookReviewDTO.toString());

        int result = bookReviewService.review_regist(bookReviewDTO);
        log.info("result : " + result);
        log.info("==========");


        if (result > 0) {
            return "redirect:/book/view?idx="+bookReviewDTO.getBook_idx();
        } else {
            return "/bbs/view?idx="+bookReviewDTO.getBook_idx();
        }
    }
}
