package org.fullstack4.lccbook.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j2
@Service
@RequiredArgsConstructor
public class PaymentServiceImpl implements PaymentServiceIf {

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
}
