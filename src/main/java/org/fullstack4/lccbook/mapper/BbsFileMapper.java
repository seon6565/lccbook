package org.fullstack4.lccbook.mapper;

import org.fullstack4.lccbook.domain.BbsFileVO;

import java.util.List;

public interface BbsFileMapper {
    int regist(BbsFileVO bbsFileVO);
    List<BbsFileVO> list();
    BbsFileVO view(int file_idx);
    int delete(int file_idx);

    int lastindex();
}
