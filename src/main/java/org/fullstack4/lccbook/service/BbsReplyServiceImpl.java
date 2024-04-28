package org.fullstack4.lccbook.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.domain.BbsReplyVO;
import org.fullstack4.lccbook.dto.BbsReplyDTO;
import org.fullstack4.lccbook.mapper.BbsReplyMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class BbsReplyServiceImpl implements BbsReplyServiceIf{
    private final BbsReplyMapper bbsReplyXMLMapper;
    private final ModelMapper modelMapper;
    @Override
    @Transactional
    public int reply_regist(BbsReplyDTO bbsReplyDTO) {
        log.info("========================");
        log.info("BbsReplyServiceImpl regist(bbsDTO)" + bbsReplyDTO);

        BbsReplyVO bbsReplyVO = modelMapper.map(bbsReplyDTO, BbsReplyVO.class);
        int result = bbsReplyXMLMapper.reply_regist(bbsReplyVO);
        int reply_result = bbsReplyXMLMapper.update_reply_cnt(bbsReplyDTO.getBbs_idx());
        log.info("BbsReplyServiceImpl bbsReplyVO" + bbsReplyVO);
        log.info("BbsReplyServiceImpl result :" + result);
        log.info("BbsReplyServiceImpl reply_result :" + reply_result);
        log.info("========================");

        return result;
    }

    @Override
    public List<BbsReplyDTO> reply_list(int bbs_idx) {
        List<BbsReplyDTO> BbsReplyDTOList = bbsReplyXMLMapper.reply_list(bbs_idx).stream().map(vo->modelMapper.map(vo,BbsReplyDTO.class)).collect(Collectors.toList());
        return BbsReplyDTOList;
    }

    @Override
    public int delete(int idx) {
        return bbsReplyXMLMapper.delete(idx);
    }
}
