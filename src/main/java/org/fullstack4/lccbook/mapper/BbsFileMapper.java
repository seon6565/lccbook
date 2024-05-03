package org.fullstack4.lccbook.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack4.lccbook.domain.BbsFileVO;

import java.util.List;

public interface BbsFileMapper {
    int regist(BbsFileVO bbsFileVO);
    List<BbsFileVO> list(@Param("bbs_idx") int bbs_idx);
    BbsFileVO view(int file_idx);
    int delete(@Param("file_idx") int file_idx);
    int lastindex();
}
