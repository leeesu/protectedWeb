package org.protectedog.service.report;

import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Report;

public interface ReportService {

	// �Ű�۵��
	public void addReport(Report report) throws Exception;
	
	// �Ű�ۻ󼼺���
	public Report getReport(int reportNo) throws Exception;
	
	// �Ű�۸����ȸ
	public Map<String, Object> getReportList(Search search) throws Exception;
	
	// �Ű�ۻ��º���
	public void updateReportStatus(Report report) throws Exception;
	
	
	
}
