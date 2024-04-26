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
    @Pattern(regexp = "\\d{2,3}-\\d{3,4}-\\d{4}")
    private String phone_number;
    @NotNull
    @PastOrPresent
    private LocalDate birthday;
    @NotNull
    private String addr1;
    @NotNull
    private String addr2;
    @NotNull
    private int addr_number;
    private char user_state;
    private LocalDate reg_date;
    private LocalDate leave_date;
}
