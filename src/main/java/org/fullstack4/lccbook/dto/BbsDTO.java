package org.fullstack4.lccbook.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.*;
import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BbsDTO {
    @PositiveOrZero
    private int idx;
    @NotBlank
    private String user_id;
    @NotBlank
    private String title;
    @NotBlank
    private String content;
    @Builder.Default
    @PositiveOrZero
    @Min(value=0)
    private int read_cnt=0;
    private LocalDate reg_date;
    private LocalDate modify_date;
    @Builder.Default
    @PositiveOrZero
    @Min(value=0)
    private int reply_cnt=0;
}
