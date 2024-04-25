package org.fullstack4.lccbook.domain;

import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class QnaVO {
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
