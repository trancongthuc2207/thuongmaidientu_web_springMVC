package com.tct.formatter;

import com.tct.pojo.PositionStaff;
import org.springframework.format.Formatter;

import java.text.ParseException;
import java.util.Locale;

public class PositionStaffFormatter implements Formatter<PositionStaff> {
    @Override
    public PositionStaff parse(String s, Locale locale) throws ParseException {
        PositionStaff po = new PositionStaff();
        po.setIdPosition(Integer.valueOf(s));
        return po;
    }

    @Override
    public String print(PositionStaff positionStaff, Locale locale) {
        return String.valueOf(positionStaff.getIdPosition());
    }
}
