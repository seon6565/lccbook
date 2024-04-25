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
public class QnaDTO {
    private int qna_idx;
    private String user_id;
    private String question_title;
    private String question_content;
    private LocalDate question_regdate;
    private String answer_id;
    private String answer_content;
    private LocalDate answer_regdate;
    private char answer_yn;
}
