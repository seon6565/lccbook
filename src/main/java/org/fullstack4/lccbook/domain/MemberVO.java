package org.fullstack4.lccbook.domain;

import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberVO {
    private int member_idx;
    private String user_id;
    private String pwd;
    private String name;
    private String email;
    private String phone_number;
    private LocalDate birthday;
    private String addr1;
    private String addr2;
    private int addr_number;
    private char user_state;
    private LocalDate reg_date;
    private LocalDate leave_date;

}
