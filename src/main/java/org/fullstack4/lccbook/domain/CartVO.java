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
    private int quantity;
    private LocalDate cart_regdate;
    private char checked;
}