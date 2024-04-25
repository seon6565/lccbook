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
public class InStockDTO {

    private int instock_idx;
    private int delivery_idx;
    private int quantity;
    private LocalDate reg_date;
}
