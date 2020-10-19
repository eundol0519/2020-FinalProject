package com.icia.project.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.project.dao.GoodsDAO;
import com.icia.project.dto.GoodsDTO;
import com.icia.project.dto.PageDTO;

@Service
public class GoodsService {
	
	@Autowired
	HttpSession session;
	
	ModelAndView mav = new ModelAndView();
	
	@Autowired
	GoodsDAO goddao = new GoodsDAO();

	List<GoodsDTO> GoodsList = new ArrayList<GoodsDTO>();
	List<GoodsDTO> goodsAskList = new ArrayList<GoodsDTO>();
	GoodsDTO gd = new GoodsDTO();
	
	private static final int PAGE_LIMIT = 12; // 한 페이지에 보여 줄 게시물 갯수
	private static final int BLOCK_LIMIT = 12; // 화면에 보여 줄 페이지 번호 갯수
	// 용품 리스트
	public ModelAndView GoodsList(GoodsDTO goods, int page) {
	    PageDTO paging = new PageDTO();
	    

	    int listCount = goddao.goodsListCount();
	    
	    int startRow = (page-1) * PAGE_LIMIT + 1;
	    int endRow = page * PAGE_LIMIT;

	    paging.setPage(page);
	    paging.setStartRow(startRow);
	    paging.setEndRow(endRow);
	    
	    int maxPage = (int)(Math.ceil((double)listCount/PAGE_LIMIT));
	    int startPage = (((int)(Math.ceil((double)page/BLOCK_LIMIT)))-1) * BLOCK_LIMIT + 1;
	    int endPage = startPage + BLOCK_LIMIT - 1;
	    if(endPage > maxPage) {
	       endPage = maxPage;
	    }
	      
	    paging.setMaxPage(maxPage);
	    paging.setStartPage(startPage);
	    paging.setEndPage(endPage);
	    


		List<GoodsDTO> goodsList = goddao.GoodsList(paging);
		
	    mav.addObject("paging", paging);
		mav.addObject("goodsList",goodsList);
		mav.setViewName("GoodsList");
		return mav;
	}
	//용품검색
	public ModelAndView goodsSearch(String goodsSearch) {	
		List<GoodsDTO> goodsSearchList = goddao.goodsSearch(goodsSearch);
		mav.addObject("goodsList",goodsSearchList);
		mav.setViewName("GoodsList");
		
		return mav;
	}	
	
	//카테고리 검색
	public ModelAndView goodsCategory(GoodsDTO goods) {
		List<GoodsDTO> goodsCategory = goddao.goodsCategory(goods);
		mav.addObject("goodsList",goodsCategory);
		mav.setViewName("GoodsList");
		return mav;
	}
	// 용품 상세보기
	public ModelAndView goodsView(GoodsDTO goods) {
		GoodsDTO goodsView = goddao.goodsView(goods);
		
		goddao.goodsHit(goods);
		
		mav.addObject("goodsView",goodsView);
		mav.setViewName("GoodsView");
		return mav;
	}
	GoodsDTO gsdo = new GoodsDTO();
	
	
	// 용품 좋아요 수 조회
		public GoodsDTO goodsLike(GoodsDTO goods) {
			// 좋아요 수 
			gsdo.setGoodsLike(goddao.goodsLike(goods));
			gsdo.setLikeUserId(goddao.goodsLikeUserId(goods));
			return gsdo;
		}
	// 용품 좋아요
	public GoodsDTO goodssLike(GoodsDTO goods) {
		goddao.goodsLikeUser(goods);
		goddao.goodssLike(goods);
		gsdo.setGoodsLike(goddao.goodsLike(goods));
		gsdo.setLikeUserId(goddao.goodsLikeUserId(goods));
		
		return gsdo;
	}
	// 용품 좋아요 취소
	public GoodsDTO goodsUnLike(GoodsDTO goods) {
		goddao.goodsUnLike(goods);
		goddao.goodsUnLikeUser(goods);
		gsdo.setGoodsLike(goddao.goodsLike(goods));
		gsdo.setLikeUserId(goddao.goodsLikeUserId(goods));
		return gsdo;
	}
	// 용품 주문 페이지
	public ModelAndView GoodsPayMent(GoodsDTO goods) {
			mav.addObject("goodsPayMent",goods);
			mav.setViewName("GoodsPayMent");	
		return mav;
	}
	
	// 카카오페이 결제
	public GoodsDTO goodsPayMents(GoodsDTO goods) {
		goddao.GoodsCard(goods);
		return gd;
	}
	// 문의 리스트
	public List<GoodsDTO> goodsAskList(GoodsDTO goods) {
		goodsAskList = goddao.goodsAskList(goods.getAskGoodsNum());
		return goodsAskList;
	}

