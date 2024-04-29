package org.fullstack4.lccbook.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.domain.BookVO;
import org.fullstack4.lccbook.domain.FaqVO;
import org.fullstack4.lccbook.dto.BookDTO;
import org.fullstack4.lccbook.dto.FaqDTO;
import org.fullstack4.lccbook.dto.PageRequestDTO;
import org.fullstack4.lccbook.dto.PageResponseDTO;
import org.fullstack4.lccbook.mapper.FaqMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class FaqServiceImpl implements FaqServiceIf {
    private final FaqMapper faqMapper;
    private final ModelMapper modelMapper;
    @Override
    public int regist(FaqDTO faqDTO) {
        FaqVO faqVO = modelMapper.map(faqDTO, FaqVO.class);
        int result = faqMapper.regist(faqVO);

        return result;
    }
    @Override
    public List<FaqDTO> list() {
        List<FaqDTO> faqDTOList = faqMapper.list().stream().map(vo->modelMapper.map(vo,FaqDTO.class)).collect(Collectors.toList());
        return faqDTOList;
    }

    @Override
    public FaqDTO view(int idx) {
        FaqVO faqVO = faqMapper.view(idx);
        FaqDTO faqDTO = modelMapper.map(faqVO,FaqDTO.class);
        return faqDTO;
    }
    @Override
    public int modify(FaqDTO faqDTO) {
        FaqVO faqVO = modelMapper.map(faqDTO, FaqVO.class);
        int result = faqMapper.modify(faqVO);

        return result;
    }

    @Override
    public int delete(int idx) {
        return faqMapper.delete(idx);
    }

    @Override
    public int bbsTotalCount(PageRequestDTO requestDTO) {
        return faqMapper.bbsTotalCount(requestDTO);
    }

    @Override
    public PageResponseDTO<FaqDTO> bbsListByPage(PageRequestDTO pageRequestDTO) {
        List<FaqVO> voList = faqMapper.bbsListByPage(pageRequestDTO);
        List<FaqDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, FaqDTO.class))
                .collect(Collectors.toList());
        int total_count = faqMapper.bbsTotalCount(pageRequestDTO);
        PageResponseDTO<FaqDTO> responseDTO = PageResponseDTO.<FaqDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();
        return responseDTO;
    }
}
