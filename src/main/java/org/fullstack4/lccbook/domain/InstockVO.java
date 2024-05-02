package org.fullstack4.lccbook.domain;

import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class InstockVO {

    private int instock_idx;
    private int book_idx;
    private String delivery_number;
    private int quantity;
    private LocalDate reg_date;
}
