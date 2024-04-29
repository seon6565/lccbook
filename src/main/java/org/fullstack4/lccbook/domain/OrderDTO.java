package org.fullstack4.lccbook.domain;

import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OrderDTO {
    private int order_idx;
    private String user_id;
    private LocalDate order_date;
    private String order_status;
    private int total_sale_price;
}
