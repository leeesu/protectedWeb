package org.protectedog.service.comment.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.protectedog.common.Search;
import org.protectedog.service.comment.CommentDAO;
import org.protectedog.service.domain.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("commentDAOImpl")
public class CommentDAOImpl implements CommentDAO {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void addComment(Comment comment) throws Exception {
		sqlSession.insert("CommentMapper.addComment", comment);
	}

	@Override
	public Comment getComment(int commentNo, String boardCode) throws Exception {	
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("commentNo",commentNo);
		map.put("boardCode",boardCode);
		return sqlSession.selectOne("CommentMapper.getComment", map);
	}

	@Override
	public void updateComment(Comment comment) throws Exception {
		sqlSession.update("CommentMapper.updateComment", comment);
	}

	@Override
	public List<Comment> listComment(int postNo, Search search, String boardCode) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("postNo", postNo);
		map.put("startRowNum", search.getStartRowNum());
		map.put("endRowNum",search.getEndRowNum());
		map.put("boardCode",boardCode);
		List<Comment> list = sqlSession.selectList("CommentMapper.listComment", map);
		
		return list;
	}

	@Override
	public void delComment(int commentNo, String boardCode) throws Exception {
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("commentNo",commentNo);
		map.put("boardCode",boardCode);
		
		sqlSession.update("CommentMapper.delComment", map);		
	}

	@Override
	public int getTotalCount(int postNo, String boardCode) throws Exception {
		System.out.println(" CommentDAOImpl getTotlaCount postNo : " + postNo);
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("postNo",postNo);
		map.put("boardCode",boardCode);
		
		return sqlSession.selectOne("CommentMapper.getTotalCount", map);
	}

	@Override
	public void updateLikeCnt(Map<String, Object> map) throws Exception {
		sqlSession.update("CommentMapper.updateLikeCnt",map);
	}
	
	public List<Comment> listCommentMoreView(Map<String, Object> map) throws Exception{
		List<Comment> list = sqlSession.selectList("CommentMapper.listCommentMoreView",map);
		return list;
	}

}
