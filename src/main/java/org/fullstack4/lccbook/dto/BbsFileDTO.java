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
public class BbsFileDTO {
    private int file_idx;
    private int bbs_idx;
    private String file_directory;
    private String file_name;
    private LocalDate reg_date;
}
