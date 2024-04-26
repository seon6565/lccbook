package org.fullstack4.lccbook.service;

import org.fullstack4.lccbook.dto.CartDTO;
import org.fullstack4.lccbook.dto.DeliveryDTO;

import java.util.List;

public interface DeliveryServiceIf {
    int regist(DeliveryDTO deliveryDTO);
    List<DeliveryDTO> list();
    DeliveryDTO view(int idx);
    int modify(DeliveryDTO deliveryDTO);
    int delete(int idx);



}