package org.fullstack4.lccbook.service;

import org.fullstack4.lccbook.dto.PageRequestDTO;
import org.fullstack4.lccbook.dto.PageResponseDTO;
import org.fullstack4.lccbook.dto.QnaDTO;

import java.util.List;

public interface QnaServiceIf {
    int regist(QnaDTO qnaDTO);
    List<QnaDTO> list();
    List<QnaDTO> listUser(String user_id);
    QnaDTO view(int idx);
    int modify(QnaDTO qnaDTO);
    int delete(int idx);
    int bbsTotalCount(PageRequestDTO requestDTO);
    PageResponseDTO<QnaDTO> bbsListByPage(PageRequestDTO pageRequestDTO);
    int regist_answer(QnaDTO qnaDTO);

    int delete_answer(int idx);

}
