package org.fullstack4.lccbook.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.PastOrPresent;
import javax.validation.constraints.Pattern;
import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberDTO {

    private int member_idx;
    @Pattern(regexp = "^[A-Za-z0-9]{5,15}$")
    private String user_id;
    @Pattern(regexp = "^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{10,16}$")
    private String pwd;
    @Pattern(regexp = "^[가-힣A-Za-z]{1,10}$")
    private String name;
    @Pattern(regexp = "\\w+@\\w+\\.\\w+(\\.\\w+)?")
    private String email;
    private String phone_number;
    @NotNull
    @PastOrPresent
    private String birthday;
    private String addr1;
    private String addr2;
    private int addr_number;
    private char user_state;
    private LocalDate reg_date;
    private LocalDate leave_date;
}
