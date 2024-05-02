package org.fullstack4.lccbook.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.dto.BookDTO;
import org.fullstack4.lccbook.dto.CartDTO;
import org.fullstack4.lccbook.dto.MemberDTO;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Log4j2
@Controller
@RequestMapping("/payment")
@RequiredArgsConstructor
public class PaymentController {
    private final PaymentServiceIf paymentServiceIf;
    private final CartServiceIf cartServiceIf;
    private final MemberServiceIf memberServiceIf;


    @GetMapping(value = "/view")
    public void view(@RequestParam(name="payment_idx") int payment_idx,
                     @RequestParam(name="book_idx") int book_idx,
                     Model model) {
        PaymentDTO paymentDTO = paymentServiceIf.DetailView(payment_idx,book_idx );
        System.out.println("paymentDTO controller : " + paymentDTO);

        model.addAttribute("paymentDTO",paymentDTO);

    }

    @GetMapping(value="/directList")
    public void list(@RequestParam(name="book_idx",required = false ) int book_idx,
                     @RequestParam(name="book_name",required = false ) String book_name,
                     @RequestParam(name="price",required = false ) int price,
                     @RequestParam(name="sale_price",required = false ) int sale_price,
                     @RequestParam(name="quantity",required = false ) int quantity,
                     @RequestParam(name="book_img",required = false) String book_img,
                     HttpServletRequest request,
                     Model model)
                        {
            HttpSession session = request.getSession();
            MemberDTO dto = (MemberDTO)session.getAttribute("memberDTO");

            String user_id = dto.getUser_id();

            MemberDTO memberDTO = memberServiceIf.view(user_id);

            model.addAttribute("memberDTO",memberDTO);
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


        System.out.println("paymentContoller : "+cart_idx.length);
        System.out.println("paymentContoller : "+quantity.length);
        System.out.println("paymentContoller : "+book_idx.length);

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
    public String regist(PaymentDTO paymentDTO
                                    , Model model, RedirectAttributes redirectAttributes) {

        System.out.println("paymentDTO : " + paymentDTO.toString());

        int result = paymentServiceIf.regist(paymentDTO);

        redirectAttributes.addAttribute("user_id", paymentDTO.getUser_id());
        redirectAttributes.addAttribute("payment_idx", paymentDTO.getPayment_idx());

        return "redirect:/payment/complete";


    }
    @GetMapping(value = "/complete")
    public void modify(@RequestParam(name="user_id",required = false) String user_id ,
                       @RequestParam(name="payment_idx",required = false) int payment_idx,Model model ) {

        List<PaymentDTO> paymentDTO  = paymentServiceIf.complete(user_id,payment_idx);
        for( PaymentDTO p : paymentDTO){
            System.out.println("paymentDTO : " + p.toString());
        }

        model.addAttribute("paymentDTO",paymentDTO);
    }

    @GetMapping(value = "/delete")
    public void delete() {

    }


}
