package org.fullstack4.lccbook.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.domain.BookVO;
import org.fullstack4.lccbook.dto.BookDTO;
import org.fullstack4.lccbook.mapper.BookFileMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Log4j2
@Service
@RequiredArgsConstructor
public class BookFileServiceImpl implements BookFileServiceIf{
    private final BookFileMapper bookFileMapper;
    private final ModelMapper modelMapper;
    @Override
    public int registimg(BookDTO bookDTO) {
        BookVO bookVO = modelMapper.map(bookDTO, BookVO.class);
        int result = bookFileMapper.registimg(bookVO);

        return result;
    }

    @Override
    public int deleteimg(int file_idx) {
        return bookFileMapper.deleteimg(file_idx);
    }

    @Override
    public int registvideo(BookDTO bookDTO) {
        BookVO bookVO = modelMapper.map(bookDTO, BookVO.class);
        int result = bookFileMapper.registvideo(bookVO);

        return result;
    }

    @Override
    public int deletevideo(int file_idx) {
        return bookFileMapper.deletevideo(file_idx);
    }



}
