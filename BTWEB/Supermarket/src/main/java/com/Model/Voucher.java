package com.Model;

import lombok.*;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Voucher {
    private Integer ID;
    private String name;
    private String description;
    private Integer discountRate;
}
