package org.fullstack4.lccbook.service;

import org.fullstack4.lccbook.domain.FaqVO;
import org.fullstack4.lccbook.dto.*;

import java.util.List;

public interface FaqServiceIf {
    int regist(FaqDTO faqDTO);
    List<FaqDTO> list();
    FaqDTO view(int idx);
    int modify(FaqDTO faqDTO);
    int delete(int idx);
    int bbsTotalCount(PageRequestDTO requestDTO);
    PageResponseDTO<FaqDTO> bbsListByPage(PageRequestDTO pageRequestDTO);


}
