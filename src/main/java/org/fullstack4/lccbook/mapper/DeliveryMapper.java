package org.fullstack4.lccbook.mapper;

import org.fullstack4.lccbook.domain.DeliveryVO;
import org.fullstack4.lccbook.dto.PageRequestDTO;

import java.util.List;

public interface DeliveryMapper {
    List<DeliveryVO> list();
    DeliveryVO view(int idx);
    int modify(DeliveryVO deliveryVO);
    int delete(int idx);
    int bbsTotalCount(PageRequestDTO requestDTO);
    List<DeliveryVO> bbsListByPage(PageRequestDTO requestDTO);
}
