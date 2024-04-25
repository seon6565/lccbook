package org.fullstack4.lccbook.service;

import java.util.List;

public interface PaymentServiceIf {
    int regist(Object Object);
    List<Object> list();
    Object view(int idx);
    int modify(Object Object);



}
