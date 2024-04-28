package org.fullstack4.lccbook.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.domain.AdminVO;
import org.fullstack4.lccbook.domain.MemberVO;
import org.fullstack4.lccbook.dto.AdminDTO;
import org.fullstack4.lccbook.dto.LoginDTO;
import org.fullstack4.lccbook.dto.MemberDTO;
import org.fullstack4.lccbook.mapper.AdminMapper;
import org.fullstack4.lccbook.mapper.LoginMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Log4j2
@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminServiceIf{
    private final AdminMapper adminMapper;
    private final ModelMapper modelMapper;
    @Override
    public AdminDTO adminLogin(AdminDTO adminDTO) {
        AdminVO adminVO = adminMapper.adminLogin(adminDTO.getAdmin_id());
        if(adminVO!=null && adminVO.getAdmin_pwd().equals(adminDTO.getAdmin_pwd())) {
            adminDTO = modelMapper.map(adminVO, AdminDTO.class);
            return adminDTO;
        }
        return null;
    }

}
