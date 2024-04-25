package org.fullstack4.lccbook.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.service.MemberServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping("/anotice")
@RequiredArgsConstructor
public class AnoticeController {
    private final MemberServiceIf memberServiceIf;

    @GetMapping(value = "/view")
    public void view() {

    }

    @GetMapping(value = "/list")
    public void list() {

    }
    @GetMapping(value = "/regist")
    public void regist() {

    }
    @GetMapping(value = "/modify")
    public void modify() {

    }

    @GetMapping(value = "/delete")
    public void delete() {

    }
}
