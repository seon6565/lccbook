package org.fullstack4.lccbook.service;

import org.fullstack4.lccbook.dto.BbsReplyDTO;

import java.util.List;

public interface BbsReplyServiceIf {
    int reply_regist(BbsReplyDTO BbsReplyDTO);
    List<BbsReplyDTO> reply_list(int bbs_idx);

    int delete(int idx);
}
