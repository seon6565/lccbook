package org.fullstack4.lccbook.service;

import org.fullstack4.lccbook.dto.CartDTO;

import java.util.List;

public interface CartServiceIf {
    int regist(CartDTO CartDTO);
    List<CartDTO> list(String user_id);
    CartDTO view(int idx);
    int modify(int cart_idx, int quantity,int book_idx) ;
    int delete(int idx);

    int checkBookExists(CartDTO cartDTO);





}
