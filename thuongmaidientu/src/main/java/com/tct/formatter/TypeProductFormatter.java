package com.tct.formatter;

import com.tct.pojo.Product;
import com.tct.pojo.TypeProduct;
import org.springframework.format.Formatter;

import java.text.ParseException;
import java.util.Locale;

public class TypeProductFormatter implements Formatter<TypeProduct> {
    @Override
    public TypeProduct parse(String s, Locale locale) throws ParseException {
        TypeProduct typeProduct = new TypeProduct();
        typeProduct.setIdTypeProduct(Integer.valueOf(s));
        return typeProduct;
    }

    @Override
    public String print(TypeProduct typeProduct, Locale locale) {
        return String.valueOf(typeProduct.getIdTypeProduct());
    }
}
