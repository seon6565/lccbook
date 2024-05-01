package org.fullstack4.lccbook.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack4.lccbook.domain.CartVO;

import java.util.List;

public interface CartMapper {
    int regist(CartVO cartVO);
    List<CartVO> list(String user_id);
    CartVO view(int idx);
    int modify(@Param("cart_idx") int cart_idx, @Param("quantity") int quantity,@Param("book_idx") int book_idx);
    int delete(int idx);
    int checkBookExists(CartVO cartVO);
   /* int cartOrderList(int idx);*/
}
