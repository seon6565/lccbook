package org.fullstack4.lccbook.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.dto.BookDTO;
import org.fullstack4.lccbook.dto.FaqDTO;
import org.fullstack4.lccbook.dto.NoticeDTO;
import org.fullstack4.lccbook.dto.QnaDTO;
import org.fullstack4.lccbook.mapper.IndexMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class IndexServiceImpl implements IndexServiceIf{
    private final ModelMapper modelMapper;
    private final IndexMapper indexMapper;

    @Override
    public int regist(Object Object) {
        return 0;
    }

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

    @Override
    public int delete(int idx) {
        return 0;
    }

    @Override
    public List<BookDTO> newList() {
        List<BookDTO> bookDTONewList = indexMapper.newList().stream().map(vo->modelMapper.map(vo,BookDTO.class)).collect(Collectors.toList());
        return bookDTONewList;
    }

    @Override
    public List<BookDTO> bestList() {
        List<BookDTO> bookDTOBestList = indexMapper.bestList().stream().map(vo->modelMapper.map(vo,BookDTO.class)).collect(Collectors.toList());
        return bookDTOBestList;
    }

    @Override
    public List<NoticeDTO> noticeList() {
        List<NoticeDTO> noticeDTOList = indexMapper.noticeList().stream().map(vo->modelMapper.map(vo,NoticeDTO.class)).collect(Collectors.toList());
        return noticeDTOList;
    }

    @Override
    public List<FaqDTO> faqList() {
        List<FaqDTO> faqDTOList = indexMapper.faqList().stream().map(vo->modelMapper.map(vo,FaqDTO.class)).collect(Collectors.toList());
        return faqDTOList;
    }

    @Override
    public List<QnaDTO> qnaList() {
        List<QnaDTO> qnaDTOList = indexMapper.qnaList().stream().map(vo->modelMapper.map(vo,QnaDTO.class)).collect(Collectors.toList());
        return qnaDTOList;
    }
}
