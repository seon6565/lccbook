package org.fullstack4.lccbook.mapper;

import org.fullstack4.lccbook.domain.FaqVO;

import java.util.List;

public interface FaqMapper {
    int regist(FaqVO faqVO);
    List<FaqVO> list();
    FaqVO view(int idx);
    int modify(FaqVO faqVO);
    int delete(int idx);
}
