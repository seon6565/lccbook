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
public class NoticeDTO
{

    private int notice_idx;
    private String content;
    private String title;
    private LocalDate reg_date;
    private  LocalDate modify_date;
    private char notice_state;
}
