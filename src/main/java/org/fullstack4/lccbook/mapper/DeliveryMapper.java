package org.fullstack4.lccbook.mapper;

import org.fullstack4.lccbook.domain.DeliveryVO;

import java.util.List;

public interface DeliveryMapper {
    int regist(DeliveryVO DeliveryVO);
    List<DeliveryVO> list();
    DeliveryVO view(int idx);
    int modify(DeliveryVO deliveryVO);
    int delete(int idx);
}