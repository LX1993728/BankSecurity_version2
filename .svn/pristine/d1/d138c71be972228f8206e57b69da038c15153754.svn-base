package com.anorng.bank.serviceImpl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.anorng.bank.entity.Link;
import com.anorng.bank.entity.LinkType;
import com.anorng.bank.entity.Market;
import com.anorng.bank.entity.SecurityCompany;
import com.anorng.bank.service.BankService;

@Service
@Transactional
@SuppressWarnings("unchecked")
public class BankServiceImpl implements BankService {
	private final Logger log = LoggerFactory.getLogger(BankServiceImpl.class);
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Object> findAllCompanyNameAndId() {
		List<Object> resultList = em
				.createQuery("SELECT new SecurityCompany(id,name) FROM SecurityCompany c WHERE c.status=:stat")
				.setParameter("stat", SecurityCompany.STATUS.UP).getResultList();
		return resultList;
	}

	@Override
	public List<Market> getAllMarket() {
		TypedQuery<Market> query = em.createQuery("SELECT m FROM Market m", Market.class);
		return query.getResultList();
	}

	@Override
	public List<Link> getLinksByTypeId(Long id) {
		String sql = "SELECT l FROM Link l WHERE l.linkType.id = :typeId AND l.securityCompany.status = 'UP' AND l.status = 'ENABLE'";
		List<Link> list = em.createQuery(sql, Link.class).setParameter("typeId", id).getResultList();
		for (Link link : list) {
			link.setCompanyName(link.getSecurityCompany().getName());
		}
		return list;
	}

	@Override
	public Boolean bindLinkToMarket(Long linkId, Long marketId) {
		Link link = em.find(Link.class, linkId);
		Market market = em.find(Market.class, marketId);
		if (link == null || market == null) {
			return false;
		}
		if (!market.getLinkType().getId().equals(link.getLinkType().getId())) {
			return false;
		}
		market.setLink(link);
		em.persist(market);
		return true;
	}

	@Override
	public List<LinkType> getAllLinkTypes() {
		List<LinkType> resultList = em.createQuery("SELECT t FROM LinkType t", LinkType.class).getResultList();
		return resultList;
	}

	@Override
	public Boolean changeTypeName(String name, Long id) {
		LinkType linkType = em.find(LinkType.class, id);
		if (linkType == null) {
			return false;
		}
		linkType.setName(name);
		em.persist(linkType);
		return true;
	}

	@Override
	public Boolean addType(String name) {
		// 首先创建新的证讯类型
		LinkType linkType = new LinkType();
		linkType.setName(name);
		// 再创建一个新的行情 绑定证讯类型 ,有级联关系 保存market即可
		Market market = new Market();
		market.setLinkType(linkType);
		em.persist(market);
		return true;
	}

	@Override
	public Boolean deleteType(Long id) {
		LinkType linkType = em.find(LinkType.class, id);
		if (linkType == null) {
			return false;
		}
		// 首先删除 与类型绑定的行情
		em.createQuery("DELETE FROM Market m WHERE m.linkType.id=:tId").setParameter("tId", id).executeUpdate();
		// 其次删除 与该类型相关联的证讯链接
		em.createQuery("DELETE FROM Link l WHERE l.linkType.id=:tId").setParameter("tId", id).executeUpdate();
		// 最后删除证讯类型
		em.remove(linkType);
		return true;
	}

}
