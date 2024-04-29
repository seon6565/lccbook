package org.fullstack4.lccbook.service;

import org.fullstack4.lccbook.dto.CartDTO;
import org.fullstack4.lccbook.dto.PaymentDTO;

import java.util.List;

public interface PaymentServiceIf {
    int regist(PaymentDTO paymentDTO);
    List<PaymentDTO> list();
    List<PaymentDTO> listUser(String user_id);
    PaymentDTO view(int idx);
    int modify(PaymentDTO paymentDTO);
    int delete(int idx);
    /*List<CartDTO> cartOrderList(int idx);
*/


}
