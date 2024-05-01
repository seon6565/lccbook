package org.fullstack4.lccbook.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.dto.*;
import org.fullstack4.lccbook.service.CartServiceIf;
import org.fullstack4.lccbook.service.MemberServiceIf;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
            , Model model, HttpServletRequest request
    ) {

        HttpSession session = request.getSession();
        MemberDTO memberDTO  = (MemberDTO) session.getAttribute("memberDTO");
        String user_id = memberDTO.getUser_id();
        List<CartDTO> cartList = cartServiceIf.list(user_id);

        cartList.forEach(list -> System.out.println("quantity : " +list.getQuantity()));
        model.addAttribute("cartList", cartList);

    }
    @PostMapping(value = "/regist")
    @ResponseBody
    public ResponseEntity<?> regist(@Valid @RequestBody CartDTO cartDTO,

                       BindingResult bindingResult
                    , RedirectAttributes redirectAttributes) {
        System.out.println("cartDTO" + cartDTO.toString());


        int result = cartServiceIf.regist(cartDTO);
        if(result>0){
            // 장바구니에 상품 추가 성공
            Map<String, Object> response = new HashMap<>();
            response.put("success", true);
            response.put("message", "장바구니에 상품을 담았습니다.");
            response.put("redirect", "/cart/list");

            return ResponseEntity.ok().body(response);
        }else{
            // 장바구니에 이미 상품이 있어서 추가 실패
            Map<String, Object> response = new HashMap<>();
            response.put("success", false);
            response.put("message", "해당 상품은 이미 장바구니에 추가되어있습니다.");

            return ResponseEntity.ok().body(response);
        }

    }

    /*@PostMapping(value = "/directRegist")
    public void directRegist(@Valid  CartDTO cartDTO,

                                    BindingResult bindingResult
            , RedirectAttributes redirectAttributes) {
        System.out.println("cartDTO" + cartDTO.toString());


        int result = cartServiceIf.regist(cartDTO);
        if(result>0){
            // 장바구니에 상품 추가 성공
            Map<String, Object> response = new HashMap<>();
            response.put("success", true);
            response.put("message", "장바구니에 상품을 담았습니다.");
            response.put("redirect", "/cart/list");


        }else{
            // 장바구니에 이미 상품이 있어서 추가 실패
            Map<String, Object> response = new HashMap<>();
            response.put("success", false);
            response.put("message", "해당 상품은 이미 장바구니에 추가되어있습니다.");


        }

    }*/




    @GetMapping(value = "/modify")
    public void modify() {

    }
    @GetMapping(value="/delete")
    public String delete(@RequestParam(name = "cart_idx", required = false) String cartIdxStr) {
        if (cartIdxStr == null || cartIdxStr.isEmpty()) {
            System.out.println("선택된 상품이 없습니다.");
            return "redirect:/cart/list";
        }

        // 쉼표로 구분된 문자열을 분리하여 배열로 변환
        int[] cartIds = Arrays.stream(cartIdxStr.split(","))
                .mapToInt(Integer::parseInt)
                .toArray();

        System.out.println("cartIds의 길이: " + cartIds.length);

        int result =0;
        for (int cartId : cartIds) {
            System.out.println("cartId: " + cartId);
            result = cartServiceIf.delete(cartId);


        }
        System.out.println("삭제 result : " + result);
        return "redirect:/cart/list";
    }

 /*   @PostMapping(value = "/delete")
    public String delete(@RequestParam(name ="cart_idx", required = false) int[] cartIds) {

        System.out.println("cartIDS" + cartIds.length );
        boolean isSuccess = true;

        for(int cartId : cartIds) {
            int result = cartServiceIf.delete(cartId);
            if(result == 0) { // 삭제 실패한 경우가 하나라도 있다면
                isSuccess = false;
                break;
            }
        }

        if(isSuccess){
            return "redirect:/cart/list";
        } else {
            return "/cart/list";
        }
    }*/
}
