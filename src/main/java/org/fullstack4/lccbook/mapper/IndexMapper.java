package org.fullstack4.lccbook.mapper;

import org.fullstack4.lccbook.domain.BbsVO;
import org.fullstack4.lccbook.dto.PageRequestDTO;

import java.util.List;

public interface IndexMapper {
    int regist(Object Object);
    List<Object> list();
    Object view(int idx);
    int modify(Object Object);
    int delete(int idx);
}
