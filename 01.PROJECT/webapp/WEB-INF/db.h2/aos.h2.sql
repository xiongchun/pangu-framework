/*
 !这个脚本不需要执行
 演示系统虚拟业务H2-SQL脚本
 中国嘉靖银行信用卡管理信息系统
*/
-- Create table
DROP TABLE IF EXISTS demo_org;
CREATE TABLE demo_org (
	id_ VARCHAR2 (64) NOT NULL,
	cascade_id_ VARCHAR2 (255) NOT NULL,
	name_ VARCHAR2 (255) NOT NULL,
	hotkey_ VARCHAR2 (255),
	parent_id_ VARCHAR2 (64) NOT NULL,
	is_leaf_ INT (10) DEFAULT 1 NOT NULL,
	is_auto_expand_ INT (10) DEFAULT 0 NOT NULL,
	icon_name_ VARCHAR2 (255),
	address_ VARCHAR2 (255),
    create_user_id_ VARCHAR2 (64) NOT NULL,
	create_time_ TIMESTAMP NOT NULL,
	sort_no_ INT (10)
);
-- Create/Recreate primary, unique and foreign key constraints 
ALTER TABLE demo_org ADD CONSTRAINT demo_org_pk PRIMARY KEY (id_);
-- Add comments to the table 
COMMENT ON TABLE demo_org IS '银行组织机构表';
-- Add comments to the columns 
COMMENT ON COLUMN demo_org.id_ IS '流水号';
COMMENT ON COLUMN demo_org.cascade_id_ IS '节点语义ID';
COMMENT ON COLUMN demo_org.name_ IS '组织名称';
COMMENT ON COLUMN demo_org.hotkey_ IS '热键';
COMMENT ON COLUMN demo_org.parent_id_ IS '父节点流水号';
COMMENT ON COLUMN demo_org.is_leaf_ IS '是否叶子节点';
COMMENT ON COLUMN demo_org.is_auto_expand_ IS '是否自动展开';
COMMENT ON COLUMN demo_org.icon_name_ IS '节点图标文件名称';
COMMENT ON COLUMN demo_org.address_ IS '地址';
COMMENT ON COLUMN demo_org.create_time_ IS '创建时间';
COMMENT ON COLUMN demo_org.create_user_id_ IS '创建人ID';
COMMENT ON COLUMN demo_org.sort_no_ IS '排序号';

-- Create table
DROP TABLE IF EXISTS demo_account;
CREATE TABLE demo_account (
	id_ VARCHAR2 (64) NOT NULL,
	name_ VARCHAR2 (255) NOT NULL,
	card_id_ VARCHAR2 (64),
	card_type_ VARCHAR2 (255),
	balance_ DECIMAL(10,2) DEFAULT 0 NOT NULL,
	credit_line_ DECIMAL(10,2) DEFAULT 0 NOT NULL,
	org_id_ VARCHAR2 (64) NOT NULL,
	id_no_ VARCHAR2 (255) NOT NULL,
	sex_ VARCHAR2 (255) NOT NULL,
	birthday_ DATE,
	age_ INT(10) NOT NULL,
    address_ VARCHAR2 (255),
    create_user_id_ VARCHAR2 (64) NOT NULL,
	create_time_ TIMESTAMP NOT NULL,
);
-- Create/Recreate primary, unique and foreign key constraints 
ALTER TABLE demo_account ADD CONSTRAINT demo_account_pk PRIMARY KEY (id_);
-- Add comments to the table 
COMMENT ON TABLE demo_account IS '银行信用卡账户表';
-- Add comments to the columns 
COMMENT ON COLUMN demo_account.id_ IS '流水号';
COMMENT ON COLUMN demo_account.name_ IS '姓名';
COMMENT ON COLUMN demo_account.card_id_ IS '卡号';
COMMENT ON COLUMN demo_account.card_type_ IS '卡类型';
COMMENT ON COLUMN demo_account.balance_ IS '可用余额';
COMMENT ON COLUMN demo_account.credit_line_ IS '信用额度';
COMMENT ON COLUMN demo_account.org_id_ IS '所属银行机构ID';
COMMENT ON COLUMN demo_account.id_no_ IS '身份证号';
COMMENT ON COLUMN demo_account.sex_ IS '性别';
COMMENT ON COLUMN demo_account.birthday_ IS '生日';
COMMENT ON COLUMN demo_account.age_ IS '年龄';
COMMENT ON COLUMN demo_account.address_ IS '地址';
COMMENT ON COLUMN demo_account.create_time_ IS '创建时间';
COMMENT ON COLUMN demo_account.create_user_id_ IS '创建人ID';
