package org.fullstack4.lccbook.service;

import org.fullstack4.lccbook.dto.*;

import java.util.List;

public interface NoticeServiceIf {
    int regist(NoticeDTO noticeDTO);
    List<NoticeDTO> list();
    NoticeDTO view(int idx);
    int modify(NoticeDTO noticeDTO);
    int delete(int idx);
    int bbsTotalCount(PageRequestDTO requestDTO);
    PageResponseDTO<NoticeDTO> bbsListByPage(PageRequestDTO pageRequestDTO);


}
