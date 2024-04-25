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
public class DeliveryDTO {
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
