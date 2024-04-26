package org.fullstack4.lccbook.domain;

import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BbsFileVO {
    private int file_idx;
    private int bbs_idx;
    private String file_directory;
    private String file_name;
    private LocalDate reg_date;

}
