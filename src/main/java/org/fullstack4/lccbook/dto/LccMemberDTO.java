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
public class LccMemberDTO {

    private int member_idx;
    private String user_id;
    private String pwd;
    private String name;
    private String email;
    private String phone_number;
    private String birthday;
    private String addr1;
    private String addr2;
    private int addr_number;
    private char user_state;
    private LocalDate reg_date;
    private LocalDate leave_date;
}
