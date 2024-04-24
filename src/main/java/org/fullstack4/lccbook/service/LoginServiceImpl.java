package org.fullstack4.lccbook.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.domain.MemberVO;
import org.fullstack4.lccbook.dto.LoginDTO;
import org.fullstack4.lccbook.dto.MemberDTO;
import org.fullstack4.lccbook.mapper.LoginMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Log4j2
@Service
@RequiredArgsConstructor
public class LoginServiceImpl implements LoginServiceIf{
    private final LoginMapper loginXmlMapper;
    private final ModelMapper modelMapper;
    @Override
    public MemberDTO login_info(LoginDTO loginDTO) {
        MemberVO memberVO = loginXmlMapper.login_info(loginDTO.getUser_id(),loginDTO.getPwd());
        if(memberVO!=null && memberVO.getPwd().equals(loginDTO.getPwd())) {
            MemberDTO memberDTO = modelMapper.map(memberVO, MemberDTO.class);
            return memberDTO;
        }
        return null;
    }

    @Override
    public MemberDTO Cookie_login(String user_id) {
        MemberVO memberVO = loginXmlMapper.Cookie_login(user_id);
            MemberDTO memberDTO = modelMapper.map(memberVO, MemberDTO.class);
            return memberDTO;
    }

}
