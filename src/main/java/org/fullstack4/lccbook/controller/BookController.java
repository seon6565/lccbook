package org.fullstack4.lccbook.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.dto.BookDTO;
import org.fullstack4.lccbook.dto.BookReviewDTO;
import org.fullstack4.lccbook.service.BookReviewServiceIf;
import org.fullstack4.lccbook.service.BookServiceIf;
import org.fullstack4.lccbook.service.MemberServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.fullstack4.lccbook.dto.PageRequestDTO;
import org.fullstack4.lccbook.dto.PageResponseDTO;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;

@Log4j2
@Controller
@RequestMapping("/book")
@RequiredArgsConstructor
public class BookController {
    private final MemberServiceIf memberServiceIf;
    private final BookServiceIf bookServiceIf;
    private final BookReviewServiceIf bookReviewServiceIf;

    @GetMapping(value = "/view")
    public void view(@RequestParam(name = "book_idx", defaultValue = "0") int book_idx,
                     Model model) {
        log.info("==========");
        log.info("BookController >> view()");
        log.info("book_idx : " + book_idx);
        log.info("==========");

        BookDTO bookDTO = bookServiceIf.view(book_idx);
        List<BookReviewDTO> bookReviewDTOList = bookReviewServiceIf.review_list(book_idx);

        model.addAttribute("book", bookDTO);
        model.addAttribute("bookReview", bookReviewDTOList);

    }

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
        PageResponseDTO<BookDTO> responseDTO = bookServiceIf.bbsListByPage(pageRequestDTO);
        model.addAttribute("responseDTO", responseDTO);
        model.addAttribute("search_type", responseDTO.getSearch_type());

        if(responseDTO.getSearch_type()!=null){
            model.addAttribute("search_type", responseDTO.getSearch_type()[0]);
        }

    }
}
