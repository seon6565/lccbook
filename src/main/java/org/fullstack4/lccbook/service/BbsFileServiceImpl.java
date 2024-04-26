package org.fullstack4.lccbook.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.domain.BbsFileVO;
import org.fullstack4.lccbook.dto.BbsFileDTO;
import org.fullstack4.lccbook.mapper.BbsFileMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class BbsFileServiceImpl implements BbsFileServiceIf{
    private final BbsFileMapper bbsFileMapper;
    private final ModelMapper modelMapper;
    @Override
    public int regist(BbsFileDTO bbsFileDTO) {

        BbsFileVO bbsFileVO = modelMapper.map(bbsFileDTO, BbsFileVO.class);
        int result = bbsFileMapper.regist(bbsFileVO);

        return result;
    }

    @Override
    public List<BbsFileDTO> list(int bbs_idx) {
        List<BbsFileDTO> bbsFileDTOList = bbsFileMapper.list(bbs_idx).stream().map(vo->modelMapper.map(vo,BbsFileDTO.class)).collect(Collectors.toList());
        return bbsFileDTOList;
    }

    @Override
    public BbsFileDTO view(int file_idx) {
        BbsFileVO bbsFileVO = bbsFileMapper.view(file_idx);
        BbsFileDTO bbsFileDTO = modelMapper.map(bbsFileVO,BbsFileDTO.class);
        return bbsFileDTO;
    }


    @Override
    public int delete(int file_idx) {
        return bbsFileMapper.delete(file_idx);
    }

    @Override
    public int lastindex() {
        return bbsFileMapper.lastindex();
    }


}
