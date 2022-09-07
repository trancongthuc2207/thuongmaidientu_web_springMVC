package com.tct.repository;

import com.tct.pojo.TypeReport;

import java.util.List;

public interface Type_ReportRepository {
    List<TypeReport> getType_Report(String pos);
}
