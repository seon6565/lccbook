package org.fullstack4.lccbook.service;

import org.fullstack4.lccbook.dto.*;

import java.util.List;

public interface DeliveryServiceIf {
    List<DeliveryDTO> list();
    DeliveryDTO view(int idx);
    int modify(DeliveryDTO deliveryDTO);
    int delete(int idx);
    int bbsTotalCount(PageRequestDTO requestDTO);
    PageResponseDTO<DeliveryDTO> bbsListByPage(PageRequestDTO pageRequestDTO);

}
