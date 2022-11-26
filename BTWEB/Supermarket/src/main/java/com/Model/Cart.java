package com.Model;

import lombok.*;

import java.util.ArrayList;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Cart {
    private Integer costTemp;
    private Integer costShip;
    private Integer costDiscount;
    private Integer costTotal;
    private Integer ID;
    private ArrayList<DetailInCart> detailInCart;
}
