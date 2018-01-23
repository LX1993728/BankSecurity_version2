package com.anorng.bank.service;

import java.util.List;

import com.anorng.bank.core.utils.Page;
import com.anorng.bank.entity.Link;
import com.anorng.bank.entity.LinkType;
import com.anorng.bank.entity.SecurityCompany;
import com.anorng.bank.entity.SecurityUser;

public interface SecurityService {
	/**
	 * 分页获取证券公司的数据
	 * 
	 * @param p
	 *            页码
	 * @return
	 */
	public Page<SecurityCompany> queryCompanyByPage(Integer p);

	/**
	 * 禁用或启用证券公司
	 * 
	 * @param id
	 * @param isEnable
	 * @return
	 */
	public Boolean disOrEnableSecurity(Long id, Boolean isEnable);


	/**
	 * 根据证券公司管理员的ID查询最新的管理员信息
	 * 
	 * @param id
	 * @return
	 */
	public SecurityUser getSecurityUserById(Long id);

	/**
	 * 根据证券公司管理员的ID 查询该公司的所有证讯数据
	 * 
	 * @param id
	 * @return
	 */
	public List<Link> findLinksofCompanyByUserId(Long id);

	/**
	 * 根据ID查询证讯
	 * 
	 * @param id
	 * @return
	 */
	public Link findLinkById(Long id);

	/**
	 * 删除证讯
	 * 
	 * @param link
	 */
	public void delZX(Link link);

	/**
	 * 判断该证券公司是否有链接被证讯关联
	 * 
	 * @param id
	 *            证券公司的主键
	 * @return
	 */
	public Boolean isZXRelatedToCompany(Long id);

	/**
	 * 根据证券公司的名称进行模糊查询
	 * @param name
	 * @return
	 */
	public Page<SecurityCompany> queryCompanyByLikeName(String name);

	/**
	 * 获取所有已经上架公司的名称和ID
	 * @return
	 */
	public List<SecurityCompany> getCompanyNameAndIds();

	/**
	 * 根据证券公司的ID查询所有的证讯内容
	 * @param id 证券公司的ID
	 * @return
	 */
	public List<Link> getAllLinkByCompanyId(Long id);

	/**
	 *  通过/不通过公司的征询
	 * @param id 证讯ID
	 * @param isEnable 通过/不通过
	 */
	public void isEnableLink(Long id, Boolean isEnable);

	/**
	 * 获取 当前公司证讯没有绑定过的 所有证讯类型
	 * @param id 当前证券公司的ID
	 * @return
	 */
	public List<LinkType> getAllNeedLinkType(Long id);

	/**
	 * 为证券公司
	 * @param typeId 证讯类型的ID
	 * @param companyId 证券公司的ID
	 * @param url
	 * @return
	 */
	public Boolean addLinkForCompany(Long typeId, Long companyId, String url);
}
