package org.fullstack4.lccbook.service;

import org.fullstack4.lccbook.dto.BbsFileDTO;

import java.util.List;

public interface BbsFileServiceIf {
    int regist(BbsFileDTO BbsFileDTO);
    List<BbsFileDTO> list();
    BbsFileDTO view(int file_idx);
    int delete(int file_idx);

    int lastindex();
}
