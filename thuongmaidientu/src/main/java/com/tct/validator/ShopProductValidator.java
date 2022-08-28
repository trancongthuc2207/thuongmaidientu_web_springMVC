package com.tct.validator;

import com.tct.pojo.ShopProducts;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class ShopProductValidator implements Validator {
    @Override
    public boolean supports(Class<?> aClass) {
        return ShopProducts.class.isAssignableFrom(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        ShopProducts shopProducts = (ShopProducts) o;

        if(shopProducts.getAmount() < 0)
            errors.rejectValue("amount","ShopProduct.amount.nullErro");
    }
}
