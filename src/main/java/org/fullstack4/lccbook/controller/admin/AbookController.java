package org.fullstack4.lccbook.controller.admin;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.dto.BookDTO;
import org.fullstack4.lccbook.dto.PageRequestDTO;
import org.fullstack4.lccbook.dto.PageResponseDTO;
import org.fullstack4.lccbook.service.BookFileServiceIf;
import org.fullstack4.lccbook.service.BookServiceIf;
import org.fullstack4.lccbook.util.CommonFileUtil;
import org.fullstack4.lccbook.util.CommonLoginCheck;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Log4j2
@Controller
@RequestMapping("/admin/abook")
@RequiredArgsConstructor
public class AbookController {
    private final BookServiceIf bookServiceIf;
    private final BookFileServiceIf bookFileServiceIf;
    private final CommonFileUtil commonFileUtil;
    private final ServletContext servletContext;
    private final CommonLoginCheck commonLoginCheck;
    @GetMapping("/list")
    public String list(@Valid PageRequestDTO pageRequestDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes, Model model, HttpServletRequest request){
        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
        }
        if (bindingResult.hasErrors()){
            log.info("AbookController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

        PageResponseDTO<BookDTO> responseDTO = bookServiceIf.bbsListByPage(pageRequestDTO);
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
        return "/admin/abook/list";
    }
    @GetMapping("/view")
    public String view(@RequestParam(name="book_idx", defaultValue = "0") int book_idx, Model model, HttpServletRequest request, RedirectAttributes redirectAttributes){
        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
        }
        BookDTO bookDTO = bookServiceIf.view(book_idx);
        String book_img = bookDTO.getBook_img().replace("D:\\java4\\spring\\lccbook\\lccbook\\src\\main\\webapp\\resources\\img\\book\\","/resources/img/book/");
        model.addAttribute("book_img",book_img);
        model.addAttribute("bookDTO",bookDTO);
        return "/admin/abook/view";
    }
    @GetMapping("/regist")
    public String registGET(HttpServletRequest request, RedirectAttributes redirectAttributes){
        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
        }
        return "/admin/abook/regist";
    }

    @PostMapping("/regist")
    public String registPOST(BookDTO bookDTO, BindingResult bindingResult
            , HttpServletRequest request, RedirectAttributes redirectAttributes, MultipartHttpServletRequest files){
        if(bindingResult.hasErrors()){
            redirectAttributes.addFlashAttribute("errors",bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("bookDTO",bookDTO);
            return "redirect:/admin/abook/regist";
        }
        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
        }
        String saveDirectory = "D:\\java4\\spring\\lccbook\\lccbook\\src\\main\\webapp\\resources\\img\\book\\";
        List<String> filenames = null;
        filenames = commonFileUtil.fileuploads(files,saveDirectory);;
        int result = bookServiceIf.regist(bookDTO);
        if(result > 0 ){
            if(filenames!=null) {
                for (String filename : filenames) {
                    bookDTO.setBook_img(saveDirectory+filename);
                    bookDTO.setBook_idx(bookFileServiceIf.lastindex());
                    bookFileServiceIf.registimg(bookDTO);
                }
            }
            return "redirect:/admin/abook/list";
        }
        else{
            return "/admin/abook/regist";
        }
    }


    @GetMapping("/modify")
    public String modifyGET(@RequestParam(name="book_idx", defaultValue = "0") int book_idx, Model model, HttpServletRequest request, RedirectAttributes redirectAttributes){
        BookDTO bookDTO = bookServiceIf.view(book_idx);
        String book_img = bookDTO.getBook_img().replace("D:\\java4\\spring\\lccbook\\lccbook\\src\\main\\webapp\\resources\\img\\book\\","/resources/img/book/");
        model.addAttribute("book_img",book_img);
        model.addAttribute("bookDTO",bookDTO);

        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
        }
        return "/admin/abook/modify";
    }
    @Transactional
    @PostMapping("/modify")
    public String modifyPOST(@Valid BookDTO bookDTO, BindingResult bindingResult,RedirectAttributes redirectAttributes,HttpServletRequest request, MultipartHttpServletRequest files){
        if(bindingResult.hasErrors()){
            log.info("bindingResult Errors : " +bookDTO);
            redirectAttributes.addFlashAttribute("errors",bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("bookDTO",bookDTO);
            redirectAttributes.addAttribute("book_idx",bookDTO.getBook_idx());
            return "redirect:/admin/abook/modify";
        }
        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
        }
        String saveDirectory = "D:\\java4\\spring\\lccbook\\lccbook\\src\\main\\webapp\\resources\\img\\book\\";
        List<String> filenames = null;
        filenames = commonFileUtil.fileuploads(files,saveDirectory);;
        int result = bookServiceIf.modify(bookDTO);
        log.info("test result : "+result);
        if(result > 0 ){
            if(filenames!=null) {
                for (String filename : filenames) {
                    bookDTO.setBook_img(saveDirectory+filename);
                    int file_result = bookFileServiceIf.registimg(bookDTO);
                }
            }
            return "redirect:/admin/abook/view?book_idx="+bookDTO.getBook_idx();
        }
        else{
            return "/admin/abook/modify";
        }
    }
    @PostMapping("/delete")
    public String deletePOST(@RequestParam(name="book_idx", defaultValue = "0") int book_idx, HttpServletRequest request, RedirectAttributes redirectAttributes){
        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
        }
        BookDTO bookDTO = bookServiceIf.view(book_idx);
        String file_full_directory = bookDTO.getBook_img();
        int result = bookServiceIf.delete(book_idx);
        if(result > 0 ){
            commonFileUtil.fileDelite(file_full_directory);
            return "redirect:/admin/abook/list";
        }
        else{
            return "/admin/abook/view?book_idx="+book_idx;
        }
    }

    @PostMapping("/deletecheck")
    public String deleteCheckPOST(@RequestParam(name="book_idx", defaultValue = "0") int[] book_idx, RedirectAttributes redirectAttributes, HttpServletRequest request){
        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
        }
        for(int i : book_idx) {
            bookServiceIf.delete(i);
        }
        return "redirect:/admin/abook/list";
    }
}
