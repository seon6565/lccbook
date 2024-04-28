package org.fullstack4.lccbook.mapper;

import org.fullstack4.lccbook.domain.BbsVO;
import org.fullstack4.lccbook.domain.MemberVO;
import org.fullstack4.lccbook.dto.PageRequestDTO;

import java.util.List;

public interface MemberMapper {
    int join(MemberVO memberVO);
    MemberVO view(String user_id);
    int modify(MemberVO memberVO);
    int delete(String user_id);
    int idCheck(String user_id);

    int bbsTotalCount(PageRequestDTO requestDTO);
    List<MemberVO> bbsListByPage(PageRequestDTO requestDTO);
}
