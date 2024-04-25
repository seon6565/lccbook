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
public class BookReviewDTO {
    private int review_idx;
    private int book_idx;
    private String user_id;
    private LocalDate reg_date;
    private String review_content;
    private int rating;
}
