package com.myspring.myapp.board.cotroller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.myspring.myapp.board.service.BoardService;
import com.myspring.myapp.board.vo.ReplyVO;

@RestController
@RequestMapping(value="restBoard")
public class RestBoardControllerImpl implements RestBoardController{
	
	private static final Logger logger = LoggerFactory.getLogger(RestBoardControllerImpl.class);
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private ReplyVO replyVO;
	
	/* READ */
	@GetMapping("/{boardSeq}")
	public ResponseEntity<List<ReplyVO>> getReplyList(@PathVariable Integer boardSeq) {
		System.out.println("restBoard/read: "+boardSeq);
		ResponseEntity<List<ReplyVO>> entity = null;
		try {
			entity = new ResponseEntity<List<ReplyVO>>(boardService.getReplyList(boardSeq), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<ReplyVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	/* CREATE */
	@PostMapping("/new")
	public ResponseEntity<String> addReply(@RequestBody ReplyVO replyVO) {
		System.out.println("restBoard/create: "+replyVO);
		ResponseEntity<String> entity = null;
		try {
			boardService.addReply(replyVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	/* UPDATE */
	@PatchMapping("") //@PathVariable("replySeq") Integer replySeq,
	public ResponseEntity<String> updateReply(@RequestBody ReplyVO replyVO) {
		System.out.println("restBaord/update값: "+replyVO);
		ResponseEntity<String> entity = null;
		try {
			boardService.updateReply(replyVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	/* DELETE */
	@DeleteMapping("/{replySeq}")
	public ResponseEntity<String> deleteReply(@PathVariable Integer replySeq) {
		System.out.println("restBoard/delete값: "+replySeq);
		ResponseEntity<String> entity = null;
		try {
			boardService.deleteReply(replySeq);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}

}
