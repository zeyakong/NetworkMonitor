package com.ssm.entity;

import java.sql.Timestamp;

/**
 * Created by Zeya Kong
 * On 2018/2/12 14:28.
 */
public class Transaction {
    private int transactionId;
    private Timestamp transactionDateSent;
    private Timestamp transactionDateResponded;
    private String transactionType;
    private double transactionAmount;
    private String transactionStatus;
    private String storeIp;
    private long givenCardId;
    private String givenCardName;
    private String givenCardDate;
    private String givenCardCode;
    private String currentPositionIp;
    private String currentDestinationIp;

    public int getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(int transactionId) {
        this.transactionId = transactionId;
    }

    public Timestamp getTransactionDateSent() {
        return transactionDateSent;
    }

    public void setTransactionDateSent(Timestamp transactionDateSent) {
        this.transactionDateSent = transactionDateSent;
    }

    public Timestamp getTransactionDateResponded() {
        return transactionDateResponded;
    }

    public void setTransactionDateResponded(Timestamp transactionDateResponded) {
        this.transactionDateResponded = transactionDateResponded;
    }

    public String getTransactionType() {
        return transactionType;
    }

    public void setTransactionType(String transactionType) {
        this.transactionType = transactionType;
    }

    public double getTransactionAmount() {
        return transactionAmount;
    }

    public void setTransactionAmount(double transactionAmount) {
        this.transactionAmount = transactionAmount;
    }

    public String getTransactionStatus() {
        return transactionStatus;
    }

    public void setTransactionStatus(String transactionStatus) {
        this.transactionStatus = transactionStatus;
    }

    public String getStoreIp() {
        return storeIp;
    }

    public void setStoreIp(String storeIp) {
        this.storeIp = storeIp;
    }

    public long getGivenCardId() {
        return givenCardId;
    }

    public void setGivenCardId(long givenCardId) {
        this.givenCardId = givenCardId;
    }

    public String getGivenCardName() {
        return givenCardName;
    }

    public void setGivenCardName(String givenCardName) {
        this.givenCardName = givenCardName;
    }

    public String getGivenCardDate() {
        return givenCardDate;
    }

    public void setGivenCardDate(String givenCardDate) {
        this.givenCardDate = givenCardDate;
    }

    public String getGivenCardCode() {
        return givenCardCode;
    }

    public void setGivenCardCode(String givenCardCode) {
        this.givenCardCode = givenCardCode;
    }

    public String getCurrentPositionIp() {
        return currentPositionIp;
    }

    public void setCurrentPositionIp(String currentPositionIp) {
        this.currentPositionIp = currentPositionIp;
    }

    public String getCurrentDestinationIp() {
        return currentDestinationIp;
    }

    public void setCurrentDestinationIp(String currentDestinationIp) {
        this.currentDestinationIp = currentDestinationIp;
    }
    //    public String getTransactionDateSent() {
//        System.out.println("starttransaction");
//        System.out.println(transactionDateSent);
//        String tran=transactionDateSent.toString();
//        System.out.println(tran);
//        String arr[]=tran.split(" ");
//         String arrdmy[]=arr[0].split("-");
//         int month01= Integer.parseInt(arrdmy[1]);
//         String month="12313";
//        System.out.println(month01);
//        System.out.println(month);
//         switch(month01){
//                 case 1:
//                 month="Jan";
//                 break;
//             case 2:
//                 month="Feb";
//                 break;
//             case 3:
//                 month="Mar";
//                 break;
//             case 4:month="Apr";
//                 break;
//             case 5:month="May";
//                 break;
//             case 6:month="Jun";
//                 break;
//             case 7:month="Jul";
//                 break;
//             case 8:month="Aug";
//                 break;
//             case 9:month="Sep";
//                 break;
//             case 10:month="Oct";
//                 break;
//             case 11:month="Nov";
//                 break;
//             case 12:month="Dec";
//                 break;
//
//         }
//        System.out.println(month);
//         String arrhm[]=arr[1].split(":");
//         String transact=month+" "+arrdmy[2]+","+arrdmy[0]+" "+arrhm[0]+":"+arrhm[1];
//        System.out.println(transact);
//        return transact;
//       /* return transactionDateSent;*/
//    }
//
//    public String getTransactionDateResponded() {
//
//        System.out.println("starttransaction");
//        System.out.println(transactionDateResponded);
//        String tran=transactionDateResponded.toString();
//        System.out.println(tran);
//        String arr[]=tran.split(" ");
//        String arrdmy[]=arr[0].split("-");
//        int month01= Integer.parseInt(arrdmy[1]);
//        String month="12313";
//        System.out.println(month01);
//        System.out.println(month);
//        switch(month01){
//            case 1:
//                month="Jan";
//                break;
//            case 2:
//                month="Feb";
//                break;
//            case 3:
//                month="Mar";
//                break;
//            case 4:month="Apr";
//                break;
//            case 5:month="May";
//                break;
//            case 6:month="Jun";
//                break;
//            case 7:month="Jul";
//                break;
//            case 8:month="Aug";
//                break;
//            case 9:month="Sep";
//                break;
//            case 10:month="Oct";
//                break;
//            case 11:month="Nov";
//                break;
//            case 12:month="Dec";
//                break;
//
//        }
//        System.out.println(month);
//        String arrhm[]=arr[1].split(":");
//        String transact2=month+" "+arrdmy[2]+","+arrdmy[0]+" "+arrhm[0]+":"+arrhm[1];
//        System.out.println(transact2);
//        return transact2;
//
//
//
//
//
//
//
//
//
//
//    }
}
