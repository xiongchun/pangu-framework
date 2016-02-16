package cn.osworks.aos.mylab.study;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * 基于PostgreSQL的JDBC直连操作例子
 * 
 * @author OSWorks-XC
 * @date 2013-08-18
 */
public class JdbcBasedExample {

	static String url = "jdbc:postgresql://127.0.0.1:5432/aos";
	static String usr = "postgres";
	static String psd = "111111";

	public static void main(String args[]) {
		System.out.println("BAA");
		Connection conn = null;
		try {
			Class.forName("org.postgresql.Driver");
			conn = DriverManager.getConnection(url, usr, psd);
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM az01");
			while (rs.next()) {
				//System.out.println(rs.getString(1));
			}
			rs.close();
			st.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
