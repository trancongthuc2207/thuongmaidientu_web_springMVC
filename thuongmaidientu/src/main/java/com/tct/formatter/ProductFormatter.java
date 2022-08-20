package com.tct.formatter;

import com.tct.pojo.Product;
import org.springframework.format.Formatter;

import java.text.ParseException;
import java.util.Locale;

public class ProductFormatter implements Formatter<Product> {
    @Override
    public Product parse(String idPro, Locale locale) throws ParseException {
        Product pro = new Product();
        pro.setIdProduct(Integer.valueOf(idPro));
        return pro;
    }

    @Override
    public String print(Product object, Locale locale) {
        return String.valueOf(object.getIdProduct());
    }
}
