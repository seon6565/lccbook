package org.fullstack4.lccbook.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.domain.DeliveryVO;
import org.fullstack4.lccbook.dto.DeliveryDTO;
import org.fullstack4.lccbook.dto.PageRequestDTO;
import org.fullstack4.lccbook.dto.PageResponseDTO;
import org.fullstack4.lccbook.mapper.DeliveryMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class DeliveryServiceImpl implements DeliveryServiceIf {
    private final DeliveryMapper deliveryMapper;
    private final ModelMapper modelMapper;

    @Override
    public List<DeliveryDTO> list() {
        List<DeliveryDTO> deliveryDTOList = deliveryMapper.list().stream().map(vo->modelMapper.map(vo,DeliveryDTO.class)).collect(Collectors.toList());
        return deliveryDTOList;
    }

    @Override
    public DeliveryDTO view(int idx) {
        DeliveryVO deliveryVO = deliveryMapper.view(idx);
        DeliveryDTO deliveryDTO = modelMapper.map(deliveryVO,DeliveryDTO.class);
        return deliveryDTO;
    }
    @Override
    public int modify(DeliveryDTO deliveryDTO) {
        DeliveryVO deliveryVO = modelMapper.map(deliveryDTO, DeliveryVO.class);
        int result = deliveryMapper.modify(deliveryVO);

        return result;
    }

    @Override
    public int delete(int idx) {
        return deliveryMapper.delete(idx);
    }

    @Override
    public int bbsTotalCount(PageRequestDTO requestDTO) {
        return deliveryMapper.bbsTotalCount(requestDTO);
    }

    @Override
    public PageResponseDTO<DeliveryDTO> bbsListByPage(PageRequestDTO pageRequestDTO) {
        List<DeliveryVO> voList = deliveryMapper.bbsListByPage(pageRequestDTO);
        List<DeliveryDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, DeliveryDTO.class))
                .collect(Collectors.toList());
        int total_count = deliveryMapper.bbsTotalCount(pageRequestDTO);
        PageResponseDTO<DeliveryDTO> responseDTO = PageResponseDTO.<DeliveryDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();
        return responseDTO;
    }

}