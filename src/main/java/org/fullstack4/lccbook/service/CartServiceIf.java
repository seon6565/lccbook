package org.fullstack4.lccbook.service;

import org.fullstack4.lccbook.dto.CartDTO;

import java.util.List;

public interface CartServiceIf {
    int regist(CartDTO CartDTO);
    List<CartDTO> list();
    CartDTO view(int idx);
    int modify(CartDTO cartDTO);
    int delete(int idx);



}
