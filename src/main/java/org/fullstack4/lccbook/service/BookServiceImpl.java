package org.fullstack4.lccbook.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.domain.BbsVO;
import org.fullstack4.lccbook.domain.BookVO;
import org.fullstack4.lccbook.dto.BbsDTO;
import org.fullstack4.lccbook.dto.BookDTO;
import org.fullstack4.lccbook.dto.PageRequestDTO;
import org.fullstack4.lccbook.dto.PageResponseDTO;
import org.fullstack4.lccbook.mapper.BbsMapper;
import org.fullstack4.lccbook.mapper.BookMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class BookServiceImpl implements BookServiceIf{
    private final BookMapper bookMapper;
    private final ModelMapper modelMapper;

    @Override
    public int regist(BookDTO bookDTO) {
        BookVO bookVO = modelMapper.map(bookDTO, BookVO.class);
        int result = bookMapper.regist(bookVO);

        return result;
    }

    @Override
    public List<BookDTO> list() {
        List<BookDTO> bookDTOList = bookMapper.list().stream().map(vo->modelMapper.map(vo,BookDTO.class)).collect(Collectors.toList());
        return bookDTOList;
    }

    @Override
    public BookDTO view(int idx) {
        BookVO bookVO = bookMapper.view(idx);
        BookDTO bookDTO = modelMapper.map(bookVO,BookDTO.class);
        return bookDTO;
    }

    @Override
    public int modify(BookDTO bookDTO) {
        BookVO bookVO = modelMapper.map(bookDTO, BookVO.class);
        int result = bookMapper.modify(bookVO);

        return result;
    }

    @Override
    public int delete(int idx) {
        return bookMapper.delete(idx);
    }


    @Override
    public int bbsTotalCount(PageRequestDTO requestDTO) {
        return bookMapper.bbsTotalCount(requestDTO);
    }

    @Override
    public PageResponseDTO<BookDTO> bbsListByPage(PageRequestDTO pageRequestDTO) {
        List<BookVO> voList = bookMapper.bbsListByPage(pageRequestDTO);
        List<BookDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, BookDTO.class))
                .collect(Collectors.toList());
        int total_count = bookMapper.bbsTotalCount(pageRequestDTO);
        PageResponseDTO<BookDTO> responseDTO = PageResponseDTO.<BookDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();
        return responseDTO;
    }

}
