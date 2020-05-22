package com.spiritgarage.www.admin.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spiritgarage.www.admin.mapper.AdminMapper;
import com.spiritgarage.www.admin.service.AdminService;
import com.spiritgarage.www.admin.vo.MngrVO;
import com.spiritgarage.www.reservation.vo.MaintenanceAreaVO;
import com.spiritgarage.www.reservation.vo.ReservationVO;
import com.spiritgarage.www.util.SHA256;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminMapper mapper;

	@Override
	public Map<String, Object> loginValidation(MngrVO vo , HttpSession session) throws Exception {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		MngrVO mngrInfo = mapper.selectMngrInfo(vo);
		
		if(mngrInfo != null) {
			
			String userInputPwd = SHA256.getEncrypt(vo.getPassword(), mngrInfo.getPasswordKey());
			String originPwd = mngrInfo.getPassword();
			
			if(!userInputPwd.equals(originPwd)) {
				result.put("result", "fail");
				result.put("resultString", "비밀번호를 다시 입력하세요.");
			}else {
				result.put("result", "success");
				session.setAttribute("mngrInfo", mngrInfo);
			}
			
		} else {
			result.put("result", "fail");
			result.put("resultString", "존재하지않는 아이디입니다.");
		}
		
		return result;
	}

	@Override
	public Map<String, Object> getMngrManagementList(MngrVO vo) throws Exception {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		vo.setTotCnt(mapper.selectMngrManagementCnt(vo));
		
		result.put("list", mapper.selectMngrManagementList(vo));
		result.put("paging", vo);
		
		return result;
	}

	@Override
	public boolean mngrAddIdDupCheck(MngrVO vo) throws Exception {
		
		boolean result = false;
		int res = mapper.selectMngrIdCount(vo);
		
		if(res == 0) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean mngrAddNameDupCheck(MngrVO vo) throws Exception {
		
		boolean result = false;
		int res = mapper.selectMngrNameCount(vo);
		
		if(res == 0) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean mngrAdd(MngrVO vo) throws Exception {
		
		String passwordKey = SHA256.generateKey();
		String password = SHA256.getEncrypt(vo.getPassword(), passwordKey);
		
		vo.setMngrSeq(UUID.randomUUID().toString());
		vo.setPassword(password);
		vo.setPasswordKey(passwordKey);
		vo.setUseYn("Y");
		
		int res = mapper.insertMngr(vo);
		if(res > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public MngrVO getMngrInfo(MngrVO vo) throws Exception {
		return mapper.selectMngrInfoByMngrSeq(vo);
	}
	
	@Override
	public boolean mngrModify(MngrVO vo) throws Exception{
		
		String password = vo.getPassword();
		if(!"".equals(password)) {
			String passwordKey = SHA256.generateKey();
			String enPassword = SHA256.getEncrypt(password, passwordKey);
			vo.setPasswordKey(passwordKey);
			vo.setPassword(enPassword);
		}
		
		int res = mapper.updateMngr(vo);
		if(res > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public boolean mngrUseModify(MngrVO vo) throws Exception{
		int res = mapper.updateMngrUseYn(vo);
		if(res > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public Map<String, Object> getMaintenanceAreaList(MaintenanceAreaVO vo) throws Exception {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		vo.setTotCnt(mapper.selectMaintenanceAreaCnt(vo));
		
		result.put("list", mapper.selectMaintenanceAreaList(vo));
		result.put("paging", vo);
		
		return result;
	}

	@Override
	public Map<String, Object> maintenanceAreaAdd(MaintenanceAreaVO vo) throws Exception {

		Map<String, Object> result = new HashMap<String, Object>();
		
		MaintenanceAreaVO info = mapper.selectMaintenanceAreaByName(vo);
		if(info != null) {
			result.put("result", "fail");
			result.put("resultString", "같은이름의 정비영역이 이미 있습니다.");
		}else {
			vo.setMaintenanceAreaSeq(UUID.randomUUID().toString());
			int res = mapper.insertMaintenanceArea(vo);
			if(res > 0) {
				result.put("result", "success");
				result.put("resultString", "정비영역이 등록되었습니다");
			}
		}
		
		return result;
	}

	@Override
	public boolean maintenanceAreaDel(MaintenanceAreaVO vo) throws Exception {
		
		int res = mapper.deleteMaintenanceArea(vo);
		
		if(res > 0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public Map<String, Object> getReservationList(ReservationVO vo) throws Exception {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		vo.setTotCnt(mapper.selectReservationCnt(vo));
		
		List<ReservationVO> list = mapper.selectReservationList(vo);
		
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
	public List<Map<String, Object>> getCalendarReservationList(ReservationVO vo) throws Exception{
		return mapper.selectCalendarReservationList(vo);
	}

	@Override
	public ReservationVO getReservationInfo(ReservationVO vo) throws Exception {
		ReservationVO info = mapper.selectReservationInfo(vo);
		String chooseAreaString = info.getChooseArea();
		info.setChooseArea(chooseAreaString.replaceAll("\\|", " , "));
		return info;
	}

	@Override
	public boolean reservationCancel(ReservationVO vo) throws Exception {
		int res = mapper.updateReservationCancel(vo);
		
		if(res > 0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean reservationRep(ReservationVO vo) throws Exception {
		int res = mapper.updateReservationRep(vo);
		
		if(res > 0) {
			return true;
		}else {
			return false;
		}
	}
	
}

