package org.fullstack4.lccbook.domain;

import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OrderVO {

    private int payment_idx;
    private String user_id;
    private LocalDate reg_date;
}
