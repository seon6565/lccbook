package org.fullstack4.lccbook.mapper;

import org.fullstack4.lccbook.domain.BbsVO;
import org.fullstack4.lccbook.dto.PageRequestDTO;

import java.util.List;

public interface BbsMapper {
    int regist(BbsVO bbsVO);
    List<BbsVO> listAll();
    BbsVO view(int idx);
    int modify(BbsVO bbsVO);
    int delete(int idx);
    int bbsTotalCount(PageRequestDTO requestDTO);
    List<BbsVO> bbsListByPage(PageRequestDTO requestDTO);
}
