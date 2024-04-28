package org.fullstack4.lccbook.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.dto.*;
import org.fullstack4.lccbook.service.BbsFileServiceIf;
import org.fullstack4.lccbook.service.BbsReplyServiceIf;
import org.fullstack4.lccbook.service.BbsServiceIf;
import org.fullstack4.lccbook.util.CommonFileUtil;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.List;

@Log4j2
@Controller
@RequestMapping("/bbs")
@RequiredArgsConstructor
public class BbsController {
    private final BbsServiceIf bbsServiceIf;
    private final BbsReplyServiceIf bbsReplyServiceIf;
    private final BbsFileServiceIf bbsFileServiceIf;
    private final CommonFileUtil commonFileUtil;
    @GetMapping("/list")
    public void list(@Valid PageRequestDTO pageRequestDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes, Model model){
        log.info("===============================");
        log.info("BbsController >> list() START");
        log.info("pageRequestDTO : "+ pageRequestDTO.toString());

        if (bindingResult.hasErrors()){
            log.info("BbsController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

        PageResponseDTO<BbsDTO> responseDTO = bbsServiceIf.bbsListByPage(pageRequestDTO);
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

        log.info("responseDTO : "+ responseDTO.toString());
        log.info("BbsController >> list() END");
        log.info("===============================");
    }
    @GetMapping("/view")
    public void view(@RequestParam(name="idx", defaultValue = "0") int idx, Model model){
        log.info("============================");
        log.info("bbsController view");
        log.info("idx : " +idx);
        BbsDTO bbsDTO = bbsServiceIf.view(idx);
        List<BbsReplyDTO> bbsReplyDTO = bbsReplyServiceIf.reply_list(idx);
        log.info("bbsDTO : " +bbsDTO);
        log.info("============================");
        model.addAttribute("bbsDTO",bbsDTO);
        model.addAttribute("bbsReplyDTO",bbsReplyDTO);
        int bbs_idx = idx;
        List<BbsFileDTO> bbsFileDTOList = bbsFileServiceIf.list(bbs_idx);
        log.info("bbsFileDTOList : " +bbsFileDTOList);
        log.info("============================");
        model.addAttribute("bbsFileDTOList", bbsFileDTOList);
    }
    @GetMapping("/regist")
    public void registGET(){
        log.info("============================");
        log.info("bbsController registGET");
        log.info("============================");
    }
    @Transactional
    @PostMapping("/regist")
    public String registPOST(@Valid BbsDTO bbsDTO, BindingResult bindingResult, MultipartHttpServletRequest files
            ,RedirectAttributes redirectAttributes){
        log.info("============================");
        log.info("bbsController registPOST");
        log.info("bbsDTO : " +bbsDTO);
        log.info("============================");

        if(bindingResult.hasErrors()){
            log.info("bindingResult Errors : " +bbsDTO);
            redirectAttributes.addFlashAttribute("errors",bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("bbsDTO",bbsDTO);
            return "redirect:/bbs/regist";
        }

        String saveDirectory = "D:\\java4\\spring\\springweb\\springmvc\\src\\main\\webapp\\uploads";
        List<String> filenames = null;
        filenames = commonFileUtil.fileuploads(files,saveDirectory);;
        int result = bbsServiceIf.regist(bbsDTO);
        log.info("test result : "+result);
        if(result > 0 ){
            if(filenames!=null) {
                for (String filename : filenames) {
                    BbsFileDTO bbsFileDTO = BbsFileDTO.builder().bbs_idx(bbsFileServiceIf.lastindex()).file_directory(saveDirectory)
                            .file_name(filename).build();
                    int file_result = bbsFileServiceIf.regist(bbsFileDTO);
                }
            }
            return "redirect:/bbs/list";
        }
        else{
            return "/bbs/regist";
        }

    }
    @GetMapping("/modify")
    public void modifyGET(@RequestParam(name="idx", defaultValue = "0") int idx, Model model){
        log.info("============================");
        log.info("bbsController modifyGET");
        log.info("============================");
        BbsDTO bbsDTO = bbsServiceIf.view(idx);
        model.addAttribute("bbsDTO",bbsDTO);
    }
    @PostMapping("/modify")
    public String modifyPOST(@Valid BbsDTO bbsDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes){
        log.info("============================");
        log.info("bbsController modifyPOST");
        log.info("modifyPOST bbsDTO"+bbsDTO);
        log.info("============================");
        if(bindingResult.hasErrors()){
            log.info("bindingResult Errors : " +bbsDTO);
            redirectAttributes.addFlashAttribute("errors",bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("bbsDTO",bbsDTO);
            redirectAttributes.addAttribute("idx",bbsDTO.getIdx());
            return "redirect:/bbs/modify";
        }
        int result = bbsServiceIf.modify(bbsDTO);
        if(result > 0 ){
            return "redirect:/bbs/view?idx="+bbsDTO.getIdx();
        }
        else{
            return "/bbs/modify";
        }

    }
    @PostMapping("/delete")
    public String deletePOST(@RequestParam(name="idx", defaultValue = "0") int idx){
        log.info("============================");
        log.info("bbsController deletePOST");
        log.info("============================");
        int result = bbsServiceIf.delete(idx);
        if(result > 0 ){
            return "redirect:/bbs/list";
        }
        else{
            return "/bbs/view?idx="+idx;
        }
    }

    @GetMapping(value = "/fileDownload")
    public void fileDownload(String file_name, HttpServletResponse response, HttpServletRequest request){
        String saveDirectory = "D:\\java4\\spring\\springweb\\springmvc\\src\\main\\webapp\\uploads";
        commonFileUtil.fileDownload(saveDirectory,file_name,response,request);
    }

    @GetMapping(value = "/fileDelete")
    public String fileDelete(int file_idx, String idx){
        BbsFileDTO bbsFileDTO = bbsFileServiceIf.view(file_idx);
        String saveDirectory = "D:\\java4\\spring\\springweb\\springmvc\\src\\main\\webapp\\uploads";
        int result = bbsFileServiceIf.delete(file_idx);
        if(result>0) {
            commonFileUtil.fileDelite(bbsFileDTO.getFile_directory(), bbsFileDTO.getFile_name());
        }
        else{
            log.info("파일삭제실패");
        }
        return "redirect:/bbs/view?idx="+idx;
    }

}
