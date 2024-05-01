package org.fullstack4.lccbook.domain;

import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CartVO
{
    private int cart_idx;
    private String user_id;
    private int book_idx;
    private String book_name;
    private int quantity;
    private LocalDate cart_regdate;
    private char checked;
    private int total_price;
    private String book_img;
    private int sale_price;
    private int price;
    private int total_sale_price;

    //
    private int book_quantity;




}
