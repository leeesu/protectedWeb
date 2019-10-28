package org.protectedog.service.review;

import java.util.List;

import org.protectedog.common.Search;
import org.protectedog.service.domain.Review;

public interface ReviewDAO {

	// INSERT
	public void addReview(Review review) throws Exception;

	// SELECTONE
	public Review getReview(int postNo) throws Exception;

	// SELECTLIST
	public List<Review> listReview(Search search, String boardCode, String hospitalName) throws Exception;

	// //UPDATE
	public void updateReivew(Review Review) throws Exception;

	// DELETE
	public void delReivew(int postNo) throws Exception;

	// TOTALCOUNT
	public int getTotalCount(Search search, String boardCode, String hospitalName) throws Exception;

}
