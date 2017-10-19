/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.util;

import java.security.MessageDigest;
import java.util.Random;

/**
 *
 * @author Luxury
 */
public class Hash {
    public static String Sha256(String base) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(base.getBytes("UTF-8"));
            StringBuffer hexString = new StringBuffer();

            for (int i = 0; i < hash.length; i++) {
                String hex = Integer.toHexString(0xff & hash[i]);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }

            return hexString.toString();
        } catch (Exception ex) {
           return null;
        }
    }
    public static String generateToken() {
        Random random = new Random();
        int length = 5;
        StringBuffer captchaStringBuffer = new StringBuffer();
        for (int i = 0; i < length; i++) {
            int captchaNumber = Math.abs(random.nextInt()) % 60;
            int charNumber = 0;
            if (captchaNumber < 26) {
                charNumber = 65 + captchaNumber;
            } else if (captchaNumber < 52) {
                charNumber = 97 + (captchaNumber - 26);
            } else {
                charNumber = 48 + (captchaNumber - 52);
            }
            captchaStringBuffer.append((char) charNumber);
        }

        return Sha256(captchaStringBuffer.toString());
    }
    public static void main(String[] args) {
        System.out.println(Sha256("123456"));
    }
}