	// 문의하기 폼
	public ModelAndView goodsAskForm(GoodsDTO goods) {
		mav.addObject("goodsAsk",goods);
		mav.setViewName("GoodsAsk");
		return mav;
	}

	// 문의 작성
	public GoodsDTO goodsAsk(GoodsDTO goods) {
		goddao.goodsAsk(goods);
		return gd;
	}
	
	//비밀글 가져오기

	public String goodsAskSecret(GoodsDTO goods) {
		String gd2 = goddao.goodsAskSecret(goods);	
		return gd2;	
}
	//최신순
	public ModelAndView goodsDateOrder(int page) {
		 PageDTO paging = new PageDTO();
		    

		    int listCount = goddao.goodsListCount();
		    
		    int startRow = (page-1) * PAGE_LIMIT + 1;
		    int endRow = page * PAGE_LIMIT;

		    paging.setPage(page);
		    paging.setStartRow(startRow);
		    paging.setEndRow(endRow);
		    
		    int maxPage = (int)(Math.ceil((double)listCount/PAGE_LIMIT));
		    int startPage = (((int)(Math.ceil((double)page/BLOCK_LIMIT)))-1) * BLOCK_LIMIT + 1;
		    int endPage = startPage + BLOCK_LIMIT - 1;
		    if(endPage > maxPage) {
		       endPage = maxPage;
		    }
		      
		    paging.setMaxPage(maxPage);
		    paging.setStartPage(startPage);
		    paging.setEndPage(endPage);
		List<GoodsDTO> goodsDateOrder = goddao.goodsDateOrder(paging);
		mav.addObject("goodsList",goodsDateOrder);
		mav.setViewName("GoodsList");
		return mav;
	}
	//조회순
	public ModelAndView goodsHitOrder(int page) {
		 PageDTO paging = new PageDTO();
		    

		    int listCount = goddao.goodsListCount();
		    
		    int startRow = (page-1) * PAGE_LIMIT + 1;
		    int endRow = page * PAGE_LIMIT;

		    paging.setPage(page);
		    paging.setStartRow(startRow);
		    paging.setEndRow(endRow);
		    
		    int maxPage = (int)(Math.ceil((double)listCount/PAGE_LIMIT));
		    int startPage = (((int)(Math.ceil((double)page/BLOCK_LIMIT)))-1) * BLOCK_LIMIT + 1;
		    int endPage = startPage + BLOCK_LIMIT - 1;
		    if(endPage > maxPage) {
		       endPage = maxPage;
		    }
		      
		    paging.setMaxPage(maxPage);
		    paging.setStartPage(startPage);
		    paging.setEndPage(endPage);
		List<GoodsDTO> goodsHitOrder = goddao.goodsHitOrder(paging);
		mav.addObject("goodsList",goodsHitOrder);
		mav.setViewName("GoodsList");
		return mav;
	}
	//좋아요순
	public ModelAndView goodsLikeOrder(int page) {
		 PageDTO paging = new PageDTO();
		    

		    int listCount = goddao.goodsListCount();
		    
		    int startRow = (page-1) * PAGE_LIMIT + 1;
		    int endRow = page * PAGE_LIMIT;

		    paging.setPage(page);
		    paging.setStartRow(startRow);
		    paging.setEndRow(endRow);
		    
		    int maxPage = (int)(Math.ceil((double)listCount/PAGE_LIMIT));
		    int startPage = (((int)(Math.ceil((double)page/BLOCK_LIMIT)))-1) * BLOCK_LIMIT + 1;
		    int endPage = startPage + BLOCK_LIMIT - 1;
		    if(endPage > maxPage) {
		       endPage = maxPage;
		    }
		      
		    paging.setMaxPage(maxPage);
		    paging.setStartPage(startPage);
		    paging.setEndPage(endPage);
		    
		List<GoodsDTO> goodsLikeOrder = goddao.goodsLikeOrder(paging);
		 mav.addObject("paging", paging);
		mav.addObject("goodsList",goodsLikeOrder);
		mav.setViewName("GoodsList");
		return mav;
	}
	//장바구니에 넣기
	public void goodsBasket(GoodsDTO goods) {
		goddao.goodsBasket(goods);
	}
	
	//새 주소 띄우기
	public String addressUpdate(String postcode, String address, String detailAddress, String extraAddress) {
	      String resultMsg = null;
	      
	      if(address!=null) {
	         session.setAttribute("newAddress", address);
	         // 업데이트 누르면 session에 저장되고 결제 후에는 session 삭제됨
	         resultMsg = address;
	      }else {
	         resultMsg = null;
	      }
	      
	      return resultMsg;
	}


	
}
