package org.fullstack4.lccbook.controller.admin;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.dto.PageRequestDTO;
import org.fullstack4.lccbook.dto.PageResponseDTO;
import org.fullstack4.lccbook.dto.PaymentDTO;
import org.fullstack4.lccbook.service.PaymentServiceIf;
import org.fullstack4.lccbook.util.CommonLoginCheck;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Log4j2
@Controller
@RequestMapping("/admin/apayment")
@RequiredArgsConstructor
public class ApaymentController {
    private final PaymentServiceIf paymentServiceIf;
    private final CommonLoginCheck commonLoginCheck;

    @GetMapping("/list")
    public String list(@Valid PageRequestDTO pageRequestDTO, BindingResult bindingResult, HttpServletRequest request, RedirectAttributes redirectAttributes, Model model){
        if (bindingResult.hasErrors()){
            log.info("BbsController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
        }
        PageResponseDTO<PaymentDTO> responseDTO =paymentServiceIf.bbsListByPage(pageRequestDTO);
        log.info("responseDTO test"+responseDTO);
        model.addAttribute("responseDTO", responseDTO);
        if(responseDTO.getSearch_type()!=null) {
            for (String i : responseDTO.getSearch_type()) {
                if (i.equals("t")) {
                    model.addAttribute("search_typeflag_0", "checked");
                }
                if (i.equals("u")) {
                    model.addAttribute("search_typeflag_1", "checked");
                }
            }
        }
        return "/admin/apayment/list";
    }

    @GetMapping("/view")
    public String view(@RequestParam(name="payment_idx", defaultValue = "0") int payment_idx,
                       @RequestParam(name="book_idx" , defaultValue = "0") int book_idx,
                       Model model, HttpServletRequest request, RedirectAttributes redirectAttributes){
        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
        }
        PaymentDTO paymentDTO = paymentServiceIf.adminView(payment_idx,book_idx);
        model.addAttribute("paymentDTO",paymentDTO);
        return "/admin/apayment/view";
    }

    @PostMapping("/cancel")
    public String cancelPOST(@RequestParam(name="payment_idx", defaultValue = "0") int payment_idx,
                             @RequestParam(name="book_idx",defaultValue = "0") int book_idx,
                             @RequestParam(name="product_quantity",defaultValue = "0") int product_quantity,
                             @RequestParam(name="payment_status",defaultValue = "0") String payment_status,
                             RedirectAttributes redirectAttributes, HttpServletRequest request,
                             Model model){

        HttpSession session = request.getSession();

        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
        }

        paymentServiceIf.cancel(payment_idx,book_idx,product_quantity,payment_status);
        return "redirect:/admin/apayment/list";
    }

    @PostMapping("/cancelall")
    public String cancelallPOST(@RequestParam(name="payment_idx", defaultValue = "0") int payment_idx, RedirectAttributes redirectAttributes, HttpServletRequest request){
        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
        }
        int result = 0;// paymentServiceIf.cancelall(payment_idx);
        if(result > 0 ){
            return "redirect:/admin/apayment/view?payment_idx="+payment_idx;
        }
        else{
            return "/admin/apayment/view?payment_idx="+payment_idx;
        }
    }
    @PostMapping(value = "/modify")
    public String statusModify(@RequestParam(name="payment_idx", defaultValue = "0") int[] payment_idx,
                               @RequestParam(name="book_idx", defaultValue = "0") int[] book_idx,
                               @RequestParam(name="payment_status", defaultValue = "0") String[] payment_status,
                                    Model model,
                                    RedirectAttributes redirectAttributes, HttpServletRequest request){

        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
        }
       

        for(int i=0; i < payment_status.length; i++) {
           int result = paymentServiceIf.statusModify(payment_idx[i],book_idx[i],payment_status[i]);
        }
     /*   int result = noticeService.modify(noticeDTO);
        if(result > 0) {
            return "redirect:/admin/anotice/view?notice_idx=" + noticeDTO.getNotice_idx();
        } else {
            return "/admin/anotice/modify?notice_idx=" + noticeDTO.getNotice_idx();
        }*/
        return "redirect:/admin/apayment/list";
    }
}
