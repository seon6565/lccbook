package org.fullstack4.lccbook.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CartDTO
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





}
