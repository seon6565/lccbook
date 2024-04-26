package org.fullstack4.lccbook.service;

import org.fullstack4.lccbook.dto.BbsReplyDTO;
import org.fullstack4.lccbook.dto.BookDTO;
import org.fullstack4.lccbook.dto.PageRequestDTO;
import org.fullstack4.lccbook.dto.PageResponseDTO;

import java.util.List;

public interface BookServiceIf {
    int regist(BookDTO bookDTO);
    List<BookDTO> list();
    BookDTO view(int idx);
    int modify(BookDTO bookDTO);
    int delete(int idx);
    int bbsTotalCount(PageRequestDTO requestDTO);
    PageResponseDTO<BookDTO> bbsListByPage(PageRequestDTO pageRequestDTO);
}
