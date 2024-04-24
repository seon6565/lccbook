package org.fullstack4.lccbook.mapper;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.domain.BbsReplyVO;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
@Log4j2
public class BbsReplyTests {
    @Autowired(required = false)
    BbsReplyMapper bbsReplyMapper;

    @Test
    public void testBbsReplyRegist(){
        BbsReplyVO bbsReplyVO = BbsReplyVO.builder()
                .bbs_idx(51).user_id("test").title("댓글테스트").build();

        int result = bbsReplyMapper.reply_regist(bbsReplyVO);

    }


}
