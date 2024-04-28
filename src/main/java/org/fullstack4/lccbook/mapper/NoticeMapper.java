package org.fullstack4.lccbook.mapper;

import org.fullstack4.lccbook.domain.BbsVO;
import org.fullstack4.lccbook.domain.NoticeVO;
import org.fullstack4.lccbook.dto.PageRequestDTO;

import java.util.List;

public interface NoticeMapper {
    int regist(NoticeVO noticeVO);
    List<NoticeVO> list();
    NoticeVO view(int idx);
    int modify(NoticeVO noticeVO);
    int delete(int idx);

    int bbsTotalCount(PageRequestDTO requestDTO);
    List<NoticeVO> bbsListByPage(PageRequestDTO requestDTO);
}
