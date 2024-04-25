package org.fullstack4.lccbook.domain;

import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class InStockVO {

    private int instock_idx;
    private int delivery_idx;
    private int quantity;
    private LocalDate reg_date;
}
