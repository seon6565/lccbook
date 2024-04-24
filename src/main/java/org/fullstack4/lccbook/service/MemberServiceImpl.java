package org.fullstack4.lccbook.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.domain.MemberVO;
import org.fullstack4.lccbook.dto.MemberDTO;
import org.fullstack4.lccbook.mapper.MemberMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Log4j2
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberServiceIf{
    private final MemberMapper memberMapper;
    private final ModelMapper modelMapper;
    @Override
    public int join(MemberDTO memberDTO) {
        log.info("========================");
        log.info("MemberServiceImpl join(memberDTO)" + memberDTO);

        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);
        int result = memberMapper.join(memberVO);

        log.info("MemberServiceImpl memberVO" + memberVO);
        log.info("MemberServiceImpl result" + result);
        log.info("========================");

        return result;
    }

    @Override
    public MemberDTO view(String user_id) {
        MemberVO memberVO = memberMapper.view(user_id);
        MemberDTO memberDTO = modelMapper.map(memberVO,MemberDTO.class);
        return memberDTO;
    }

    @Override
    public int modify(MemberDTO memberDTO) {
        log.info("========================");
        log.info("MemberServiceImpl modify(MemberDTO)" + memberDTO);

        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);
        int result = memberMapper.modify(memberVO);
        log.info("MemberServiceImpl result" + result);
        log.info("MemberServiceImpl modify" + memberVO);
        log.info("========================");

        return result;
    }

    @Override
    public int delete(String user_id) {
        return memberMapper.delete(user_id);
    }

    @Override
    public int idCheck(String user_id) {
        log.info(user_id);
        int result = memberMapper.idCheck(user_id);
        log.info("결과테스트" +result);
        return result;
    }

}
