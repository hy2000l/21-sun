package com.echarts.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

public class EChartsDataServelt extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public EChartsDataServelt() {
		super();
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/json; charset=utf-8");
		JSONObject jsonObj=new JSONObject();
		//��̨���ݣ�����������ݾͲ������ݿ��ȡ��
		Map map=new HashMap();
		map.put("category", new String[]{"��һ����","�ڶ�����","��������","���ļ���"});
		map.put("soft_data", new int[]{80, 300, 200, 100} );
		map.put("net_data", new int[]{50, 200, 120, 200});
		map.put("mobile_data",new int[]{20, 60, 30, 15});
		jsonObj.putAll(map);
		response.getWriter().println(jsonObj.toString());
		
	}

}
