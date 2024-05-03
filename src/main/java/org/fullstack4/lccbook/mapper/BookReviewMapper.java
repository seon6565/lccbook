package org.fullstack4.lccbook.mapper;
import org.fullstack4.lccbook.domain.BookReviewVO;
import org.fullstack4.lccbook.domain.BookVO;
import org.fullstack4.lccbook.dto.PageRequestDTO;

import java.util.List;

public interface BookReviewMapper {
    int review_regist(BookReviewVO bookReviewVO);
    List<BookReviewVO> review_list(int book_idx);
    int delete(int review_idx);
    int commentTotalCount(PageRequestDTO requestDTO);
    List<BookReviewVO> commentListByPage(PageRequestDTO requestDTO);
    int update_reply_cnt(int book_idx);
}
