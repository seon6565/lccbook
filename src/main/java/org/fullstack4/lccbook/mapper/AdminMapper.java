package org.fullstack4.lccbook.mapper;

import org.fullstack4.lccbook.domain.AdminVO;

import java.util.List;

public interface AdminMapper {
    AdminVO adminLogin(String admin_id);
    int regist(AdminVO adminVO);
    int delete(String admin_id);
    List<AdminVO> list();
}
