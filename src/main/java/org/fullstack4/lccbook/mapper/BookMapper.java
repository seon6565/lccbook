package org.fullstack4.lccbook.mapper;

import org.fullstack4.lccbook.domain.BookVO;

import java.util.List;

public interface BookMapper {
    int regist(BookVO bookVO);
    List<BookVO> list();
    BookVO view(int idx);
    int modify(BookVO bookVO);
    int delete(int idx);
}
