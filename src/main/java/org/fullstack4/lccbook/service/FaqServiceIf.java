package org.fullstack4.lccbook.service;

import org.fullstack4.lccbook.domain.FaqVO;
import org.fullstack4.lccbook.dto.DeliveryDTO;
import org.fullstack4.lccbook.dto.FaqDTO;

import java.util.List;

public interface FaqServiceIf {
    int regist(FaqDTO faqDTO);
    List<FaqDTO> list();
    FaqDTO view(int idx);
    int modify(FaqDTO faqDTO);
    int delete(int idx);


}
