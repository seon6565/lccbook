package org.fullstack4.lccbook.controller.admin;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping("/admin/adelivery")
@RequiredArgsConstructor
public class AdeliveryController {

    @GetMapping(value ="/list")
    public void adeliveryList(){

    }
}
