package org.fullstack4.lccbook.mapper;

import org.fullstack4.lccbook.domain.*;
import org.fullstack4.lccbook.dto.PageRequestDTO;

import java.util.List;

public interface IndexMapper {
    int regist(Object Object);

    Object view(int idx);
    int modify(Object Object);
    int delete(int idx);

    List<BookVO> newList();
    List<BookVO> bestList();
    List<NoticeVO> noticeList();
    List<FaqVO> faqList();
    List<QnaVO> qnaList();

}
