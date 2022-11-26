package com.Model;

import lombok.*;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class StaffDelivery extends Member{
    private String role;


    public StaffDelivery(String username, String password, String name, String address, String gender, String phonenumber, Integer ID, String role) {
        super(ID, username, password, name, address, gender, phonenumber);
        this.role = role;
    }

}
