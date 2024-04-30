package org.fullstack4.lccbook.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.dto.BookDTO;
import org.fullstack4.lccbook.dto.CartDTO;
import org.fullstack4.lccbook.dto.PaymentDTO;
import org.fullstack4.lccbook.service.CartServiceIf;
import org.fullstack4.lccbook.service.MemberServiceIf;
import org.fullstack4.lccbook.service.PaymentServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Log4j2
@Controller
@RequestMapping("/payment")
@RequiredArgsConstructor
public class PaymentController {
    private final PaymentServiceIf paymentServiceIf;
    private final CartServiceIf cartServiceIf;


    @GetMapping(value = "/view")
    public void view() {

    }

    @GetMapping(value="/directList")
    public void list(@RequestParam(name="book_idx",required = false ) int book_idx,
                     @RequestParam(name="book_name",required = false ) String book_name,
                     @RequestParam(name="price",required = false ) int price,
                     @RequestParam(name="sale_price",required = false ) int sale_price,
                     @RequestParam(name="quantity",required = false ) int quantity,
                     @RequestParam(name="book_img",required = false) String book_img,
                     Model model)
                        {

            model.addAttribute("book_idx",book_idx);
            model.addAttribute("book_name",book_name);
            model.addAttribute("price",price);
            model.addAttribute("sale_price",sale_price);
            model.addAttribute("quantity",quantity);
            model.addAttribute("book_img",book_img);


    }


    @GetMapping(value = "/list")
    public void list(@RequestParam(name="cart_idx",required = false) int[] cart_idx,
                     @RequestParam(name="quantity",required = false) int[] quantity,
                     @RequestParam(name="book_idx",required = false) int[] book_idx,
                     Model model) {



        for(int i =0; i<quantity.length;i++){
            int result = cartServiceIf.modify(cart_idx[i],quantity[i],book_idx[i]);
        }

        List<CartDTO> cartList = new ArrayList<>();
        for (int number : cart_idx) {
            CartDTO dto = cartServiceIf.view(number);
            cartList.add(dto);
        }

        for(CartDTO c : cartList){
            System.out.println("cartDTO : " + c.toString());

        }


        List<Integer> quantityList = new ArrayList<>();
        model.addAttribute("quantityList",quantityList);
        model.addAttribute("cartList", cartList);

    }

    @PostMapping(value = "/regist")
    public void regist( PaymentDTO paymentDTO
                                    ,Model model) {

        System.out.println("paymentDTO : " + paymentDTO.toString());
        System.out.println("paymentDTO product_name: " + paymentDTO.getProduct_name());
        int result = paymentServiceIf.regist(paymentDTO);


    }
    @GetMapping(value = "/modify")
    public void modify() {

    }

    @GetMapping(value = "/delete")
    public void delete() {

    }
}
