package org.fullstack4.lccbook.mapper;

import org.fullstack4.lccbook.domain.CartVO;

import java.util.List;

public interface CartMapper {
    int regist(CartVO cartVO);
    List<CartVO> list();
    CartVO view(int idx);
    int modify(CartVO cartVO);
    int delete(int idx);
}
