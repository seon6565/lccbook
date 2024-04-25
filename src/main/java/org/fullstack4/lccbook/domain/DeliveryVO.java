package org.fullstack4.lccbook.domain;

import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DeliveryVO {
    private int delivery_idx;
    private String company_name;
    private String phone_number;
    private LocalDate start_date;
    private LocalDate end_date;
    private int delivery_number;
    private String state;
    private LocalDate create_date;
    private LocalDate update_date;
}
