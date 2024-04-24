package org.fullstack4.lccbook.domain;

import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BbsReplyVO {
    private int idx;
    private int bbs_idx;
    private String user_id;
    private String title;
    private LocalDate reg_date;
    private LocalDate modify_date;
}
