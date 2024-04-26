package org.fullstack4.lccbook.mapper;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.lccbook.domain.BbsVO;
import org.fullstack4.lccbook.dto.*;
import org.fullstack4.lccbook.service.*;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.time.LocalDate;
import java.util.List;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
@Log4j2
public class BbsMapperTests {
    @Autowired(required = false)
    private BookMapper bookMapper;
    private CartMapper cartMapper;
    private DeliveryMapper deliveryMapper;
    private FaqMapper faqMapper;
    private MemberMapper memberMapper;
    private NoticeMapper noticeMapper;
    private PaymentMapper paymentMapper;
    private QnaMapper qnaMapper;
    private BbsMapper bbsMapper;
    @Autowired(required = false)
    private BookServiceIf bookServiceIf;

    @Autowired(required = false)
    private CartServiceIf cartServiceIf;

    @Autowired(required = false)
    private QnaServiceIf qnaServiceIf;

    @Autowired(required = false)
    private NoticeServiceIf noticeServiceIf;

    @Autowired(required = false)
    private FaqServiceIf faqServiceIf;

    @Autowired(required = false)
    private DeliveryServiceIf deliveryServiceIf;

    @Autowired(required = false)
    private MemberServiceIf memberServiceIf;

    @Autowired(required = false)
    private PaymentServiceIf paymentServiceIf;



    @Test
    public void testBbsTotalCount(){
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                .page(1).page_size(10)
                .build();
        int totalCount = bbsMapper.bbsTotalCount(pageRequestDTO);
        log.info("======================================");
        log.info("testBbsTotalCount : "+totalCount);
        log.info("======================================");
    }

    @Test
    public void testModify(){
        BookDTO bookDTO = new BookDTO().builder()
                .price(6000)
                .book_name("책이름수정")
                .category_idx(2)
                .publisher("출판수정")
                .author("작가수정")
                .size("77x77")
                .isbn(22222)
                .book_page(77)
                .book_img("modify.jpg")
                .book_video("modify.mp4")
                .book_quantity(77)
                .book_idx(1)
                .build();
        int bookModify = bookServiceIf.modify(bookDTO);
        log.info("bookModify :" + bookModify);

        //수량변경
        CartDTO cartDTO = new CartDTO().builder()
                .quantity(8)
                .book_idx(1)
                .cart_idx(1)
                .build();
        int cartModify =  cartServiceIf.modify(cartDTO);
        log.info("cartModify : " + cartModify);

        QnaDTO qnaDTO = new QnaDTO().builder()
                .question_title("질문 수정제목")
                .qna_idx(1)
                .question_content("질문 수정내용")
                .build();
        int qnaModify  = qnaServiceIf.modify(qnaDTO);
        log.info("qnaModify : " + qnaModify);

        NoticeDTO noticeDTO = new NoticeDTO().builder()
                .content("공지사항 수정내용")
                .notice_idx(1)
                .title("공지사항 수정제목")
                .build();
        int noticeModify = noticeServiceIf.modify(noticeDTO);
        log.info("noticeModify : " + noticeModify);

        FaqDTO faqDTO = new FaqDTO().builder()
                .faq_idx(1)
                .faq_title("faq 수정제목")
                .faq_content("faq 수정내용")
                .answer_content("답변 수정내용")
                .build();
        int faqModify = faqServiceIf.modify(faqDTO);
        log.info("faqModify : " + faqModify);
        DeliveryDTO deliveryDTO = new DeliveryDTO().builder()
                .delivery_idx(1)
                .state("출고")
                .build();
        int deliveryModify = deliveryServiceIf.modify(deliveryDTO);
        log.info("deliveryModify : " + deliveryModify);

        MemberDTO memberDTO = new MemberDTO().builder()
                .member_idx(1)
                .pwd("1234")
                .email("modify@naver.com")
                .phone_number("010-7777-7777")
                .birthday("2000-02-05")
                .addr1("수정 주소1")
                .addr2("수정 상세주소")
                .addr_number(777)
                .build();
        int memberModify= memberServiceIf.modify(memberDTO);
        log.info("memberModify" + memberModify);

        PaymentDTO paymentDTO =new PaymentDTO().builder()
                .payment_idx(1)
                .payment_status("판매완료")
                .order_state("배송완료")
                .build();
        int paymentModify = paymentServiceIf.modify(paymentDTO);
        log.info("paymentModify" + paymentModify);

    }

