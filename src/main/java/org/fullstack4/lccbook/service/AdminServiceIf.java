package org.fullstack4.lccbook.service;


import org.fullstack4.lccbook.dto.AdminDTO;
import org.fullstack4.lccbook.dto.LoginDTO;
import org.fullstack4.lccbook.dto.MemberDTO;

public interface AdminServiceIf {
    AdminDTO adminLogin(AdminDTO adminDTO);

}
