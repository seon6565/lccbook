package org.fullstack4.lccbook.mapper;

import java.util.List;

public interface BookMapper {
    int regist(Object Object);
    List<Object> list();
    Object view(int idx);
    int modify(Object Object);
    int delete(int idx);
}