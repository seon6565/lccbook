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
    public void view(@RequestParam(name="book_idx", defaultValue = "0") int book_idx, Model model){
        BookDTO bookDTO = bookServiceIf.view(book_idx);
        log.info("test bookdto "+ bookDTO);
        model.addAttribute("bookDTO",bookDTO);
    }
    @GetMapping("/regist")
    public void registGET(){

    }

    @PostMapping("/regist")
    public String registPOST(BookDTO bookDTO, BindingResult bindingResult
            , HttpServletRequest request, RedirectAttributes redirectAttributes){
        if(bindingResult.hasErrors()){
            redirectAttributes.addFlashAttribute("errors",bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("bookDTO",bookDTO);
            return "redirect:/admin/abook/regist";
        }
        HttpSession session = request.getSession();
        if(session.getAttribute("adminDTO")==null) {
            return commonLoginCheck.adminCheck(request, redirectAttributes);
        }
        int result = bookServiceIf.regist(bookDTO);
        if(result > 0 ){
            return "redirect:/admin/abook/list";
        }
        else{
            return "/admin/abook/list";
        }

    }


    @GetMapping("/modify")
    public void modifyGET(@RequestParam(name="book_idx", defaultValue = "0") int book_idx, Model model){
        BookDTO bookDTO = bookServiceIf.view(book_idx);
        log.info("bookDTO test " + bookDTO);
        model.addAttribute("bookDTO",bookDTO);
    }
    @Transactional
    @PostMapping("/modify")
    public String modifyPOST(@Valid BookDTO bookDTO, BindingResult bindingResult,RedirectAttributes redirectAttributes){
        if(bindingResult.hasErrors()){
            log.info("bindingResult Errors : " +bookDTO);
            redirectAttributes.addFlashAttribute("errors",bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("bookDTO",bookDTO);
            redirectAttributes.addAttribute("book_idx",bookDTO.getBook_idx());
            return "redirect:/admin/abook/modify";
        }
        int result = bookServiceIf.modify(bookDTO);
        if(result > 0 ){
            return "redirect:/admin/abook/view?book_idx="+bookDTO.getBook_idx();
        }
        else{
            return "/admin/abook/modify";
        }

    }
    @PostMapping("/delete")
    public String deletePOST(@RequestParam(name="book_idx", defaultValue = "0") int book_idx){
        int result = bookServiceIf.delete(book_idx);
        if(result > 0 ){
            return "redirect:/admin/abook/list";
        }
        else{
            return "/admin/abook/view?book_idx="+book_idx;
        }
    }

    @Transactional
    @PostMapping("/registimg")
    public String registimgPOST(@Valid BookDTO bookDTO, BindingResult bindingResult, MultipartHttpServletRequest files
            ,RedirectAttributes redirectAttributes){

        if(bindingResult.hasErrors()){
            log.info("bindingResult Errors : " +bookDTO);
            redirectAttributes.addFlashAttribute("errors",bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("bookDTO",bookDTO);
            return "redirect:/admin/abook/regist";
        }

        //String saveDirectory = servletContext.getRealPath("/resources/uploads");
        //String saveDirectory = "D:\java4\spring\lccbook\lccbook\build\libs\exploded\lccbook-1.0-SNAPSHOT.war\resources";
        String saveDirectory = "D:\\java4\\spring\\lccbook\\lccbook\\src\\main\\webapp\\resources\\img\\book";
        List<String> filenames = null;
        filenames = commonFileUtil.fileuploads(files,saveDirectory);;
        int result = bookFileServiceIf.registimg(bookDTO);
        log.info("test result : "+result);
        if(result > 0 ){
            if(filenames!=null) {
                for (String filename : filenames) {
                    BookDTO bookFileDTO = BookDTO.builder().book_idx(bookDTO.getBook_idx()).book_img(saveDirectory+filename).build();
                    int file_result = bookFileServiceIf.registimg(bookFileDTO);
                }
            }
            return "redirect:/admin/abook/list";
        }
        else{
            return "/admin/abook/regist";
        }

    }

    @Transactional
    @PostMapping("/registvideo")
    public String registvideoPOST(@Valid BookDTO bookDTO, BindingResult bindingResult, MultipartHttpServletRequest files
            ,RedirectAttributes redirectAttributes){

        if(bindingResult.hasErrors()){
            log.info("bindingResult Errors : " +bookDTO);
            redirectAttributes.addFlashAttribute("errors",bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("bookDTO",bookDTO);
            return "redirect:/abook/regist";
        }

        //String saveDirectory = servletContext.getRealPath("/resources/uploads");
        //String saveDirectory = "D:\java4\spring\lccbook\lccbook\build\libs\exploded\lccbook-1.0-SNAPSHOT.war\resources";
        String saveDirectory = "D:\\java4\\spring\\lccbook\\lccbook\\src\\main\\webapp\\resources\\video";
        List<String> filenames = null;
        filenames = commonFileUtil.fileuploads(files,saveDirectory);;
        int result = bookFileServiceIf.registimg(bookDTO);
        log.info("test result : "+result);
        if(result > 0 ){
            if(filenames!=null) {
                for (String filename : filenames) {
                    BookDTO bookFileDTO = BookDTO.builder().book_idx(bookDTO.getBook_idx()).book_video(saveDirectory+filename).build();
                    int file_result = bookFileServiceIf.registimg(bookFileDTO);
                }
            }
            return "redirect:/abook/list";
        }
        else{
            return "/abook/regist";
        }
    }

    @GetMapping(value = "/deleteimg")
    public String deleteimgPOST(int book_idx){
        BookDTO bookDTO = bookServiceIf.view(book_idx);
        String directoryfilename = bookDTO.getBook_img();
        String directory = bookDTO.getBook_img().substring(bookDTO.getBook_img().lastIndexOf("\\"));
        String filename = bookDTO.getBook_img().substring(0,bookDTO.getBook_img().lastIndexOf("\\"));
        log.info("directory test : " + directory);
        log.info("filename test : " + filename);

        int result = bookFileServiceIf.deleteimg(book_idx);
        if(result>0) {
            commonFileUtil.fileDelite(directory, filename);
        }
        else{
            log.info("파일삭제실패");
        }
        return "redirect:/abook/view?book_idx="+book_idx;
    }

    @GetMapping(value = "/deletevideo")
    public String deletevideoPOST(int book_idx){
        BookDTO bookDTO = bookServiceIf.view(book_idx);
        String directoryfilename = bookDTO.getBook_video();
        String directory = bookDTO.getBook_video().substring(bookDTO.getBook_video().lastIndexOf("\\"));
        String filename = bookDTO.getBook_video().substring(0,bookDTO.getBook_video().lastIndexOf("\\"));
        log.info("directory test : " + directory);
        log.info("filename test : " + filename);

        int result = bookFileServiceIf.deleteimg(book_idx);
        if(result>0) {
            commonFileUtil.fileDelite(directory, filename);
        }
        else{
            log.info("파일삭제실패");
        }
        return "redirect:/abook/view?book_idx="+book_idx;
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
