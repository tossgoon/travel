package com.page;

import java.sql.Timestamp;

public class SplitPage {

	public SplitPage() {
		// TODO Auto-generated constructor stub

	}

	public SplitPage(int totalRows, int pageRow) {
		this.totalRow = totalRows;
		if(pageRow==0)
		{
			this.pageRow=10;
		}
		else{
			this.pageRow = pageRow;
		}
		this.totalPage = this.totalRow / this.pageRow
				+ ((this.totalRow % this.pageRow == 0) ? 0 : 1);
	}

	// ����һЩ����
	private int pageRow = 10;// ÿҳ��ʾ��¼��
	private int totalRow = 0;// �ܵļ�¼���������ݿ������DAO�ṩ
	private int currentPage = 1;// ��ǰ��ҳ��
	private int firstPage = 1;// ��ҳλ��
	private int totalPage = 1;// �ܵ�ҳ����,Ĭ��Ϊһҳ

	public int getPageRow() {
		return pageRow;
	}

	/**
	 * ��������ÿҳ��ʾ�ļ�¼��
	 * 
	 * @param pageRow
	 *            �µ�ÿҳ��ʾ��¼��
	 */
	public void setPageRow(int pageRow) {
		if (pageRow == 0) {
			pageRow = 10;
		}
		this.pageRow = pageRow;// �޸�ÿҳ�ļ�¼��
		this.totalPage = this.totalRow / this.pageRow
				+ ((this.totalRow % this.pageRow == 0) ? 0 : 1);

	}

	public int getTotalRow() {
		return totalRow;
	}

	public void setTotalRow(int totalRow) {// ���÷�ҳ������ܼ�¼���Ժ�,��Ӧ�ø���ÿҳ����ʾ��¼��,����õ��ܵ�ҳ����
		this.totalRow = totalRow;
		this.totalPage = this.totalRow / this.pageRow
				+ ((this.totalRow % this.pageRow == 0) ? 0 : 1);
		// System.out.println("��ǰҳ" + this.currentPage);
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getFirstPage() {
		return firstPage;
	}

	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	// ��Ӧ���ṩ����������ҳ����,���Ǽ���õ���
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
}
