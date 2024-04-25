package org.fullstack4.lccbook.service;

import org.fullstack4.lccbook.dto.BbsDTO;
import org.fullstack4.lccbook.dto.PageRequestDTO;
import org.fullstack4.lccbook.dto.PageResponseDTO;

import java.util.List;

public interface QnaServiceIf {
    int regist(Object Object);
    List<Object> list();
    Object view(int idx);
    int modify(Object Object);
    int delete(int idx);



}
