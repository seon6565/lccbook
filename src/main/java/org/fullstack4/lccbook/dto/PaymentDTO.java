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
public class PaymentDTO {

    private int payment_idx;
	private int product_idx;
    private int price;
    private int quantity;
    private int total;
    private String product_name;
    private	String user_id;
    private	String recipient_name;
    private	String recipient_phone;
    private	String payment_method;
    private	String payment_company;
    private int	payment_number;
    private int	payment_amount;
    private	String payment_status;
    private LocalDate payment_date;
    private String recipient_addr;
    private int recipient_addrnum;
    private String order_state;
}
