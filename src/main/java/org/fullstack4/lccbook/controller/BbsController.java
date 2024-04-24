package org.fullstack4.lccbook.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.dto.BbsDTO;
import org.fullstack4.lccbook.dto.BbsReplyDTO;
import org.fullstack4.lccbook.dto.PageRequestDTO;
import org.fullstack4.lccbook.dto.PageResponseDTO;
import org.fullstack4.lccbook.service.BbsReplyServiceIf;
import org.fullstack4.lccbook.service.BbsServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.io.File;
import java.util.List;
import java.util.UUID;

@Log4j2
@Controller
@RequestMapping("/bbs")
@RequiredArgsConstructor
public class BbsController {
    private final BbsServiceIf bbsServiceIf;
    private final BbsReplyServiceIf bbsReplyServiceIf;
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
    }
    @GetMapping("/regist")
    public void registGET(){
        log.info("============================");
        log.info("bbsController registGET");
        log.info("============================");
    }
    @PostMapping("/regist")
    public String registPOST(@Valid BbsDTO bbsDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes){
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


        int result = bbsServiceIf.regist(bbsDTO);
        if(result > 0 ){
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

    @GetMapping("/fileupload")
    public String fileUploadGET(){
        return "bbs/fileupload";
    }


    @PostMapping(value = "/fileupload")
    public String fileUploadPost(@RequestParam("file")MultipartFile file){
        String uploadFolder = "D:\\java4\\spring\\springweb\\lccbook\\src\\main\\webapp\\uploads";
        //경로수정필요
        String fileRealName = file.getOriginalFilename();
        long size = file.getSize();
        String fileExt = fileRealName.substring(fileRealName.indexOf("."),fileRealName.length());
        log.info("===========================");
        log.info("uploadFolder : "+uploadFolder);
        log.info("fileRealName : "+fileRealName);
        log.info("size : "+size);
        log.info("fileExt : "+fileExt);

        UUID uuid = UUID.randomUUID();
        String[] uuids = uuid.toString().split("-");
        String newName = uuids[0]+fileRealName;

        log.info("uuid : "+uuid);
        log.info("uuids : "+uuids);
        log.info("newName : "+newName);

        File saveFile = new File(uploadFolder+"\\"+newName);
        try{
            file.transferTo(saveFile);
        }catch (IllegalStateException e){
            e.printStackTrace();
        }catch (Exception e){
            e.printStackTrace();
        }
        log.info("===========================");
        return "/bbs/fileupload";
    }

    @PostMapping(value = "/fileupload2")
    public String fileUploadPost2(MultipartHttpServletRequest files){
        String uploadFolder = "D:\\java4\\spring\\springweb\\lccbook\\src\\main\\webapp\\uploads";
        //경로수정필요
        log.info("===========================");
        log.info("uploadFolder : "+uploadFolder);
        List<MultipartFile> list = files.getFiles("files");
        for(MultipartFile file : list){
            String fileRealName = file.getOriginalFilename();
            long size = file.getSize();
            String fileExt = fileRealName.substring(fileRealName.indexOf("."),fileRealName.length());

            log.info("fileRealName : "+fileRealName);
            log.info("size : "+size);
            log.info("fileExt : "+fileExt);
            UUID uuid = UUID.randomUUID();
            String[] uuids = uuid.toString().split("-");
            String newName = uuids[0]+fileRealName;

            log.info("uuid : "+uuid);
            log.info("uuids : "+uuids);
            log.info("newName : "+newName);
            File saveFile = new File(uploadFolder+"\\"+newName);
            try{
                file.transferTo(saveFile);
            }catch (IllegalStateException e){
                e.printStackTrace();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        log.info("===========================");
        return "/bbs/fileupload";
    }


}
