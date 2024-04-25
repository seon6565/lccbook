package org.fullstack4.lccbook.service;

import java.util.List;

public interface PaymentServiceIf {
    int regist(PaymentDTO paymentDTO);
    List<PaymentDTO> list();
    PaymentDTO view(int idx);
    int modify(PaymentDTO paymentDTO);
    int delete(int idx);



}
