package org.fullstack4.lccbook.controller.admin;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.dto.*;
import org.fullstack4.lccbook.service.InstockServiceIf;
import org.fullstack4.lccbook.util.CommonLoginCheck;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Log4j2
@Controller
@RequestMapping("/admin/ainstock")
@RequiredArgsConstructor
public class AinstockController {

    private final InstockServiceIf instockServiceIf;
    private final CommonLoginCheck commonLoginCheck;

    @GetMapping(value ="/list")
    public String ainstockList(@Valid PageRequestDTO pageRequestDTO
            , BindingResult bindingResult
            , RedirectAttributes redirectAttributes
            , Model model
            , HttpServletRequest request){

        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
        }
        if (bindingResult.hasErrors()) {
            log.info("BookController >> list errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
        System.out.println("pageRequestDTO  controller: " + pageRequestDTO);
        PageResponseDTO<InstockDTO> responseDTO = instockServiceIf.bbsListByPage(pageRequestDTO);
        model.addAttribute("responseDTO", responseDTO);
        System.out.println("responseDTO ainstockList controller: " + responseDTO.toString());
        return "/admin/ainstock/list";

    }
/*
    @GetMapping(value = "/view")
    public void deliveryView(Model model,
                             @RequestParam(name="delivery_idx", defaultValue = "0") int delivery_idx){
        DeliveryDTO deliveryDTO = deliveryService.view(delivery_idx);
        model.addAttribute("deliveryDTO", deliveryDTO);
    }

    @GetMapping(value = "/modify")
    public void deliveryModify(Model model, @RequestParam(name="delivery_idx", defaultValue = "0") int delivery_idx){
        DeliveryDTO deliveryDTO = deliveryService.view(delivery_idx);
        model.addAttribute("deliveryDTO", deliveryDTO);
    }

    @PostMapping(value = "/modify")
    public String deliveryModify(@Valid DeliveryDTO deliveryDTO){
        log.info("test delivertdto" + deliveryDTO);
        int result = deliveryService.modify(deliveryDTO);
        if(result > 0 ) {
            return "redirect:/admin/adelivery/view?delivery_idx=" + deliveryDTO.getDelivery_idx();
        } else {
            return "/admin/adelivery/modify?delivery_idx=" + deliveryDTO.getDelivery_idx();
        }

    }*/


    @PostMapping("/regist")
    public String registPOST(@Valid InstockDTO instockDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes, HttpServletRequest request){
        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
        }
        System.out.println("instock controller : " + instockDTO.toString());
     /*   if(bindingResult.hasErrors()){
            redirectAttributes.addFlashAttribute("errors",bindingResult.getAllErrors());
            return "redirect:/admin/adminmember/regist";
        }*/
        int result = instockServiceIf.regist(instockDTO);
        return "redirect:/admin/ainstock/list";

    }


}

