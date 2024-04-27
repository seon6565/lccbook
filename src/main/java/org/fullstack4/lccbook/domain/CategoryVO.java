package org.fullstack4.lccbook.domain;

import lombok.*;

@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CategoryVO {
    private int category_idx;
    private String category_name;
}
