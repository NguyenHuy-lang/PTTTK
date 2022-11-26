package com.Model;
import lombok.*;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Member {
    private Integer ID;
    private String username;
    private String password;
    private String name;
    private String address;
    private String gender;
    private String phonenumber;

}
