package com.anorng.bank.service;

import java.util.List;

import com.anorng.bank.entity.Link;
import com.anorng.bank.entity.LinkType;
import com.anorng.bank.entity.Market;

/**
 * 处理银行管理的业务逻辑
 * 
 * @author liuxun
 *
 */
public interface BankService {

	/**
	 * 获取所有证券公司的名称以及对应的主键
	 * 
	 * @return
	 */
	public List<Object> findAllCompanyNameAndId();

	/**
	 * 获取所有的行情
	 * @return
	 */
	public List<Market> getAllMarket();

	/**
	 * 根据证讯类型的ID查询符合条件的证讯
	 * @param id
	 * @return
	 */
	public List<Link> getLinksByTypeId(Long id);

	/**
	 * 将证讯绑定到
	 * @param linkId
	 * @param marketId
	 * @return 
	 */
	public Boolean bindLinkToMarket(Long linkId, Long marketId);

	/**
	 * 获取所有的证讯类型
	 * @return
	 */
	public List<LinkType> getAllLinkTypes();

	/**
	 * 修改证讯类型的名称
	 * @param name
	 * @param id
	 * @return
	 */
	public Boolean changeTypeName(String name, Long id);

	/**
	 * 添加证讯类型
	 * @param name
	 * @return
	 */
	public Boolean addType(String name);

	/**
	 * 根据ID删除证讯类型
	 * @param id
	 * @return
	 */
	public Boolean deleteType(Long id);


}
