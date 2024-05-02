package org.fullstack4.lccbook.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.domain.DeliveryVO;
import org.fullstack4.lccbook.domain.PaymentVO;
import org.fullstack4.lccbook.dto.*;
import org.fullstack4.lccbook.mapper.BookMapper;
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
    private final BookMapper bookMapper;
    private final CartMapper cartMapper;
    @Override
    @Transactional
    public int regist(PaymentDTO paymentDTO) {


        int result= 0;
        int result1=0;
        int quantity_result =0;
        int delivery_result =0;
        int cart_delete_result =0;


        String user_id = paymentDTO.getUser_id();

        result1 = paymentMapper.registOrder(user_id); //주문테이블 등록
        if(result1 <=0){
            throw new RuntimeException("RuntimeException for rollback");
        }


        int result3= 0;

        result3= paymentMapper.lastindex();

        if(paymentDTO.getBook_idxs() != null) {


            int[] book_idxs = paymentDTO.getBook_idxs();
            int[] product_prices = paymentDTO.getProduct_prices();
            int[] product_sale_prices = paymentDTO.getProduct_sale_prices();
            String[] product_names = paymentDTO.getProduct_names();
            int[] product_quantitys = paymentDTO.getProduct_quantitys();
            /*for(int i=0; i<product_prices.length; i++) {
                total_quantity += product_prices[i];
                System.out.println("paymentServiceImpl total_quantity : " + total_quantity);

            }*/

            for (int i = 0; i < book_idxs.length; i++) {


                paymentDTO.setBook_idx(book_idxs[i]);

                paymentDTO.setPayment_idx(result3);
                paymentDTO.setProduct_price(product_prices[i]);
                paymentDTO.setProduct_sale_price(product_sale_prices[i]);
                paymentDTO.setProduct_name(product_names[i]);
                paymentDTO.setProduct_quantity(product_quantitys[i]);

                // System.out.println("payMentDTO : " + paymentDTO.toString());
                PaymentVO paymentVO = modelMapper.map(paymentDTO, PaymentVO.class);

                // 결제 처리
                result = paymentMapper.regist(paymentVO);
                if(result <=0){
                    throw new RuntimeException("RuntimeException for rollback");
                }



                //수량업데이트
                quantity_result = paymentMapper.updateQuantity(product_quantitys[i], book_idxs[i]);
                if(quantity_result <=0){
                    throw new RuntimeException("RuntimeException for rollback, 재고가 없습니다");
                }

                //카트 비우기
                cart_delete_result = paymentMapper.cartDelete(user_id,book_idxs[i]);
                if(cart_delete_result <=0){
                    throw new RuntimeException("RuntimeException for rollback, 카트 삭제 오류");
                }



            }

            PaymentVO paymentVO2 = modelMapper.map(paymentDTO, PaymentVO.class);
            // 배송테이블 삽입

            delivery_result = paymentMapper.insertDelivery(paymentVO2);
            if(delivery_result <=0){
                throw new RuntimeException("RuntimeException for rollback");
            }

        }
        else{

            paymentDTO.setPayment_idx(result3);
            PaymentVO paymentVO = modelMapper.map(paymentDTO, PaymentVO.class);


            result = paymentMapper.regist(paymentVO);
            if(result <=0){
                throw new RuntimeException("RuntimeException for rollback");
            }


            quantity_result =  paymentMapper.updateQuantity(paymentDTO.getProduct_quantity(),paymentDTO.getBook_idx());


            if(quantity_result <=0){
                throw new RuntimeException("RuntimeException for rollback");
            }

            // 배송테이블 삽입

            delivery_result = paymentMapper.insertDelivery(paymentVO);
            if(delivery_result <=0){
                throw new RuntimeException("RuntimeException for rollback");
            }

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

        for(PaymentDTO dto : paymentDTOList){
            System.out.println("유저 결제내역  :" + dto.toString());
        }

        return paymentDTOList;
    }

    @Override
    public PaymentDTO view(int idx) {
        PaymentVO paymentVO = paymentMapper.view(idx);
        PaymentDTO paymentDTO = modelMapper.map(paymentVO,PaymentDTO.class);
        return paymentDTO;
    }

    @Override
    public PaymentDTO DetailView(int payment_idx, int book_idx) {
        PaymentVO paymentVO = paymentMapper.DetailView(payment_idx,book_idx);
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

    @Override
    public PageResponseDTO<PaymentDTO> bbsListByPage(PageRequestDTO pageRequestDTO) {
        List<PaymentVO> voList = paymentMapper.bbsListByPage(pageRequestDTO);
        List<PaymentDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, PaymentDTO.class))
                .collect(Collectors.toList());
        int total_count = paymentMapper.bbsTotalCount(pageRequestDTO);
        PageResponseDTO<PaymentDTO> responseDTO = PageResponseDTO.<PaymentDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();
        return responseDTO;
    }


    @Override
    public int statusModify(int paymentIdx, int bookIdx, String paymentStatus) {
        PaymentDTO paymentDTO = new PaymentDTO();
        paymentDTO.setPayment_idx(paymentIdx);
        paymentDTO.setBook_idx(bookIdx);
        paymentDTO.setPayment_status(paymentStatus);
        PaymentVO paymentVO = modelMapper.map(paymentDTO, PaymentVO.class);

        //결제상태 변경
        int result = paymentMapper.statusModify(paymentVO);
        if(result<=0){
            throw new RuntimeException("RuntimeException for rollback 결제상태 변경오류");
        }

        // 상품 수량 변경


        return result;

    }

    @Override
    public List<PaymentDTO> complete(String user_id, int payment_idx) {
        List<PaymentDTO> paymentDTOList = paymentMapper.complete(user_id,payment_idx).stream().map(vo->modelMapper.map(vo,PaymentDTO.class)).collect(Collectors.toList());

        return paymentDTOList;
    }

    @Override
    public PaymentDTO adminView(int paymentIdx, int bookIdx) {
        PaymentVO paymentVO = paymentMapper.adminView(paymentIdx,bookIdx);
        PaymentDTO paymentDTO = modelMapper.map(paymentVO,PaymentDTO.class);
        return paymentDTO;
    }

    @Transactional
    @Override
    public void cancel(int paymentIdx, int bookIdx, int productQuantity, String payment_status) {

        PaymentDTO paymentDTO = new PaymentDTO();
        paymentDTO.setPayment_idx(paymentIdx);
        paymentDTO.setBook_idx(bookIdx);
        paymentDTO.setProduct_quantity(productQuantity);
        paymentDTO.setPayment_status(payment_status);

        System.out.println("cancel : " + paymentDTO);

        PaymentVO paymentVO = modelMapper.map(paymentDTO, PaymentVO.class);

        //결제상태 변경
        int result = paymentMapper.statusModify(paymentVO);
        if(result <=0){
            throw new RuntimeException("RuntimeException for rollback");
        }

        //수량 감소
        System.out.println("paymentcacel bookIDX: " + bookIdx + "paymentCancel productQuantity : " + productQuantity);
        int quantityResult = paymentMapper.cancelQuantity(bookIdx,productQuantity);
        System.out.println("quantityResult aadsada" + quantityResult);
        if(quantityResult <=0){
            throw new RuntimeException("RuntimeException for rollback cancel 롤백");
        }


    }



   /* @Override
    public List<CartDTO>cartOrderList(int idx) {
        List<CartDTO> cartDTOList = cartMapper.list().stream().map(vo->modelMapper.map(vo,CartDTO.class)).collect(Collectors.toList());
        return cartDTOList;
    }*/
}
