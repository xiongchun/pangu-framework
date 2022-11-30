package com.gitee.pulanos.pangu.framework;

import lombok.SneakyThrows;

import java.sql.Connection;
import java.sql.DriverManager;

public class TestDao {

    private static String url = "jdbc:mysql://127.0.0.1:3306/pangu-showcases";
    private static String user = "root";
    private static String password = "root123456";

    @SneakyThrows
    private static Connection createConnect() {

        return DriverManager.getConnection(url, user, password);
    }

    @SneakyThrows
    public static void main(String[] args) {

//        Connection conn = createConnect();
//        QueryRunner run = new QueryRunner();
//        List<Map<String, Object>> result = run.query(conn,
//                "SELECT * FROM user WHERE name = ?", new MapListHandler(), "熊春");
//        System.out.println(JSONUtil.toJsonStr(result));
//        DbUtils.closeQuietly(conn);
//        FileWriter writer = new FileWriter("test.properties");
//        writer.write("test");
//        String path = "/Users/xc/git2/pangu-framework/pangu-framework-generator-maven-plugin/src/test/java/com/gitee/pulanos/pangu/framework/test.java";
//        FileAppender appender = new FileAppender(new File(path), 16, true);
//        appender.append("123");
//        appender.append("public void main(){}");
//        appender.append("\r\n");
//        appender.append("xyz");
//        appender.flush();
//        appender.toString();

//        Connection connection = DbMetaInfoUtil.createConnect(url, user, password);
//        List<Table> tables = DbMetaInfoUtil.listTables(connection);
//        System.out.println(tables);
//        Table table = DbMetaInfoUtil.findTableInfo(tables, "pangu_user");
//        System.out.println(table);
//        List<Column> columns = DbMetaInfoUtil.listTableColumns(connection, "pangu_user");
//        columns.stream().forEach(System.out::println);


    }



}
