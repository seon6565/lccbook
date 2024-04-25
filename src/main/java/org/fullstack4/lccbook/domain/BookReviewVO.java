package org.fullstack4.lccbook.domain;

import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BookReviewVO {
    private int review_idx;
    private int book_idx;
    private String user_id;
    private LocalDate reg_date;
    private String review_content;
    private int rating;
}
