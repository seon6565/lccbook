package org.fullstack4.lccbook.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.domain.MemberVO;
import org.fullstack4.lccbook.dto.LoginDTO;
import org.fullstack4.lccbook.dto.MemberDTO;
import org.fullstack4.lccbook.mapper.LoginMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j2
@Service
@RequiredArgsConstructor
public class AdeliveryServiceImpl implements AdeliveryServiceIf{

    @Override
    public List<Object> list() {
        return null;
    }

    @Override
    public Object view(int idx) {
        return null;
    }

    @Override
    public int modify(Object Object) {
        return 0;
    }
}
