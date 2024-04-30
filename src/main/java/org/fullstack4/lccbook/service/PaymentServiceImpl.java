package org.fullstack4.lccbook.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.domain.PaymentVO;
import org.fullstack4.lccbook.dto.CartDTO;
import org.fullstack4.lccbook.dto.PaymentDTO;
import org.fullstack4.lccbook.mapper.CartMapper;
import org.fullstack4.lccbook.mapper.PaymentMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class PaymentServiceImpl implements PaymentServiceIf {
    private final PaymentMapper paymentMapper;
    private final ModelMapper modelMapper;
    private final CartMapper cartMapper;
    @Override
    @Transactional
    public int regist(PaymentDTO paymentDTO) {


        int result= 0;
        int result1=0;

      /*  System.out.println("paymentDTO  : " + paymentDTO.toString());
        System.out.println("paymentDTO.getUser_id()  : " + paymentDTO.getUser_id());*/
        String user_id = paymentDTO.getUser_id();

        result1 = paymentMapper.registOrder(user_id);
       // System.out.println("result1  : " + result1);

        int result3= 0;

        result3= paymentMapper.lastindex();

        if(paymentDTO.getBook_idxs() != null) {
            System.out.println("여기로 들어오면 안됨");
            int[] book_idxs = paymentDTO.getBook_idxs();
            int[] product_prices = paymentDTO.getProduct_prices();
            int[] product_sale_prices = paymentDTO.getProduct_sale_prices();
            String[] product_names = paymentDTO.getProduct_names();
            int[] product_quantitys = paymentDTO.getProduct_quantitys();

            for (int i = 0; i < book_idxs.length; i++) {

                System.out.println("여기 실행됨?");
                paymentDTO.setBook_idx(book_idxs[i]);

                paymentDTO.setPayment_idx(result3);
                paymentDTO.setProduct_price(product_prices[i]);
                paymentDTO.setProduct_sale_price(product_sale_prices[i]);
                paymentDTO.setProduct_name(product_names[i]);
                paymentDTO.setProduct_quantity(product_quantitys[i]);

                // System.out.println("payMentDTO : " + paymentDTO.toString());
                PaymentVO paymentVO = modelMapper.map(paymentDTO, PaymentVO.class);
                result = paymentMapper.regist(paymentVO);

            }

        }
        else{
            System.out.println("여기로 들어와야함");

            PaymentVO paymentVO = modelMapper.map(paymentDTO, PaymentVO.class);
            result = paymentMapper.regist(paymentVO);
        }


        return result;
    }


    @Override
    public List<PaymentDTO> list() {
        List<PaymentDTO> paymentDTOList = paymentMapper.list().stream().map(vo->modelMapper.map(vo,PaymentDTO.class)).collect(Collectors.toList());
        return paymentDTOList;
    }

    @Override
    public List<PaymentDTO> listUser(String user_id) {
        List<PaymentDTO> paymentDTOList = paymentMapper.listUser(user_id).stream().map(vo->modelMapper.map(vo,PaymentDTO.class)).collect(Collectors.toList());
        return paymentDTOList;
    }

    @Override
    public PaymentDTO view(int idx) {
        PaymentVO paymentVO = paymentMapper.view(idx);
        PaymentDTO paymentDTO = modelMapper.map(paymentVO,PaymentDTO.class);
        return paymentDTO;
    }
    @Override
    public int modify(PaymentDTO paymentDTO) {
        PaymentVO paymentVO = modelMapper.map(paymentDTO, PaymentVO.class);
        int result = paymentMapper.modify(paymentVO);

        return result;
    }

    @Override
    public int delete(int idx) {
        return paymentMapper.delete(idx);
    }



   /* @Override
    public List<CartDTO>cartOrderList(int idx) {
        List<CartDTO> cartDTOList = cartMapper.list().stream().map(vo->modelMapper.map(vo,CartDTO.class)).collect(Collectors.toList());
        return cartDTOList;
    }*/
}
