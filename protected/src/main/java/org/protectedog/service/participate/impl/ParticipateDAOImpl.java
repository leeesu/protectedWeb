package org.protectedog.service.participate.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.protectedog.common.Search;
import org.protectedog.service.domain.Participate;
import org.protectedog.service.participate.ParticipateDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("participateDAOImpl")
public class ParticipateDAOImpl implements ParticipateDAO {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public ParticipateDAOImpl() {
		System.out.println(this.getClass());
	}

	/////////////// FUNDING ����/////////////////////

	@Override
	public void addParticipate(Participate participate) throws Exception {
		sqlSession.insert("ParticipateMapper.addParticipate", participate);

	}

	@Override
	public Participate getParticipate(int participateNo) throws Exception {
		return sqlSession.selectOne("ParticipateMapper.getParticipate", participateNo);

	}

	@Override
	public List<Participate> listNoticeComment(Search search, int postNo , String statusCode) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("postNo", postNo);
		map.put("statusCode", statusCode);
		map.put("endRowNum",  search.getEndRowNum()+"" );
		map.put("startRowNum",  search.getStartRowNum()+"" );
		
		return sqlSession.selectList("ParticipateMapper.listNoticeComment",map);
	}

	@Override
	public int getParticipateTotalCount(int postNo,String statusCode) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("postNo", postNo);
		map.put("statusCode", statusCode);		
		return sqlSession.selectOne("ParticipateMapper.getParticipateTotalCount",map);
	}

	/////////////// ȸ������ �䱸�� Method/////////////////////

	@Override
	public List<Participate> listParticipateUser(int id) throws Exception {
		return sqlSession.selectList("ParticipateMapper.listParticipateUser",id);
	}

	@Override
	public Participate getPostParticipate(Participate participate) throws Exception {
		return sqlSession.selectOne("ParticipateMapper.getPostParticipate", participate);
	}

}
