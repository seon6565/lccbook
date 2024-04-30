package org.fullstack4.lccbook.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack4.lccbook.domain.PaymentVO;

import java.util.List;

public interface PaymentMapper {
    int regist(PaymentVO paymentVO);
    List<PaymentVO> list();
    PaymentVO view(int idx);
    int modify(PaymentVO paymentVO);
    int delete(int idx);
    List<PaymentVO> listUser(String user_id);

    int registOrder (@Param(value = "user_id") String user_id);
    int lastindex();


}
