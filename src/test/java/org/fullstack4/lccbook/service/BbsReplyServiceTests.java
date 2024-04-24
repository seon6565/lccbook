package org.fullstack4.lccbook.service;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.dto.BbsReplyDTO;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class BbsReplyServiceTests {
    @Autowired()
    private BbsReplyServiceIf bbsReplyServiceIf;
    @Test
    public void testReplyRegist(){
        BbsReplyDTO bbsReplyDTO = BbsReplyDTO.builder()
                .user_id("test")
                .title("test에서 제목 테스트").bbs_idx(141)
                .build();
        int result = bbsReplyServiceIf.reply_regist(bbsReplyDTO);
    }


}
