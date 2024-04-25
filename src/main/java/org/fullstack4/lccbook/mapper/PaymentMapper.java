package org.fullstack4.lccbook.mapper;

import java.util.List;

public interface PaymentMapper {
    int regist(PaymentVO paymentVO);
    List<PaymentVO> list();
    PaymentVO view(int idx);
    int modify(PaymentVO paymentVO);
    int delete(int idx);
}
