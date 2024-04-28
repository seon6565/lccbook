package org.fullstack4.lccbook.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.domain.BbsVO;
import org.fullstack4.lccbook.domain.QnaVO;
import org.fullstack4.lccbook.dto.BbsDTO;
import org.fullstack4.lccbook.dto.PageRequestDTO;
import org.fullstack4.lccbook.dto.PageResponseDTO;
import org.fullstack4.lccbook.dto.QnaDTO;
import org.fullstack4.lccbook.mapper.QnaMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class QnaServiceImpl implements QnaServiceIf {

    private final QnaMapper qnaMapper;
    private final ModelMapper modelMapper;
    @Override
    public int regist(QnaDTO qnaDTO) {
        QnaVO qnaVO = modelMapper.map(qnaDTO, QnaVO.class);
        int result = qnaMapper.regist(qnaVO);

        return result;
    }
    @Override
    public List<QnaDTO> list() {
        List<QnaDTO> qnaDTOList = qnaMapper.list().stream().map(vo->modelMapper.map(vo,QnaDTO.class)).collect(Collectors.toList());
        return qnaDTOList;
    }

    public List<QnaDTO> listUser(String user_id) {
        List<QnaDTO> qnaDTOListUser = qnaMapper.listUser(user_id).stream().map(vo->modelMapper.map(vo,QnaDTO.class)).collect(Collectors.toList());
        return qnaDTOListUser;
    }

    @Override
    public QnaDTO view(int idx) {
        QnaVO qnaVO = qnaMapper.view(idx);
        QnaDTO qnaDTO = modelMapper.map(qnaVO,QnaDTO.class);
        return qnaDTO;
    }
    @Override
    public int modify(QnaDTO qnaDTO) {
        QnaVO qnaVO = modelMapper.map(qnaDTO, QnaVO.class);
        int result = qnaMapper.modify(qnaVO);

        return result;
    }

    @Override
    public int delete(int idx) {
        return qnaMapper.delete(idx);
    }

    @Override
    public int bbsTotalCount(PageRequestDTO requestDTO) {
        return qnaMapper.bbsTotalCount(requestDTO);
    }

    @Override
    public PageResponseDTO<QnaDTO> bbsListByPage(PageRequestDTO pageRequestDTO) {
        List<QnaVO> voList = qnaMapper.bbsListByPage(pageRequestDTO);
        List<QnaDTO> dtoList = voList.stream().map(vo->modelMapper.map(vo,QnaDTO.class)).collect(Collectors.toList());
        int total_count = qnaMapper.bbsTotalCount(pageRequestDTO);
        PageResponseDTO<QnaDTO> responseDTO = PageResponseDTO.<QnaDTO>withAll().requestDTO(pageRequestDTO)
                .dtoList(dtoList).total_count(total_count).build();
        return responseDTO;
    }
}
