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
    private int order_idx;
    private String company_name;
    private String company_number;
    private LocalDate start_date;
    private LocalDate end_date;
    private String delivery_state;
    private int delivery_number;
    private String recipient_name;
    private String recipient_number;
    private String addr1;
    private String addr2;
    private int zip_code;
    private String email;
    private String memo;
}
