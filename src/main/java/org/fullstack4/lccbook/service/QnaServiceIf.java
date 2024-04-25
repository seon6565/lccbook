package org.fullstack4.lccbook.service;

import org.fullstack4.lccbook.dto.*;

import java.util.List;

public interface QnaServiceIf {
    int regist(QnaDTO qnaDTO);
    List<QnaDTO> list();
    QnaDTO view(int idx);
    int modify(QnaDTO qnaDTO);
    int delete(int idx);



}
