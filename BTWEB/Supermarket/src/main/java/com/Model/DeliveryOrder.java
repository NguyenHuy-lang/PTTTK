package com.Model;

import lombok.*;

import java.util.Date;
@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class DeliveryOrder extends Order{
    private StaffDelivery staffDelivery;
    private Date dateStaffReceiveShip;
}
