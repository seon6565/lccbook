package org.fullstack4.lccbook.domain;

import lombok.*;

@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FaqVO {
    private int faq_idx;
    private String faq_content;
    private String faq_title;
    private String answer_content;
}
