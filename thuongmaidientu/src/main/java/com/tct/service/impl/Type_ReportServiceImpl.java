package com.tct.service.impl;

import com.tct.pojo.TypeReport;
import com.tct.repository.Type_ProductRepository;
import com.tct.repository.Type_ReportRepository;
import com.tct.service.Type_ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Type_ReportServiceImpl implements Type_ReportService {
    @Autowired
    private Type_ReportRepository type_reportRepository;

    @Override
    public List<TypeReport> getType_Report(String pos) {
        return this.type_reportRepository.getType_Report(pos);
    }
}
