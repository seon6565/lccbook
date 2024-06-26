package org.fullstack4.lccbook.domain;

import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BookVO {

    private int book_idx;
    private String book_name;
    private int price;
    private int sale_price;
    private String category_idx;
    private LocalDate reg_date;
    private LocalDate modify_date;
    private String publisher;
    private String author;
    private String size;
    private String isbn;
    private int book_page;
    private String book_img;
    private String book_video;
    private int book_quantity;
    private int reply_cnt;

    private CategoryVO categoryVO;
    private String category;
    private String age;
    private String cate;
    private String cate1;
    private String cate2;
    private String cate3;

}
