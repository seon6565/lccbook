package org.fullstack4.lccbook.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.dto.BookDTO;
import org.fullstack4.lccbook.dto.CartDTO;
import org.fullstack4.lccbook.dto.PageRequestDTO;
import org.fullstack4.lccbook.dto.PageResponseDTO;
import org.fullstack4.lccbook.service.CartServiceIf;
import org.fullstack4.lccbook.service.MemberServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;

@Log4j2
@Controller
@RequestMapping("/cart")
@RequiredArgsConstructor
public class CartController {
    private final CartServiceIf cartServiceIf;

    @GetMapping(value = "/view")
    public void view() {

    }

    @GetMapping(value = "/list")
    public void list(@Valid
             RedirectAttributes redirectAttributes
            , Model model) {


        List<CartDTO> cartList = cartServiceIf.list();

        model.addAttribute("cartList", cartList);

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
