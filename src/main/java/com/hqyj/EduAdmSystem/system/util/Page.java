package com.hqyj.EduAdmSystem.system.util;

/**
 * <p>
 * 封装好Page类，用于分页查询
 * </p>	
 * @Copyright (C),
 * @author sxc
 * @Date:2019年10月14日
 */
public class Page<T> {
	// 当前页
	private Integer page = 1;
	// 页大小
	private Integer rows = 5;
	// 总记录 数
	private Integer totalRecord;
	// 总页数
	private Integer totalPage;
	// 开始记录位置
	private Integer start;
	// 通过泛型可以传入不同的实体
	private T t;

	public T getT() {
		return t;
	}

	public void setT(T t) {
		this.t = t;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public Integer getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(Integer totalRecord) {
		this.totalRecord = totalRecord;
	}

	/**
	 * <p>
	 * 计算总的页数
	 * </p>
	 * @author sxc
	 * @Date 2019年10月14日
	 * @return
	 */
	public Integer getTotalPage() {
		totalPage=(totalRecord-1)/rows+1;
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	/**
	 * <p>
	 * 计算传入数据库limit（start值）
	 * </p>
	 * @author sxc
	 * @Date 2019年10月14日
	 * @return
	 */
	public Integer getStart() {
		start=(page-1)*rows;
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	@Override
	public String toString() {
		return "Page [page=" + page + ", rows=" + rows + ", totalRecord=" + totalRecord + ", totalPage=" + totalPage
				+ ", start=" + start + ", t=" + t + "]";
	}

}
