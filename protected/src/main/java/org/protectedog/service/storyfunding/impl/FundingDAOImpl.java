package org.protectedog.service.storyfunding.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.protectedog.common.Search;
import org.protectedog.service.domain.Funding;
import org.protectedog.service.storyfunding.FundingDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("fundingDAOImpl")
public class FundingDAOImpl implements FundingDAO {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public FundingDAOImpl() {
		System.out.println(this.getClass());
	}

	/////////////// FUNDING �Ŀ���û �Խ��� /////////////////////
	
	@Override
	public Funding getPost(String id) throws Exception {
		return sqlSession.selectOne("FundingMapper.getPost",id);
	}

	@Override
	public void addVoting(Funding funding) throws Exception {
		sqlSession.insert("FundingMapper.addVoting", funding);

	}

	@Override
	public Funding getVoting(int postNo) throws Exception {
		return sqlSession.selectOne("FundingMapper.getVoting", postNo);
	}

	@Override
	public void updateVoting(Funding funding) throws Exception {
		sqlSession.update("FundingMapper.updateVoting", funding);

	}

	@Override
	public void delVoting(int postNo) throws Exception {
		sqlSession.delete("FundingMapper.delVoting", postNo);

	}

	@Override
	public List<Funding> listVoting(Search search) throws Exception {
		return sqlSession.selectList("FundingMapper.listVoting", search);
	}

	@Override
	public List<String> getAutoVoting(Map<String, Object> searchMap) throws Exception {
		return sqlSession.selectList("FundingMapper.getAutoVoting", searchMap);
	}

	@Override
	public int getVotingTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("FundingMapper.getVotingTotalCount", search);
	}
	/////////////// FUNDING �Ŀ��Խ� �Խ��� /////////////////////

	@Override
	public List<Funding> listFunding(Search search) throws Exception {
		return sqlSession.selectList("FundingMapper.listFunding", search);
	}

	@Override
	public int getFundingTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("FundingMapper.getFundingTotalCount", search);
	}
	/////////////// FUNDING ����/////////////////////

	@Override
	public void updateStatusCode(Funding funding) throws Exception {
		sqlSession.update("FundingMapper.updateStatusCode", funding);

	}


	/////////////// �ı� �Խ��� /////////////////////

	@Override
	public void addReview(Funding funding) throws Exception {
		sqlSession.insert("FundingMapper.addReview", funding);

	}

	@Override
	public void updateReview(Funding funding) throws Exception {
		sqlSession.update("FundingMapper.updateReview", funding);

	}

	@Override
	public void delReview(int postNo) throws Exception {
		sqlSession.delete("FundingMapper.delReview", postNo);

	}


}
