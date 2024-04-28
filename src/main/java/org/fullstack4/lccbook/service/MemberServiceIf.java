package org.fullstack4.lccbook.service;

import org.fullstack4.lccbook.dto.BbsDTO;
import org.fullstack4.lccbook.dto.MemberDTO;
import org.fullstack4.lccbook.dto.PageRequestDTO;
import org.fullstack4.lccbook.dto.PageResponseDTO;

public interface MemberServiceIf {
    int join(MemberDTO memberDTO);
    MemberDTO view(String user_id);
    int modify(MemberDTO memberDTO);
    int delete(String user_id);
    int idCheck(String user_id);
    int bbsTotalCount(PageRequestDTO requestDTO);
    PageResponseDTO<MemberDTO> bbsListByPage(PageRequestDTO pageRequestDTO);
}
