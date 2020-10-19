package com.icia.project.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.project.dao.EducationDAO;
import com.icia.project.dto.EduCommentDTO;
import com.icia.project.dto.EduCommentLikeDTO;
import com.icia.project.dto.EducationDTO;
import com.icia.project.dto.MemberDTO;

@Service
public class EducationService {
	
	ModelAndView mav = new ModelAndView();
	
	@Autowired
	EducationDAO edudao = new EducationDAO();
	
	@Autowired
	HttpSession session;
	
	List<EduCommentDTO> educommentList = new ArrayList<EduCommentDTO>();
	
	// 교육 리스트 
	public ModelAndView educationList(EducationDTO education) {
		List<EducationDTO> educationList = edudao.educationList(education);
		mav.addObject("educationList", educationList);
		mav.setViewName("Education");
		return mav;
	}
	
	
	// 교육 상세보기
	public ModelAndView educationView(int eduNum) {
		EducationDTO educationView = edudao.educationView(eduNum);
		
//		edudao.eduHit(eduNum);
		
		mav.addObject("educationView",educationView);
		mav.setViewName("EducationView");
		
		return mav;
	}
	
	
	// 댓글
	List<EduCommentDTO> edul = new ArrayList<EduCommentDTO>();
	
	// 댓글 리스트
	public List<EduCommentDTO> educationCommentList(EduCommentDTO eduComment) {
		educommentList = edudao.educationCommentList(eduComment.getCommentEduNum());
		return educommentList;
	}

	// 댓글 작성
	public List<EduCommentDTO> educationComment(EduCommentDTO eduComment)throws IllegalStateException, IOException {
		System.out.println("educomment=="+eduComment);
		int educationComment = edudao.educationComment(eduComment);
		if(educationComment>0) {
			educommentList = edudao.educationCommentList(eduComment.getCommentEduNum());
		} else {
			educommentList = null;
		}
		return educommentList;
	}

	// 댓글 삭제
	public List<EduCommentDTO> educationCommentDelete(EduCommentDTO eduComment) {
		int educationCommentLikeDelete = edudao.educationCommentLikeDelete(eduComment);
		if(educationCommentLikeDelete>0) {
			int educationCommentDelete = edudao.educationCommentDelete(eduComment);
			if(educationCommentDelete>0) {
				educommentList = edudao.educationCommentList(eduComment.getCommentEduNum());
			} else {
				educommentList = null;
			}
		
		}else {
			int educationCommentDelete = edudao.educationCommentDelete(eduComment);
			if (educationCommentDelete>0) {
				educommentList = edudao.educationCommentList(eduComment.getCommentEduNum());
			}else {
				educommentList = null;
			}
		}
		return educommentList;
	}

	// 좋아요
	public List<EduCommentDTO> educationCommentLike(EduCommentDTO eduComment) {
		// 좋아요 테이블 아이디 조회
		EduCommentLikeDTO educationCommentLikeCheck = edudao.educationCommentLikeCheck(eduComment);
		
		if(educationCommentLikeCheck!=null) {
			// 좋아요 취소
			int educationUnLike = edudao.educationCommentUnLike(eduComment);
			if(educationUnLike>0) {
				int educationUnLikeDelete = edudao.educationCommentLikeUserIdDelete(eduComment);
				if(educationUnLikeDelete>0) {
					educommentList = edudao.educationCommentList(eduComment.getCommentEduNum());
				}
			}
		}else {
			// 좋아요
			int educationLikeAdd = edudao.educationCommentLikeAdd(eduComment);
			if(educationLikeAdd>0) {
				int educationLike = edudao.educationCommentLike(eduComment);
				if(educationLike>0) {
					educommentList = edudao.educationCommentList(eduComment.getCommentEduNum());
				}
			}
		}
		return educommentList;
	}

	// 댓글 수정
	public List<EduCommentDTO> educationCommentModify(EduCommentDTO eduComment) {
		int educationCommentModify = edudao.educationCommentModify(eduComment);
		
		if (educationCommentModify >0) {
			educommentList = edudao.educationCommentList(eduComment.getCommentEduNum());
		}else {
			educommentList = null;
		}
		return educommentList;
	}
	EduCommentDTO edu = new EduCommentDTO();
	
	EducationDTO eduu = new EducationDTO();
	
	//좋아요 수 조회
	public EducationDTO eduLike(EducationDTO education) {
		//좋아요 수
		eduu.setEduLike(edudao.eduLike(education));
		eduu.setLikeUserId(edudao.eduLikeUserId(education));
		
		return eduu;
	}
	
	// 교육 게시글 좋아요
	public EducationDTO educationLike(EducationDTO education) {
		edudao.eduLikeUser(education);
		edudao.educationLike(education);
		eduu.setEduLike(edudao.eduLike(education));
		eduu.setLikeUserId(edudao.eduLikeUserId(education));
	
		return eduu;
	}
	
	// 교육 게시글 좋아요 취소
	public EducationDTO educationUnLike(EducationDTO education) {
		edudao.educationUnLike(education);
		edudao.eduUnLikeUser(education);
		eduu.setEduLike(edudao.eduLike(education));
		eduu.setLikeUserId(edudao.eduLikeUserId(education));
		
		return eduu;
	}


}
