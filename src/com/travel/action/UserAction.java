package com.travel.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.base.MD5Util;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.page.SplitPage;
import com.travel.pojo.User;
import com.travel.service.UserService;


public class UserAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2125110341085367300L;
	private User user = new User();
	private UserService<User> userService;
	private String searchText;
	private List<User> users;
	private String errorMsg;
	private SplitPage page;
	public UserAction() {

	}

	@JSON(serialize = false)
	protected String getParam(String key) {
		return ServletActionContext.getRequest().getParameter(key);
	}

	public String add() {
		String result = "";
		try {
			User tuser = userService.queryUserByName(user.getLoginname());
			if (tuser != null) {
				setErrorMsg("1");// ������
			} else {
				String md5OfPass="";//md5����֮�������
				md5OfPass=MD5Util.getMD5("111111");
				user.setPassword(md5OfPass);
				userService.addUser(user);
				// throw new RuntimeException("");
				setErrorMsg("0");
			}
			result = SUCCESS;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			setErrorMsg("�����û�����" + e.getMessage());
			result = ERROR;
		}
		return result;
	}

	public String update() {
		try {
			userService.updateUserNoPassword(user);
			setErrorMsg("0");
			return SUCCESS;
		} catch (Exception e) {
			// TODO: handle exception
			setErrorMsg("�����û�����" + e.getMessage());
			return ERROR;
		}
		// System.out.println(this);
	}
	
	public String updateUserPass(){
		try {
			String oldpassword=getParam("oldpass");
			String newpassword=getParam("newpass");
			Integer userid = (Integer) ActionContext.getContext().getSession().get("userid");//�û�ID
			User muser=this.userService.getUser(User.class, userid);
			String md5oldpass=MD5Util.getMD5(oldpassword);//���ܺ�ľ�����
			if(md5oldpass.equals(muser.getPassword()))
			{
				String md5newpass=MD5Util.getMD5(newpassword);//���ܺ��������
				muser.setPassword(md5newpass);
				this.userService.updateUserPassword(muser);
				setErrorMsg("0");
			}
			else{
				setErrorMsg("ԭ�����������");
			}
			return SUCCESS;
		} catch (Exception e) {
			// TODO: handle exception
			setErrorMsg("�����û�����" + e.getMessage());
			return ERROR;
		}
	}

	public String delete() {
		try {
			Integer param = Integer.parseInt(getParam("id"));
			userService.deleteUser(param, User.class);
			setErrorMsg("0");
		} catch (Exception e) {
			e.printStackTrace();
			setErrorMsg("ɾ���û�����" + e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}

	public String query() {
		if(getParam("param")!=null)
		{
			users = userService.queryUserByName("", User.class);
			return "getalluser";
		}
		searchText = getParam("queryText");
		users = userService.queryUserByName(searchText, User.class);
		// setUsers(userService.queryUserByName(searchText, User.class));
		return SUCCESS;
	}
	
	public String queryByPage() {
		int pagesize = 10;
		int pagenum = 1;
		if (getParam("pagesize") != null && getParam("pagenum") != null) {
			pagesize = Integer.parseInt(getParam("pagesize"));// ÿҳ����
			pagenum = Integer.parseInt(getParam("pagenum"));// ҳ��
		}
		users = userService.queryUserByPage(User.class, pagesize, pagenum);
		int num = userService.getUserCount();
		page = new SplitPage(num,pagesize);
		page.setCurrentPage(pagenum);
		return SUCCESS;
	}

	public String login2() {
		try {
			User userresult = userService.queryUserByName(user.getLoginname());
			if (userresult == null) {
				setErrorMsg("�û�������");
				return INPUT;
			} else {
				User user1 = userService.queryUserByNamePassword(
						user.getLoginname(), user.getPassword());
				if (user1 != null) {
					setErrorMsg("0");
					ActionContext.getContext().getSession().put("userid", user1.getId());//���û�id�洢��loginname��
					ActionContext.getContext().getSession().put("loginname", user1.getLoginname());//���û������洢��loginname��
					return SUCCESS;
				} else {
					setErrorMsg("�������");
					return INPUT;
				}
			}
		} catch (Exception ex) {
			setErrorMsg("ɾ���û�����" + ex.getMessage());
			return ERROR;
		}
	}
	
	public String login() {
		try {
			User userresult = userService.queryUserByName(user.getLoginname());
			if (userresult == null) {
				setErrorMsg("�û�������");
				return ERROR;
			} else {
				User user1 = userService.queryUserByNamePassword(
						user.getLoginname(), user.getPassword());
				if (user1 != null) {
					setErrorMsg("0");
					ActionContext.getContext().getSession().put("userid", user1.getId());//���û�id�洢��loginname��
					ActionContext.getContext().getSession().put("loginname", user1.getLoginname());//���û������洢��loginname��
					if(user1.getUsertype().equals("9")){
						return "admin";
					}
					return "normal";
				} else {
					setErrorMsg("�������");
					return ERROR;
				}
			}
		} catch (Exception ex) {
			setErrorMsg("ɾ���û�����" + ex.getMessage());
			return ERROR;
		}
	}
	
	public String signout() {
		try {
			ActionContext.getContext().getSession().remove("userid");//���û�id�洢��loginname��
			ActionContext.getContext().getSession().remove("loginname");//���û������洢��loginname��
			return SUCCESS;
		} catch (Exception ex) {
			setErrorMsg("ɾ���û�����" + ex.getMessage());
			return ERROR;
		}
	}
	
	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@JSON(serialize = false)
	public UserService<User> getUserService() {
		return userService;
	}

	public void setUserService(UserService<User> userService) {
		this.userService = userService;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public SplitPage getPage() {
		return page;
	}

	public void setPage(SplitPage page) {
		this.page = page;
	}
}
