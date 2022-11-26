package com.Model;

import lombok.*;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class DetailInCart {
    private Integer quanity;
    private Integer unitPrice;
    private Integer ID;
    private Product product;
}
