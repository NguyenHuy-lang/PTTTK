package com.Model;

import lombok.*;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Product {
    private Integer ID;
    private String name;
    private Integer cost;
    private String description;
    private String imgPath;
    private CategoryProduct categoryProduct;
}
