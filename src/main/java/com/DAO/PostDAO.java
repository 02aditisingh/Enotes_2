package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.User.Post;

public class PostDAO {
	private Connection conn;

	public PostDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addNotes(String ti, String co, int ui) {
		boolean f = false;
		try {
			String q = "insert into post(title, content, uid) values(?,?,?)";

			PreparedStatement ps = conn.prepareStatement(q);

			ps.setString(1, ti);
			ps.setString(2, co);
			ps.setInt(3, ui);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		}

		catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}
	//Retrieving the data from addnotes table in database
		public List<Post> getData(int id)
		{
			List<Post> list=new ArrayList<Post>();
			Post po = new Post();
			
			try {
				String query = "select * from addnotes where uid=?";
				PreparedStatement ps = conn.prepareStatement(query);
				ps.setInt(1, id);
				
				ResultSet rs = ps.executeQuery();//retrieving the data using Result Set
				while(rs.next())
				{
					//Post post = new Post();
					po.setId(rs.getInt(1));
					po.setTitle(rs.getString(2));
					po.setContent(rs.getString(3));
					po.setPdate(rs.getTimestamp(4));
					
					//Adding the retrieved data in the list
					list.add(po);
					
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}
		
		public Post getDataById(int noteId) {
			Post p = null;
			try {
				String q = "select * from where id=?";
				PreparedStatement ps = conn.prepareStatement(q);
				ps.setInt(1, noteId);
				
				ResultSet rs = ps.executeQuery();
				if(rs.next()) {
					p = new Post();
					p.setId(rs.getInt(1));
					p.setTitle(rs.getString(2));
					p.setContent(rs.getString(3));
					
				}
				
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			return p;
			
		}
		public boolean postUpdate(int nid, String ti, String co) {
			boolean f = false;
			try {
				String q = "update post title=?,content=? where id=?";

				PreparedStatement ps = conn.prepareStatement(q);

				ps.setString(1, ti);
				ps.setString(2, co);
				ps.setInt(3, nid);

				int i = ps.executeUpdate();
				if (i == 1) {
					f = true;
				}
			}

			catch (Exception e) {
				e.printStackTrace();
			}
			return f;

		}
		public boolean DeleteNotes(int nid) {
			boolean f = false;
			try {
				String q = "delete from post where id=?";

				PreparedStatement ps = conn.prepareStatement(q);

				
				
				ps.setInt(1, nid);

				int i = ps.executeUpdate();
				if (i == 1) {
					f = true;
				}
			}

			catch (Exception e) {
				e.printStackTrace();
			}
			return f;

		}
			
		
}


	

