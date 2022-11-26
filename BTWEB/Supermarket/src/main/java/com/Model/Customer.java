package com.Model;

import lombok.*;
@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Customer extends Member{
    private String customerCode;

    public Customer(String username, String password, String name, String address, String gender, String phonenumber, Integer ID, String customerCode) {
        super(ID,username, password, name, address, gender, phonenumber);
        this.customerCode = customerCode;
    }
}
