package org.fullstack4.lccbook.service;

import java.util.List;

public interface IndexServiceIf {
    int regist(Object Object);
    List<Object> list();
    Object view(int idx);
    int modify(Object Object);
    int delete(int idx);

}
