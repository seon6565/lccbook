package org.fullstack4.lccbook.domain;

import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class NoticeVO
{

    private int notice_idx;
    private String content;
    private String title;
    private LocalDate reg_date;
    private char notice_state;
}
