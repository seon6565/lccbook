package org.fullstack4.lccbook.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.*;
import java.time.LocalDate;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BookDTO {

    private int book_idx;
    private String book_name;
    private int price;
    private int category_idx;
    private LocalDate reg_date;
    private String publisher;
    private String author;
    private String size;
    private int isbn;
    private int book_page;
    private String book_img;
    private String book_video;
    private int book_quantity;

}
