package org.fullstack4.lccbook.service;

import org.fullstack4.lccbook.dto.MemberDTO;

public interface MemberServiceIf {
    int join(MemberDTO memberDTO);
    MemberDTO view(String user_id);
    int modify(MemberDTO memberDTO);
    int delete(String user_id);

    int idCheck(String user_id);
}
