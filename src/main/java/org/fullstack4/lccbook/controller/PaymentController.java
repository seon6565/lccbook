package org.fullstack4.lccbook.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.dto.MemberDTO;
import org.fullstack4.lccbook.dto.PaymentDTO;
import org.fullstack4.lccbook.service.PaymentServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Log4j2
@Controller
@RequestMapping("/payment")
@RequiredArgsConstructor
public class PaymentController {
    private final PaymentServiceIf paymentServiceIf;

    @GetMapping(value = "/view")
    public String view(@RequestParam(name="idx", defaultValue = "0") int idx, Model model, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        PaymentDTO paymentDTO = paymentServiceIf.view(idx);
        HttpSession httpsSession = request.getSession();
        MemberDTO memberDTO = (MemberDTO) httpsSession.getAttribute("memberDTO");
        String loginId = memberDTO.getUser_id();
        if(!loginId.equals(paymentDTO.getUser_id())){
            redirectAttributes.addFlashAttribute("errorAlert","<script> alert('본인 결제 내역만 열람 가능합니다.') </script>");
            return "redirect:/";
        }
        model.addAttribute("paymentDTO",paymentDTO);
        return "/payment/view";
    }

}
