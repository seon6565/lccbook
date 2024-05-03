package org.fullstack4.lccbook.service;

import org.fullstack4.lccbook.dto.*;

import java.util.List;

public interface PaymentServiceIf {
    int regist(PaymentDTO paymentDTO);
    List<PaymentDTO> list();
    List<PaymentDTO> listUser(String user_id);
    PaymentDTO view(int payment_idx);
    PaymentDTO DetailView(int payment_idx,int book_idx);
    int modify(PaymentDTO paymentDTO);
    int delete(int idx);
    /*List<CartDTO> cartOrderList(int idx);

*/
    PageResponseDTO<PaymentDTO> bbsListByPage(PageRequestDTO pageRequestDTO);


    int statusModify(int paymentIdx, int bookIdx, String paymentStatus);

    List<PaymentDTO> complete(String user_id, int payment_idx);


}
