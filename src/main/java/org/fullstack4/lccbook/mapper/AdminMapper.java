package org.fullstack4.lccbook.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack4.lccbook.domain.AdminVO;
import org.fullstack4.lccbook.domain.MemberVO;

public interface AdminMapper {
    AdminVO adminLogin(String admin_id);
}
