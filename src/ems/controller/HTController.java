package ems.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import ems.entity.HwTeacher;
import ems.entity.Msg;
import ems.service.HtService;

@Controller
@RequestMapping("/ht/")
public class HTController {
	@Autowired
	HtService htService;

	@RequestMapping("getAllWithJson.do")
	@ResponseBody
	public Msg getAllWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn,Integer bc_idx) {
		PageHelper.startPage(pn, 5);//从pn页开始查询，每页有5条数据
		List<HwTeacher> list=htService.getAllHt(bc_idx);
		
		PageInfo<HwTeacher> pageInfo=new PageInfo<>(list,5);//使用pageInfo包装查询结果,连续显示5页
		return Msg.success().add("pageInfo", pageInfo);
	}
	
	@RequestMapping("pubHt.do")
	@ResponseBody
	public Msg pubHt(HwTeacher hwTeacher,HttpSession session,MultipartFile file) {
		String path="";
		if(!file.isEmpty()) {
			String fileName=file.getOriginalFilename();
			path=session.getServletContext().getRealPath("/")+"teacher_folder/"+
					new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())+"_"+fileName;
			try {
				file.transferTo(new File(path));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			hwTeacher.setHt_path(path);
			hwTeacher.setFile_name(fileName);
		}
		
		DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
		String pub_date=dateFormat.format(new Date());
		hwTeacher.setHt_pub_time(pub_date);
		htService.pubHt(hwTeacher);
		return Msg.success();
	}
	
	@RequestMapping("htDownLoad.do")
	public ResponseEntity<byte[]> htDownLoad(@RequestParam("ht_idx") Integer ht_idx) throws IOException{
		HwTeacher hwTeacher=htService.queryByIdx(ht_idx);
		File file=new File(hwTeacher.getHt_path());
		String name=hwTeacher.getFile_name();
		HttpHeaders headers = new HttpHeaders();
	    String fileName = "";
		try {
			fileName = new String(name.getBytes("UTF-8"), "iso-8859-1");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}// 为了解决中文名称乱码问题
       headers.setContentDispositionFormData("attachment", fileName);
       headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
       return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
              headers, HttpStatus.CREATED);
	}
	
	@RequestMapping("updateWeight.do")
	public void updateWeight(Integer ht_idx,Double ht_weight) {
		htService.updateWeight(ht_idx,ht_weight);
	}
	
}
