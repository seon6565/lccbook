package org.fullstack4.lccbook.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AdminDTO {
    @NotBlank
    private String admin_id;
    @NotBlank
    private String admin_pwd;
    private String admin_regdate;
}
