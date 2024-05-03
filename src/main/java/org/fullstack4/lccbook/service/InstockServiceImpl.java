package org.fullstack4.lccbook.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.domain.InstockVO;
import org.fullstack4.lccbook.dto.InstockDTO;
import org.fullstack4.lccbook.dto.NoticeDTO;
import org.fullstack4.lccbook.dto.PageRequestDTO;
import org.fullstack4.lccbook.dto.PageResponseDTO;
import org.fullstack4.lccbook.mapper.InstockMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class InstockServiceImpl implements InstockServiceIf {

    private final InstockMapper instockMapper;
    private final ModelMapper modelMapper;
    @Override
    public int regist(InstockDTO instockDTO) {
        InstockVO instockVO = modelMapper.map(instockDTO, InstockVO.class);
        System.out.println("instockVO : " + instockVO.toString());
        int result = instockMapper.regist(instockVO);
        System.out.println("instock result : " + result);

        return result;
    }

    @Override
    public List<InstockDTO> list() {
        List<InstockDTO> noticeDTOList = instockMapper.list().stream().map(vo->modelMapper.map(vo,InstockDTO.class)).collect(Collectors.toList());
        return noticeDTOList;
    }

    @Override
    public int bbsTotalCount(PageRequestDTO requestDTO) {
        return instockMapper.bbsTotalCount(requestDTO);
    }

    @Override
    public PageResponseDTO<InstockDTO> bbsListByPage(PageRequestDTO pageRequestDTO) {
        List<InstockVO> voList = instockMapper.bbsListByPage(pageRequestDTO);
        List<InstockDTO> dtoList = voList.stream().map(vo->modelMapper.map(vo, InstockDTO.class)).collect(Collectors.toList());
        int total_count = instockMapper.bbsTotalCount(pageRequestDTO);
        System.out.println("instock total+count " + total_count);
        PageResponseDTO<InstockDTO> responseDTO = PageResponseDTO.<InstockDTO>withAll().requestDTO(pageRequestDTO)
                .dtoList(dtoList).total_count(total_count).build();
        return responseDTO;
    }


}
