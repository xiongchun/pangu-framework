package com.gitee.pulanos.pangu.framework;

import cn.hutool.json.JSONUtil;
import lombok.SneakyThrows;
import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.List;
import java.util.Map;

public class TestDao {

    private static String url = "jdbc:mysql://127.0.0.1:3306/pangu-showcases";
    private static String user = "root";
    private static String password = "root007";

    @SneakyThrows
    private static Connection createConnect() {

        return DriverManager.getConnection(url, user, password);
    }

    @SneakyThrows
    public static void main(String[] args) {
        Connection conn = createConnect();
        QueryRunner run = new QueryRunner();
        List<Map<String, Object>> result = run.query(conn,
                "SELECT * FROM user WHERE name = ?", new MapListHandler(), "熊春");
        System.out.println(JSONUtil.toJsonStr(result));

        DbUtils.closeQuietly(conn);
//        FileWriter writer = new FileWriter("test.properties");
//        writer.write("test");
//        FileAppender appender = new FileAppender(new File("test.java"), 16, true);
//        appender.append("123");
//        appender.append("public void main(){}");
//        appender.append("\r\n");
//        appender.append("xyz");
//        appender.flush();
//        appender.toString();

    }


}
