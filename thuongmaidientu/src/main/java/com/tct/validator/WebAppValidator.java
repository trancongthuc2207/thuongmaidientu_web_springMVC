package com.tct.validator;

import com.tct.pojo.ShopProducts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import javax.validation.ConstraintViolation;
import java.util.Set;

@Component
public class WebAppValidator implements Validator {
    @Autowired
    private javax.validation.Validator beanValidator;
    private Set<Validator> springValidator;

    @Override
    public boolean supports(Class<?> aClass) {
        return ShopProducts.class.isAssignableFrom(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Set<ConstraintViolation<Object>> beans = this.beanValidator.validate(o);
        for(ConstraintViolation<Object> obj : beans)
            errors.rejectValue(obj.getPropertyPath().toString(),obj.getMessageTemplate());
        for(Validator v : this.springValidator)
            v.validate(o,errors);
    }

    public void setSpringValidator(Set<Validator> springValidator) {
        this.springValidator = springValidator;
    }
}
