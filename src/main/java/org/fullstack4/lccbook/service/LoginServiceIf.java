package org.fullstack4.lccbook.service;


import org.fullstack4.lccbook.dto.LoginDTO;
import org.fullstack4.lccbook.dto.MemberDTO;

public interface LoginServiceIf {
    MemberDTO login_info(LoginDTO loginDTO);

    MemberDTO Cookie_login(String user_id);
}
