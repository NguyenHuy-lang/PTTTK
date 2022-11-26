package com.Model;

import lombok.*;

import java.util.ArrayList;
import java.util.Date;
@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Order extends Cart{
    private Date orderDate;
    private Date datePayment;
    private String statusOrder;
    private Voucher voucher;
    private InforPaymentonline inforPaymentonline;
    private Date receiveDate;
    private Customer customer;



    public Order(Integer costTemp, Integer costShip, Integer costDiscount, Integer costTotal, Integer ID, ArrayList<DetailInCart> detailInCart, Date orderDate, Date datePayment, String statusOrder, Voucher voucher, InforPaymentonline inforPaymentonline, Customer customer) {
        super(costTemp, costShip, costDiscount, costTotal, ID, detailInCart);
        this.orderDate = orderDate;
        this.datePayment = datePayment;
        this.statusOrder = statusOrder;
        this.voucher = voucher;
        this.inforPaymentonline = inforPaymentonline;
        this.customer = customer;
    }
}
