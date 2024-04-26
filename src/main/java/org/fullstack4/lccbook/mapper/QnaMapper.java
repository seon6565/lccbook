package org.fullstack4.lccbook.mapper;

import org.fullstack4.lccbook.domain.QnaVO;

import java.util.List;

public interface QnaMapper {
    int regist(QnaVO qnaVO);
    List<QnaVO> list();
    QnaVO view(int idx);
    int modify(QnaVO qnaVO);
    int delete(int idx);

    List<QnaVO> listUser(String user_id);

/*    int answer_regist(QnaVO qnaVO);*/
}
