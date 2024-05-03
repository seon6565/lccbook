package org.fullstack4.lccbook.service;

import org.fullstack4.lccbook.dto.BookDTO;
import org.fullstack4.lccbook.dto.FaqDTO;
import org.fullstack4.lccbook.dto.NoticeDTO;
import org.fullstack4.lccbook.dto.QnaDTO;

import java.util.List;

public interface IndexServiceIf {
    int regist(Object Object);
    List<Object> list();
    Object view(int idx);
    int modify(Object Object);
    int delete(int idx);

    List<BookDTO> newList();
    List<BookDTO> bestList();
    List<NoticeDTO> noticeList();
    List<FaqDTO> faqList();
    List<QnaDTO> qnaList();

}
