package org.fullstack4.lccbook.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.domain.AdminVO;
import org.fullstack4.lccbook.dto.AdminDTO;
import org.fullstack4.lccbook.mapper.AdminMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

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

    @Override
    public int regist(AdminDTO adminDTO) {
        AdminVO adminVO = modelMapper.map(adminDTO, AdminVO.class);
        int result = adminMapper.regist(adminVO);

        return result;
    }

    @Override
    public int delete(String admin_id) {
        return adminMapper.delete(admin_id);
    }

    @Override
    public List<AdminDTO> list() {
        List<AdminDTO> adminDTOList = adminMapper.list().stream().map(vo->modelMapper.map(vo,AdminDTO.class)).collect(Collectors.toList());
        return adminDTOList;
    }

}
