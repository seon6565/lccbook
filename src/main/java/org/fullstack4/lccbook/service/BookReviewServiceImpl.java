package org.fullstack4.lccbook.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.domain.BookReviewVO;
import org.fullstack4.lccbook.domain.BookVO;
import org.fullstack4.lccbook.dto.BookDTO;
import org.fullstack4.lccbook.dto.BookReviewDTO;
import org.fullstack4.lccbook.dto.PageRequestDTO;
import org.fullstack4.lccbook.dto.PageResponseDTO;
import org.fullstack4.lccbook.mapper.BookReviewMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class BookReviewServiceImpl implements BookReviewServiceIf{
    private final BookReviewMapper bookReviewMapper;
    private final ModelMapper modelMapper;

    @Override
    public int review_regist(BookReviewDTO bookReviewDTO) {
        BookReviewVO bookReviewVO = modelMapper.map(bookReviewDTO, BookReviewVO.class);
        log.info("==================");
        log.info("bookReviewDTO"+bookReviewDTO.toString());
        log.info("bookReviewVO"+bookReviewVO.toString());

        int result = bookReviewMapper.review_regist(bookReviewVO);

        log.info("result : "+result);
        return result;
    }

    @Override
    public List<BookReviewDTO> review_list(int book_idx) {
        List<BookReviewDTO> bookReviewDTOList = bookReviewMapper.review_list(book_idx).stream()
                .map(vo -> modelMapper.map(vo, BookReviewDTO.class))
                .collect(Collectors.toList());
        return bookReviewDTOList;
    }

    @Override
    public int delete(int review_idx) {
        int result = bookReviewMapper.delete(review_idx);
        return result;
    }

    @Override
    public int commentTotalCount(PageRequestDTO requestDTO) {
        return bookReviewMapper.commentTotalCount(requestDTO);
    }

    @Override
    public PageResponseDTO<BookReviewDTO> commentListByPage(PageRequestDTO pageRequestDTO) {
        List<BookReviewVO> voList = bookReviewMapper.commentListByPage(pageRequestDTO);
        List<BookReviewDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, BookReviewDTO.class))
                .collect(Collectors.toList());
        int total_count = bookReviewMapper.commentTotalCount(pageRequestDTO);
        PageResponseDTO<BookReviewDTO> responseDTO = PageResponseDTO.<BookReviewDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();
        return responseDTO;
    }
}
