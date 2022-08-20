package com.tct.utils;

import com.tct.pojo.Cart;

import java.util.Map;

public class Utils {
    public static int countCart(Map<Integer, Cart> cart) {
        int q = 0;
        if (cart != null)
            for (Cart c : cart.values())
                q += c.getAmount();
        return q;
    }
}
