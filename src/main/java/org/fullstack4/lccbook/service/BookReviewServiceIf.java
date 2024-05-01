package org.fullstack4.lccbook.service;

import org.fullstack4.lccbook.domain.BookReviewVO;
import org.fullstack4.lccbook.dto.BookReviewDTO;
import org.fullstack4.lccbook.dto.PageRequestDTO;
import org.fullstack4.lccbook.dto.PageResponseDTO;

import java.util.List;

public interface BookReviewServiceIf {
    int review_regist(BookReviewDTO bookReviewDTO);
    List<BookReviewDTO> review_list(int book_idx);
    int delete(int review_idx);
    PageResponseDTO<BookReviewDTO> commentListByPage(PageRequestDTO requestDTO);
    int commentTotalCount(PageRequestDTO requestDTO);
}
