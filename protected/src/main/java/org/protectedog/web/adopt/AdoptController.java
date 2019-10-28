package org.protectedog.web.adopt;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.protectedog.common.Page;
import org.protectedog.common.Search;
import org.protectedog.service.adopt.AdoptService;
import org.protectedog.service.domain.Adopt;
import org.protectedog.service.domain.FileDog;
import org.protectedog.service.domain.User;
import org.protectedog.service.file.FileService;
import org.protectedog.service.interest.InterestService;
import org.protectedog.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;




//==> 분양|실종관리 Controller
@Controller
@RequestMapping("/adopt/*")
public class AdoptController {
	
	///Field
	@Autowired
	@Qualifier("adoptServiceImpl")
	private AdoptService adoptService;
	
	@Autowired
	@Qualifier("fileServiceImpl")
	private FileService fileService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("interestServiceImpl")
	private InterestService interestService;
	
	//setter Method 구현 않음
	
//	@Resource(name = "uploadPath")
//	private String uploadPath;
	
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['fundingPageSize']}")
	int pageSize;

	@Value("#{commonProperties['fileAdopt']}")
	String fileroot;
	
	

	
	
	public AdoptController(){
		System.out.println(this.getClass());
	}
	
	
	
	
	@RequestMapping( value="addAdopt", method=RequestMethod.GET )
	public String addAdopt(  @RequestParam("boardCode") String boardCode, HttpSession session, Model model ) throws Exception {

		System.out.println("/adopt/addAdopt : GET \n"+boardCode);
		
		if( ((User)session.getAttribute("user")) == null  ) {
			return "redirect:/adopt/listAdopt?boardCode="+boardCode;
		}else if(   !((User)session.getAttribute("user")).getLevels().equals("미인증회원") ||  !((User)session.getAttribute("user")).getLevels().equals("운영자")  ) {
			return "forward:/adopt/addAdopt.jsp?boardCode="+boardCode;
		}else {
			return "redirect:/adopt/listAdopt?boardCode="+boardCode;
		}
	}
	

	
	// 글 등록하고 상세조회 화면으로 
	@RequestMapping( value="addAdopt", method=RequestMethod.POST )
	public String addAdopt( @ModelAttribute("adopt") Adopt adopt, Model model,
							@RequestParam("multiFile") ArrayList<String> multiFile, HttpSession session ) throws Exception {

		System.out.println("/adopt/addAdopt : POST \n"+adopt);
		
		adopt.setId(((User)session.getAttribute("user")).getId());
		adopt.setNickname(((User)session.getAttribute("user")).getNickname());

		// 파일
		adopt.setMainFile(multiFile.get(0));
		adoptService.addAdopt(adopt);
		adopt = adoptService.getAdopt(adopt.getPostNo());
		
		User user = userService.getUsers(adopt.getId());
		if ( ! user.getLevels().equals("미인증회원")) {
			user.setLevelPoint(user.getLevelPoint()+5);
			userService.updateUsers(user);
		}
		List<FileDog> listFile = new ArrayList<FileDog>();

		// 파일디비에넣기
		for (String fileName : multiFile) {
			if (fileName != null && fileName.length() > 0) {
				FileDog files = new FileDog();
				files.setBoardCode(adopt.getBoardCode());
				files.setFileName(fileName);
				files.setFileCode(0);
				files.setPostNo(adopt.getPostNo());
				listFile.add(files);
			}
		}
		fileService.addFile(listFile);
		model.addAttribute("adopt", adopt);
		
		if(adopt.getBoardCode().equals("AD")) {

			return "redirect:/adopt/getAdopt?postNo="+adopt.getPostNo();
		}else {

			return "redirect:/adopt/listMissing.jsp";
		}
	}
	
	
	
	// 글 상세조회
	@RequestMapping( value="getAdopt")
	public String getAdopt( @RequestParam("postNo") int postNo , Model model, HttpSession session ) throws Exception {
		
		System.out.println("/adopt/getAdopt : GET");
		
		Adopt adopt = adoptService.getAdopt(postNo);
		
		
		Map<String, Object> filePost = new HashMap<String, Object>();
		filePost.put("boardCode", adopt.getBoardCode());
		filePost.put("postNo", postNo);
		List<FileDog> file = fileService.getFile(filePost);
		
		System.out.println("세션들어왔나 "+session.getAttribute("user") );
		if ( session.getAttribute("user") != null) {
			User user = userService.getUsers(((User)session.getAttribute("user")).getId()); 
			
			Map<String,Object> map = new HashMap<>();
			map.put("id", user.getId());
			map.put("boardCode", "AD");
			map.put("searchType", "post");
			map.put("searchNo", postNo);
			
			if ( interestService.getInterestCheck(map) == 1 ) {
				model.addAttribute("check", "already");
			}
			
			model.addAttribute("user", user);
		}
		
		model.addAttribute("adopt", adopt);	
		model.addAttribute("file", file);		
	
		return "forward:/adopt/getAdopt.jsp";
	}
	
	
	
	// 글 수정화면으로
	@RequestMapping( value="updateAdopt", method=RequestMethod.GET)
	public String updateAdopt( @RequestParam("postNo") int postNo , Model model) throws Exception{

		System.out.println("/adopt/updateAdopt : GET");
		
		Adopt adopt = adoptService.getAdopt(postNo);
		
		Map<String, Object> filePost = new HashMap<String, Object>();
		filePost.put("boardCode", adopt.getBoardCode());
		filePost.put("postNo", postNo);
		List<FileDog> file = fileService.getFile(filePost);
		
		model.addAttribute("adopt", adopt);
		model.addAttribute("file", file);	
		
		return "forward:/adopt/updateAdopt.jsp";
	}
	
	
	
	// 글 수정하고 조회
	// 글상태확인은 jsp에서
	@RequestMapping( value="updateAdopt" , method=RequestMethod.POST)
	public String updateAdopt( @ModelAttribute("adopt") Adopt adopt, Model model,
								@RequestParam("multiFile") ArrayList<String> multiFile,
								@RequestParam("deleteFile") ArrayList<String> deleteFile  ) throws Exception{

		System.out.println("/adopt/updateAdopt : POST\n"+adopt);
		
		if (deleteFile != null) {

			for (String fileName : deleteFile) {
				FileDog files = new FileDog();
				files.setFileName(fileName);
				files.setPostNo(adopt.getPostNo());

				fileService.delFile(files);
			}
		}
		if (multiFile.size() != 0) {
			List<FileDog> listFile = new ArrayList<FileDog>();
			// 파일디비에넣기
			for (String fileName : multiFile) {
				if (fileName != null && fileName.length() > 0) {
					FileDog files = new FileDog();
					files.setBoardCode(adopt.getBoardCode());
					files.setFileName(fileName);
					files.setFileCode(0);
					files.setPostNo(adopt.getPostNo());
					listFile.add(files);
				}
			}
			fileService.addFile(listFile);
		}
		
		Map<String, Object> filePost = new HashMap<String, Object>();
		filePost.put("boardCode", adopt.getBoardCode());
		filePost.put("postNo", adopt.getPostNo());
		List<FileDog> file = fileService.getFile(filePost);
		
		System.out.println("파일네임확인 : "+file.get(0).getFileName());
		adopt.setMainFile(file.get(0).getFileName());

		System.out.println(adopt);

		adoptService.updateAdopt(adopt);
		adopt = adoptService.getAdopt(adopt.getPostNo());
		model.addAttribute("adopt", adopt);		

		return "redirect:/adopt/getAdopt?postNo="+adopt.getPostNo();
	}
	
	
	
	// 글 삭제
	@RequestMapping( value="updateStatusCode" , method=RequestMethod.GET)
	public String updateStatusCode( @RequestParam("postNo") int postNo ,
									@ModelAttribute("adopt") Adopt adopt ) throws Exception{
		
		System.out.println("/adopt/updateStatusCode : POST  "+adopt);

		adopt = adoptService.getAdopt(postNo);
		adopt.setStatusCode("0");
		adoptService.updateStatusCode(adopt);
		
		if( adopt.getBoardCode().equals("AD") ) {
			return "forward:/adopt/listAdopt?boardCode="+adopt.getBoardCode();
		} else {
			return "redirect:/adopt/listMissing";
		}
		
	}
	
	
	
	
	// 글 리스트 조회
	@RequestMapping( value="listAdopt" )
	public String listAdopt( @ModelAttribute("search") Search search, Model model, HttpSession session, 
							 @RequestParam(value="boardCode", required=false) String boardCode,
							 @RequestParam(value="areaCondition", required=false) String areaCondition,
							 @RequestParam(value="searchCondition", required=false) String searchCondition,
							 @RequestParam(value="searchKeyword", required=false) String searchKeyword
							 
			
			) throws Exception{
		
		System.out.println("/adopt/listAdopt : GET / POST"+boardCode);
		
//		System.out.println("===================================="+search);
		if(boardCode == null & areaCondition != null) {
			boardCode = "AD";
		}
		if(search.getSearchCondition() == null ) {
			search.setSearchCondition("");
		}
		if(search.getSearchKeyword() == null ) {
			search.setSearchKeyword("");
		}
		if(search.getAreaCondition() == null || search.getAreaCondition().equals("all") ) {
			search.setAreaCondition("");
		}
		search.setVoteCondition("");
		
		
		if (search.getCurrentPage() ==0 ) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(6);
//		search.setPageSize(pageSize);
//		System.out.println("■■■■ 검색어 확인 : "+search.getSearchKeyword()
//						+"\n■■■■ search 확인 : "+search);
		
		Map<String , Object> map=adoptService.listAdopt(search, boardCode);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, 16);
//		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
			
//		System.out.println("■■■■ map 확인 : "+map
//						+"\n■■■■ map.get(\"list\") 확인  : "+map.get("list"));
		
		if ( session.getAttribute("user") != null) {
			User user = userService.getUsers(((User)session.getAttribute("user")).getId()); 
			model.addAttribute("user", user);
			System.out.println("세션 확인 "+user);
		}
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/adopt/listAdopt.jsp?boardCode="+boardCode;
	}
	
	

	
	
	@RequestMapping( value="listMissing" )
	public String listMissing( ) throws Exception{
		return "forward:/adopt/listMissing.jsp";
	}
	
	
}