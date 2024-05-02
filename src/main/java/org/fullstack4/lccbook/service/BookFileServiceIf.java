package org.fullstack4.lccbook.service;

import org.fullstack4.lccbook.dto.BookDTO;

public interface BookFileServiceIf {
    int registimg(BookDTO bookDTO);
    int registvideo(BookDTO bookDTO);
    int deleteimg(int book_idx);
    int deletevideo(int book_idx);

}
