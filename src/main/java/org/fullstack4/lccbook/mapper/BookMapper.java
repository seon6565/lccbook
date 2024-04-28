package org.fullstack4.lccbook.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack4.lccbook.domain.BookVO;
import org.fullstack4.lccbook.dto.PageRequestDTO;

import java.util.List;

public interface BookMapper {
    int regist(BookVO bookVO);
    List<BookVO> list();
    BookVO view(int idx);
    int modify(BookVO bookVO);
    int delete(int idx);
    int bbsTotalCount(PageRequestDTO requestDTO);
    List<BookVO> bbsListByPage(PageRequestDTO requestDTO);
}
