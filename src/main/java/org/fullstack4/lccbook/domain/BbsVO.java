package org.fullstack4.lccbook.domain;

import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BbsVO {
    private int idx;
    private String user_id;
    private String title;
    private String content;
    private int read_cnt;
    private LocalDate display_date;
    private LocalDate reg_date;
    private LocalDate modify_date;
    private String interest;
    private int reply_cnt;
    private String image;
    private String video;
    private String file;
}
