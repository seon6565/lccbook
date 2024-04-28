package org.fullstack4.lccbook.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.domain.BbsVO;
import org.fullstack4.lccbook.domain.MemberVO;
import org.fullstack4.lccbook.dto.BbsDTO;
import org.fullstack4.lccbook.dto.MemberDTO;
import org.fullstack4.lccbook.dto.PageRequestDTO;
import org.fullstack4.lccbook.dto.PageResponseDTO;
import org.fullstack4.lccbook.mapper.MemberMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberServiceIf{
    private final MemberMapper memberMapper;
    private final ModelMapper modelMapper;
    @Override
    public int join(MemberDTO memberDTO) {
        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);
        int result = memberMapper.join(memberVO);
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
        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);
        int result = memberMapper.modify(memberVO);

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
        return result;
    }

    @Override
    public int bbsTotalCount(PageRequestDTO requestDTO) {
        return memberMapper.bbsTotalCount(requestDTO);
    }

    @Override
    public PageResponseDTO<MemberDTO> bbsListByPage(PageRequestDTO pageRequestDTO) {
        List<MemberVO> voList = memberMapper.bbsListByPage(pageRequestDTO);
        List<MemberDTO> dtoList = voList.stream().map(vo->modelMapper.map(vo,MemberDTO.class)).collect(Collectors.toList());
        int total_count = memberMapper.bbsTotalCount(pageRequestDTO);
        PageResponseDTO<MemberDTO> responseDTO = PageResponseDTO.<MemberDTO>withAll().requestDTO(pageRequestDTO)
                .dtoList(dtoList).total_count(total_count).build();
        return responseDTO;
    }
}
