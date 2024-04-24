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
    @Pattern(regexp = "^[A-Za-z0-9]{5,15}$")
    private String user_id;
    @Pattern(regexp = "^[가-힣A-Za-z]{1,10}$")
    private String name;
    @Pattern(regexp = "^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{10,16}$")
    private String pwd;
    @Pattern(regexp = "\\w+@\\w+\\.\\w+(\\.\\w+)?")
    private String email;
    private String interest;
    private String jumin;
    private String addr1;
    private String addr2;
    @NotNull
    @PastOrPresent
    private LocalDate brithday;
    private String job_code;
    private int mileage;
    private String user_state;
    private LocalDate reg_date;
    private LocalDate modify_date;
    private LocalDate leave_date;
    private LocalDate pwd_change_date;
}
