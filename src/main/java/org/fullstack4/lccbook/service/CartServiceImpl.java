package org.fullstack4.lccbook.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.domain.CartVO;
import org.fullstack4.lccbook.dto.CartDTO;
import org.fullstack4.lccbook.mapper.CartMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class CartServiceImpl implements CartServiceIf{
    private final CartMapper cartMapper;
    private final ModelMapper modelMapper;

    @Override
    public int regist(CartDTO cartDTO) {
        CartVO cartVO = modelMapper.map(cartDTO, CartVO.class);
        int result = cartMapper.regist(cartVO);

        return result;
    }

    @Override
    public List<CartDTO> list() {
        List<CartDTO> cartDTOList = cartMapper.list().stream().map(vo->modelMapper.map(vo,CartDTO.class)).collect(Collectors.toList());
        return cartDTOList;
    }

    @Override
    public CartDTO view(int idx) {
        CartVO cartVO = cartMapper.view(idx);
        CartDTO cartDTO = modelMapper.map(cartVO,CartDTO.class);
        return cartDTO;
    }

    @Override
    public int modify(CartDTO cartDTO) {
        CartVO cartVO = modelMapper.map(cartDTO, CartVO.class);
        int result = cartMapper.modify(cartVO);

        return result;
    }

    @Override
    public int delete(int idx) {
        return cartMapper.delete(idx);
    }
}
