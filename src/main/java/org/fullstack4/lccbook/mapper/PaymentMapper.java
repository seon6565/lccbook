package org.fullstack4.lccbook.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack4.lccbook.domain.PaymentVO;
import org.fullstack4.lccbook.dto.PageRequestDTO;

import java.util.List;

public interface PaymentMapper {
    int regist(PaymentVO paymentVO);
    List<PaymentVO> list();
    PaymentVO view(int idx);
    PaymentVO DetailView(@Param(value="payment_idx") int payment_idx,@Param(value = "book_idx")  int book_idx);
    int modify(PaymentVO paymentVO);
    int delete(int idx);
    List<PaymentVO> listUser(String user_id);

    int registOrder (@Param(value = "user_id") String user_id);
    int lastindex();


    int bbsTotalCount(PageRequestDTO pageRequestDTO);

    List<PaymentVO> bbsListByPage(PageRequestDTO pageRequestDTO);

    int statusModify(PaymentVO paymentVO);
}
