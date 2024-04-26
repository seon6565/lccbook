package org.fullstack4.lccbook.service;

import org.fullstack4.lccbook.dto.BbsDTO;
import org.fullstack4.lccbook.dto.BbsReplyDTO;
import org.fullstack4.lccbook.dto.BookDTO;

import java.util.List;

public interface BookServiceIf {
    int regist(BookDTO bookDTO);
    List<BookDTO> list();
    BookDTO view(int idx);
    int modify(BookDTO bookDTO);
    int delete(int idx);

}
