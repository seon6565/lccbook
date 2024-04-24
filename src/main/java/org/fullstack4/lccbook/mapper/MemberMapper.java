package org.fullstack4.lccbook.mapper;

import org.fullstack4.lccbook.domain.MemberVO;

public interface MemberMapper {
    int join(MemberVO memberVO);
    MemberVO view(String user_id);
    int modify(MemberVO memberVO);
    int delete(String user_id);
    int idCheck(String user_id);
}
