package com.icia.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.project.dto.GoodsDTO;
import com.icia.project.dto.PageDTO;

@Repository
public class GoodsDAO {
	
	@Autowired
	private SqlSessionTemplate sql;

	// 용품 리스트
	public List<GoodsDTO> GoodsList(PageDTO paging) {
		return sql.selectList("goods.goodsList",paging);
	}
	//용품 리스트 페이징처리
	public int goodsListCount() {
		return sql.selectOne("goods.goodsListCount");
	}
	//용품검색
	public List<GoodsDTO> goodsSearch(String goodsSearch) {
		return sql.selectList("goods.goodsSearch",goodsSearch);
	}
	//카테고리 검색
	public List<GoodsDTO> goodsCategory(GoodsDTO goods) {
		return sql.selectList("goods.goodsCategory",goods);
	}

	// 용품 상세보기
	public GoodsDTO goodsView(GoodsDTO goods) {
		return sql.selectOne("goods.goodsView",goods);
	}
	
	// 용품 조회수
	public void goodsHit(GoodsDTO goods) {
		sql.update("goods.goodsHit",goods);
		
	}
	// 용품 좋아요
		public void goodssLike(GoodsDTO goods) {
			sql.update("goods.goodssLike",goods);	
	}
	// 용품 좋아요 Id
	public void goodsLikeUser(GoodsDTO goods) {
		sql.insert("goods.goodsLikeUser",goods);
	}
	// 용품 좋아요 취소
		public void goodsUnLike(GoodsDTO goods) {
			sql.update("goods.goodsUnLike",goods);
	}
	// 용품 좋아요 취소 id
	public void goodsUnLikeUser(GoodsDTO goods) {
			sql.insert("goods.goodsUnLikeUser",goods);
	}
	// 용품 좋아요 수 조회
	public int goodsLike(GoodsDTO goods) {
		return sql.selectOne("goods.goodsLike",goods);
	}
	// 좋아요 아이디 조회
	public String goodsLikeUserId(GoodsDTO goods) {
		return sql.selectOne("goods.goodsLikeUserIdCheck",goods);
	}
	// 용품 구매 상세페이지
	public GoodsDTO goodsPayMent(GoodsDTO goods) {
		return sql.selectOne("goods.goodsPayMent",goods);
	}
	// 용품 결제
	public void GoodsCard(GoodsDTO goods) {
		sql.insert("goods.goodsCard",goods);
	}
	// 문의글 리스트
	public List<GoodsDTO> goodsAskList(int askGoodsNum) {
		return sql.selectList("goods.goodsAskList",askGoodsNum);
	}
	// 문의글 작성
	public int goodsAsk(GoodsDTO goods) {
		return sql.insert("goods.goodsAskWrite",goods);
	}

	//비밀번호 확인
	public String goodsAskPw(int askPw) {
		return sql.selectOne("goods.goodsAskPw",askPw);
	}
	//비밀글 가져오기
	public String goodsAskSecret(GoodsDTO goods) {
		return sql.selectOne("goods.goodsAskSecret",goods);
	}
	//최신순
	public List<GoodsDTO> goodsDateOrder(PageDTO paging) {
		return sql.selectList("goods.goodsDateOrder",paging);
	}
	//조회순
	public List<GoodsDTO> goodsHitOrder(PageDTO paging) {
		return sql.selectList("goods.goodsHitOrder",paging);
	}
	//좋아요순
	public List<GoodsDTO> goodsLikeOrder(PageDTO paging) {
		return sql.selectList("goods.goodsLikeOrder",paging);
	}
	//장바구니
	public void goodsBasket(GoodsDTO goods) {
		sql.insert("goods.goodsBasket",goods);
	}

	
	



	}




