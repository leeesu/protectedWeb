package org.protectedog.service.report.test;

import org.junit.runner.RunWith;
import org.protectedog.service.report.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;



@RunWith(SpringJUnit4ClassRunner.class)


@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
public class ReportTest {


	@Autowired
	@Qualifier("reportServiceImpl")
	private ReportService reportService;

//	//@Test
//	public void testAddReport() throws Exception {
//		
//		Report report=new Report();
//		report.setReportNo(10000);
//		
//		User reporter=new User();
//		reporter.setId("user01");
//		report.setReporter(reporter);
//		
//		User reported=new User();
//		reported.setId("user02");
//		report.setReported(reported);
//		
//		report.setReportCategory("��Ӿ���");
//		report.setReportContent("�̻��� �� ���ۻ��ⷡ��");
//		report.setReportStatus(0);
//		
//		Date reportDate=new Date();
//		reportDate.setYear(1999);
//		reportDate.setMonth(05);
//		reportDate.setDate(01);
//		report.setReportDate(reportDate);
//		
//		report.setFile1("abc.jpg");
//		report.setFile2(null);
//		report.setFile3(null);
//		
//		reportService.addReport(report);
//		
//		report=reportService.getReport(10000);
//		
//		System.out.println(report);
//
//	}
//	
//	//@Test
//	public void testGetReport() throws Exception {
//		
//		Report report=new Report();
//		report.setReportNo(10001);
//		
//		User reporter=new User();
//		reporter.setId("user02");
//		report.setReporter(reporter);
//		
//		User reported=new User();
//		reported.setId("user03");
//		report.setReported(reported);
//		
//		report.setReportCategory("ǳ�⹮��");
//		report.setReportContent("�������Ͱ� ���� ����ִ� �Էα���");
//		report.setReportStatus(0);
//		
//		Date reportDate=new Date();
//		reportDate.setYear(2019);
//		reportDate.setMonth(05);
//		reportDate.setDate(01);
//		report.setReportDate(reportDate);
//		
//		report.setFile1("def.jpg");
//		report.setFile2(null);
//		report.setFile3(null);
//		
//		reportService.addReport(report);
//		
//		report=reportService.getReport(10001);
//		
//		System.out.println(report);
//
//	}
//	
//	//@Test
//	 public void testUpdateReport() throws Exception{
//		 
//			
//		Report report=reportService.getReport(10001);
//		
//		report.setReportStatus(1);
//		report.setDelCode('0');
//		
//		reportService.updateReportStatus(report);
//		
//		report=reportService.getReport(10001);
//		
//		System.out.println(report);
//		
//	}
//
//	
//
//	 @Test
//	 public void testGetReportListAll() throws Exception{
//		 
//	 	Search search = new Search();
//	 	search.setCurrentPage(1);
//	 	search.setPageSize(3);
//	 	Map<String,Object> map = reportService.getReportList(search);
//	 	
//	 	List<Object> list = (List<Object>)map.get("list");
//	 	
//	 	System.out.println(list);
//	 	
//	 	Integer totalCount = (Integer)map.get("totalCount");
//	 	System.out.println(totalCount);
//	 	
//	 	System.out.println("=======================================");
//	 	
//	 	search.setCurrentPage(1);
//	 	search.setPageSize(3);
//	 	search.setSearchCondition("0");
//	 	search.setSearchKeyword("");
//	 	map = reportService.getReportList(search);
//	 	
//	 	list = (List<Object>)map.get("list");
//	
//	 	
//	 	System.out.println(list);
//	 	
//	 	totalCount = (Integer)map.get("totalCount");
//	 	System.out.println(totalCount);
//	 }
 
}