package kr.spring.houseboard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.houseboard.dao.HouseMapper;

@Service
@Transactional
public class HouseServiceImpl implements HouseService{
	@Autowired
	private HouseMapper houseMapper;
}
