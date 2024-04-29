package org.fullstack4.lccbook.domain;

import lombok.*;

@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OrderDetailVO {
    private int order_detail_idx;
    private int order_idx;
    private int product_idx;
    private int quantity;
    private int sale_price;
}
