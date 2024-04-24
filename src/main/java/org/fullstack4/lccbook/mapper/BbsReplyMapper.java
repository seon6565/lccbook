package org.fullstack4.lccbook.mapper;

import org.fullstack4.lccbook.domain.BbsReplyVO;

import java.util.List;

public interface BbsReplyMapper {
    int reply_regist(BbsReplyVO bbsReplyVO);
    List<BbsReplyVO> reply_list(int bbs_idx);
    int update_reply_cnt(int bbs_idx);
}
