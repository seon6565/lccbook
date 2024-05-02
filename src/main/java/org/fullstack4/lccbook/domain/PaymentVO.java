package org.fullstack4.lccbook.domain;

import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PaymentVO
{

  private int payment_idx;
  private int book_idx;
  private int product_price;
  private int product_sale_price;
  private String product_name;
  private String product_quantity;
  private String user_id;
  private String user_phone_number;
  private String user_name;
  private String user_email;
  private String recipient_name;
  private String recipient_phone;
  private String recipient_addr1;
  private String recipient_addr2;
  private String recipient_email;
  private int recipient_zipcode;
  private String payment_method;
  private String payment_company;
  private int payment_number;
  private int payment_amount;
  private int payment_delivery_fee;
  private String payment_status;
  private LocalDate payment_date;
  private String delivery_memo;
  private LocalDate refund_date;

/*
  private String name;
  private String email;
  private String phone_number;
  private String addr1;
  private String addr2;
  private String addr_number;
*/

}
