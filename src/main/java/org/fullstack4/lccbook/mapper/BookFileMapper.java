package org.fullstack4.lccbook.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack4.lccbook.domain.BookVO;

public interface BookFileMapper {
    int registimg(BookVO bookVO);
    int deleteimg(@Param("book_idx") int book_idx);

    int registvideo(BookVO bookVO);
    int deletevideo(@Param("book_idx") int book_idx);
    int lastindex();

}
