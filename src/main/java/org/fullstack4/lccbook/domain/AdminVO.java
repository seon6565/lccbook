package org.fullstack4.lccbook.domain;

import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AdminVO {
    private String admin_id;
    private String admin_pwd;
    private String admin_regdate;

}
