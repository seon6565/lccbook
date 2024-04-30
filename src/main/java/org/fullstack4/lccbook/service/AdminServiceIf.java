package org.fullstack4.lccbook.service;


import org.fullstack4.lccbook.dto.AdminDTO;

import java.util.List;

public interface AdminServiceIf {
    AdminDTO adminLogin(AdminDTO adminDTO);
    int regist(AdminDTO adminDTO);
    int delete(String admin_id);
    List<AdminDTO> list();

}
