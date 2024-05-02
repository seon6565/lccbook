package org.fullstack4.lccbook.mapper;

import org.fullstack4.lccbook.domain.InstockVO;
import org.fullstack4.lccbook.domain.QnaVO;
import org.fullstack4.lccbook.dto.PageRequestDTO;

import java.util.List;

public interface InstockMapper {
    int regist(InstockVO instockVO);
   List<InstockVO> list();
/*    QnaVO view(int idx);
    int modify(QnaVO qnaVO);
    int delete(int idx);
    List<QnaVO> listUser(String user_id);*/
    int bbsTotalCount(PageRequestDTO requestDTO);
    List<InstockVO> bbsListByPage(PageRequestDTO requestDTO);
   /* int regist_answer(QnaVO qnaVO);
    int delete_answer(int idx);*/
}
