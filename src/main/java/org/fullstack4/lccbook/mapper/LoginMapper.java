package org.fullstack4.lccbook.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack4.lccbook.domain.MemberVO;

public interface LoginMapper {
    MemberVO login_info(@Param("user_id") String user_id, @Param("pwd") String pwd);
    MemberVO Cookie_login(@Param("user_id") String user_id);
}
