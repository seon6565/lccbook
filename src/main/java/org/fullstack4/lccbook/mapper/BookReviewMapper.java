package org.fullstack4.lccbook.mapper;
import org.fullstack4.lccbook.domain.BookReviewVO;

import java.util.List;

public interface BookReviewMapper {
    int review_regist(BookReviewVO bookReviewVO);
    List<BookReviewVO> review_list(int book_idx);
    int delete(int review_idx);
}