    @Test
    public void testRegist(){
            BookDTO bookDTO = new BookDTO().builder()
                    .author("작가")
                    .book_name("책이름")
                    .book_page(11)
                    .book_quantity(11)
                    .category_idx(1)
                    .isbn("61651")
                    .price(5000)
                    .publisher("출판")
                    .size("12x12")
                    .build();
            int bookRegist = bookServiceIf.regist(bookDTO);
            System.out.println("bookRegist  : " + bookRegist);

            CartDTO cartDTO = new CartDTO().builder()
                    .user_id("test")
                    .book_idx(1)
                    .quantity(12)
                    .checked('N')
                    .book_name("책이름")
                    .build();
            int cartRegist =  cartServiceIf.regist(cartDTO);
            System.out.println("cartRegist : " + cartRegist);

            QnaDTO qnaDTO = new QnaDTO().builder()
                    .user_id("test")
                    .question_title("질문제목")
                    .question_content("질문내용")

                    .build();
            int qnaRegist  = qnaServiceIf.regist(qnaDTO);
            System.out.println("qnaRegist : " + qnaRegist);

            NoticeDTO noticeDTO = new NoticeDTO().builder()
                    .content("공지사항 내용")
                    .title("공지사항 제목")
                    .build();
            int noticeRegist = noticeServiceIf.regist(noticeDTO);
            System.out.println("noticeRegist : " + noticeRegist);

            FaqDTO faqDTO = new FaqDTO().builder()
                    .faq_title("faq제목")
                    .faq_content("faq내용")
                    .answer_content("답변내용")
                    .build();
            int faqRegist = faqServiceIf.regist(faqDTO);
            System.out.println("faqRegist : " + faqRegist);

            DeliveryDTO deliveryDTO = new DeliveryDTO().builder()
                    .company_name("회사이름")
                    .phone_number("010-1111-1111")
                    .delivery_number(5465)
                    .state("입고")
                    .build();
            int deliveryRegist = deliveryServiceIf.regist(deliveryDTO);
            System.out.println("deliveryRegist : " + deliveryRegist);


        MemberDTO memberDTO = new MemberDTO().builder()
                .user_id("test")
                .pwd("1234")
                .name("최세아")
                .email("adf@naver.com")
                .phone_number("010-111-1122")
                .birthday(LocalDate.parse("1998-02-05"))
                .addr1("주소1")
                .addr2("상세주소")
                .addr_number(132101)
                .build();
        int memberJoin= memberServiceIf.join(memberDTO);
        System.out.println("memberJoin" + memberJoin);


        PaymentDTO paymentDTO =new PaymentDTO().builder()
                .product_idx(2)
                .price(777)
                .quantity(888)
                .total(9999)
                .product_name("동화책임")
                .user_id("test")
                .recipient_name("최세아친구")
                .recipient_phone("010-7777-7777")
                .payment_method("카드")
                .payment_company("주식회사")
                .payment_amount(9999)
                .payment_number(2312321)
                .payment_status("판매중")
                .recipient_addr("수신자 주소")
                .recipient_addrnum(2323)
                .order_state("입고전")
                .build();
        int paymentRegist = paymentServiceIf.regist(paymentDTO);
        System.out.println("paymentRegist" + paymentRegist);


    }

    @Test
    public void testList(){

        List<BookDTO> bookList = bookServiceIf.list();
        bookList.forEach(list->log.info("bookList" + list));

        List<QnaDTO> qnaList = qnaServiceIf.list();
        qnaList.forEach(list-> log.info("qnaList" + list));

        List<PaymentDTO> paymentList= paymentServiceIf.list();
        paymentList.forEach(list ->log.info("paymentList : " + paymentList));

        List<NoticeDTO> noticeList = noticeServiceIf.list();
        noticeList.forEach(list->log.info("noticeList" + list));

        List<FaqDTO> faqList = faqServiceIf.list();
        faqList.forEach(list->log.info("faqList: " + faqList));

        List<DeliveryDTO> deliverLIst = deliveryServiceIf.list();
        deliverLIst.forEach(list->log.info("deliverList : " + deliverLIst));

        List<CartDTO> cartList = cartServiceIf.list();
        cartList.forEach(list->log.info("cartList : " + cartList));


    }

    @Test
    public void testBbsListByPage(){
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                .page(1).page_size(10).build();
        List<BbsVO> bbsList = bbsMapper.bbsListByPage(pageRequestDTO);
        log.info("======================================");
        bbsList.forEach(list->log.info(list));
        log.info("======================================");



    }

    @Test
    public void testBbsListBySearch(){
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                .page(1).page_size(10).search_type(new String[]{"t","u"})
                .search_word("테스트").build();
        int total_count = bbsMapper.bbsTotalCount(pageRequestDTO);
        List<BbsVO> bbsList = bbsMapper.bbsListByPage(pageRequestDTO);
        log.info("======================================");
        log.info("total_count: "+total_count);
        bbsList.forEach(list->log.info(list));
        log.info("======================================");
    }
}
