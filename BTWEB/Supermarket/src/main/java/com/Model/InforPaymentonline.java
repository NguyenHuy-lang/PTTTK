package com.Model;

import lombok.*;

import java.util.Date;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class InforPaymentonline {
    private Integer ID;
    private String numCard;
    private String ownerNameCard;
    private Date dateRelease;
    private String typeCard;
    private Integer otp;

}
