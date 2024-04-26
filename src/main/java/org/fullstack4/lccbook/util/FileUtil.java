package org.fullstack4.lccbook.util;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
@Log4j2
public class FileUtil {

    public List<String> fileuploads(MultipartHttpServletRequest files, String uploadFolder) {
        log.info("===========================");
        log.info("uploadFolder : " + uploadFolder);
        log.info("files : " + files);
        List<String> filenames = new ArrayList<>();
        List<MultipartFile> list = files.getFiles("files");
        if(files.getFile("files").getSize()<=0){
            return null;
        }
        for (MultipartFile file : list) {
            String fileRealName = file.getOriginalFilename();
            long size = file.getSize();
            String fileExt = fileRealName.substring(fileRealName.indexOf("."), fileRealName.length());

            log.info("fileRealName : " + fileRealName);
            log.info("size : " + size);
            log.info("fileExt : " + fileExt);
            UUID uuid = UUID.randomUUID();
            String[] uuids = uuid.toString().split("-");
            String newName = uuids[0] + fileRealName;

            log.info("uuid : " + uuid);
            log.info("uuids : " + uuids);
            log.info("newName : " + newName);
            File saveFile = new File(uploadFolder + "\\" + newName);
            try {
                file.transferTo(saveFile);
                filenames.add(newName);
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return filenames;

    }

    public void fileDelite(String file_directory, String file_name){
        File file = new File(file_directory+File.separator+file_name);
        file.delete();
    }
}
