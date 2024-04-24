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
public class BbsReplyDTO {
    private int idx;
    private int bbs_idx;
    private String user_id;
    private String title;
    private LocalDate reg_date;
    private LocalDate modify_date;
}
