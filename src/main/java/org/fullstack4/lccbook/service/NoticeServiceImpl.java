package org.fullstack4.lccbook.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.domain.BbsVO;
import org.fullstack4.lccbook.domain.NoticeVO;
import org.fullstack4.lccbook.dto.BbsDTO;
import org.fullstack4.lccbook.dto.NoticeDTO;
import org.fullstack4.lccbook.dto.PageRequestDTO;
import org.fullstack4.lccbook.dto.PageResponseDTO;
import org.fullstack4.lccbook.mapper.NoticeMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeServiceIf {
    private final NoticeMapper noticeMapper;
    private final ModelMapper modelMapper;
    @Override
    public int regist(NoticeDTO noticeDTO) {
        NoticeVO noticeVO = modelMapper.map(noticeDTO, NoticeVO.class);
        int result = noticeMapper.regist(noticeVO);

        return result;
    }
    @Override
    public List<NoticeDTO> list() {
        List<NoticeDTO> noticeDTOList = noticeMapper.list().stream().map(vo->modelMapper.map(vo,NoticeDTO.class)).collect(Collectors.toList());
        return noticeDTOList;
    }

    @Override
    public NoticeDTO view(int idx) {
        NoticeVO noticeVO = noticeMapper.view(idx);
        NoticeDTO noticeDTO = modelMapper.map(noticeVO,NoticeDTO.class);
        return noticeDTO;
    }
    @Override
    public int modify(NoticeDTO noticeDTO) {
        NoticeVO noticeVO = modelMapper.map(noticeDTO, NoticeVO.class);
        int result = noticeMapper.modify(noticeVO);

        return result;
    }

    @Override
    public int delete(int idx) {
        return noticeMapper.delete(idx);
    }

    @Override
    public int bbsTotalCount(PageRequestDTO requestDTO) {
        return noticeMapper.bbsTotalCount(requestDTO);
    }

    @Override
    public PageResponseDTO<NoticeDTO> bbsListByPage(PageRequestDTO pageRequestDTO) {
        List<NoticeVO> voList = noticeMapper.bbsListByPage(pageRequestDTO);
        List<NoticeDTO> dtoList = voList.stream().map(vo->modelMapper.map(vo,NoticeDTO.class)).collect(Collectors.toList());
        int total_count = noticeMapper.bbsTotalCount(pageRequestDTO);
        PageResponseDTO<NoticeDTO> responseDTO = PageResponseDTO.<NoticeDTO>withAll().requestDTO(pageRequestDTO)
                .dtoList(dtoList).total_count(total_count).build();
        return responseDTO;
    }
}
