package com.spiritgarage.www.reservation.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spiritgarage.www.admin.vo.ReservationNotPossibleVO;
import com.spiritgarage.www.reservation.mapper.ReservationMapper;
import com.spiritgarage.www.reservation.service.ReservationService;
import com.spiritgarage.www.reservation.vo.MaintenanceAreaVO;
import com.spiritgarage.www.reservation.vo.ReservationVO;
import com.spiritgarage.www.util.ImageUploadUtil;

@Service
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired
	private ReservationMapper mapper;

	@Override
	public Map<String, Object> reservationImageUpload(MultipartFile upload , String folderName , String imageUploadPath, String baseUrl) throws Exception {
		return ImageUploadUtil.imageUpload(upload, folderName, imageUploadPath, baseUrl);
	}

	@Override
	public Map<String, Object> doReservation(ReservationVO vo) throws Exception {
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("state", "fail");
		
		vo.setReservationSeq(UUID.randomUUID().toString());
		vo.setUseYn("Y");
		
		List<ReservationNotPossibleVO> notList = mapper.selectReservationNotPossible(vo);
		if(notList.size() > 0) {
			result.put("state", "notPossibleFail");
			result.put("reason",notList.get(0).getReason());
			result.put("startDate",notList.get(0).getStartDate());
			result.put("endDate",notList.get(0).getEndDate());
			return result;
		}
		
		int res = mapper.insertReservation(vo);
		
		if(res > 0) {
			result.put("state", "success");
		} else {
			result.put("state", "fail");
		}
		return result;
	}

	@Override
	public Map<String, Object> getMyResList(ReservationVO vo) throws Exception {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		vo.setTotCnt(mapper.selectMyResCnt(vo));
		
		List<ReservationVO> list = mapper.selectMyResList(vo);
		for(ReservationVO rv : list) {
			String chooseAreaString = rv.getChooseArea();
			String[] chooseAreaArr = chooseAreaString.split("\\|");
			String resChooseArea = "";
			for(int i=0;i<chooseAreaArr.length;i++) {
				if(i < 3) {
					resChooseArea += "[" + chooseAreaArr[i] + "] ";
				}
			}
			if(chooseAreaArr.length > 3) {
				resChooseArea += "외 " + (chooseAreaArr.length - 3) + "개";
			}
			rv.setChooseArea(resChooseArea);
		}
		
		result.put("list", list);
		result.put("paging", vo);
		
		return result;
	}

	@Override
	public ReservationVO getReservation(ReservationVO vo) throws Exception {
		return mapper.selectReservation(vo);
	}

	@Override
	public boolean myResCancel(ReservationVO vo) throws Exception {
		
		int res = mapper.updateMyResCancel(vo);
		
		if(res > 0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public List<MaintenanceAreaVO> getMaintenanceAreaList() throws Exception {
		return mapper.selectMaintenanceAreaList();
	}
	
}
