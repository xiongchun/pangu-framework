create table aos_wf_hi_procinst (
    id_ varchar(64) not null,
    proc_inst_id_ varchar(64) not null,
    business_key_ varchar(255),
    proc_def_id_ varchar(64) not null,
    start_time_ datetime(3) not null,
    end_time_ datetime(3),
    duration_ bigint,
    start_user_id_ varchar(255),
    start_act_id_ varchar(255),
    end_act_id_ varchar(255),
    super_process_instance_id_ varchar(64),
    delete_reason_ varchar(4000),
    tenant_id_ varchar(255) default '',
    name_ varchar(255),
    primary key (id_),
    unique (proc_inst_id_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

create table aos_wf_hi_actinst (
    id_ varchar(64) not null,
    proc_def_id_ varchar(64) not null,
    proc_inst_id_ varchar(64) not null,
    execution_id_ varchar(64) not null,
    aos_id_ varchar(255) not null,
    task_id_ varchar(64),
    call_proc_inst_id_ varchar(64),
    aos_name_ varchar(255),
    aos_type_ varchar(255) not null,
    assignee_ varchar(255),
    start_time_ datetime(3) not null,
    end_time_ datetime(3),
    duration_ bigint,
    tenant_id_ varchar(255) default '',
    primary key (id_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

create table aos_wf_hi_taskinst (
    id_ varchar(64) not null,
    proc_def_id_ varchar(64),
    task_def_key_ varchar(255),
    proc_inst_id_ varchar(64),
    execution_id_ varchar(64),
    name_ varchar(255),
    parent_task_id_ varchar(64),
    description_ varchar(4000),
    owner_ varchar(255),
    assignee_ varchar(255),
    start_time_ datetime(3) not null,
    claim_time_ datetime(3),
    end_time_ datetime(3),
    duration_ bigint,
    delete_reason_ varchar(4000),
    priority_ integer,
    due_date_ datetime(3),
    form_key_ varchar(255),
    category_ varchar(255),
    tenant_id_ varchar(255) default '',
    primary key (id_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

create table aos_wf_hi_varinst (
    id_ varchar(64) not null,
    proc_inst_id_ varchar(64),
    execution_id_ varchar(64),
    task_id_ varchar(64),
    name_ varchar(255) not null,
    var_type_ varchar(100),
    rev_ integer,
    bytearray_id_ varchar(64),
    double_ double,
    long_ bigint,
    text_ varchar(4000),
    text2_ varchar(4000),
    create_time_ datetime(3),
    last_updated_time_ datetime(3),
    primary key (id_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

create table aos_wf_hi_detail (
    id_ varchar(64) not null,
    type_ varchar(255) not null,
    proc_inst_id_ varchar(64),
    execution_id_ varchar(64),
    task_id_ varchar(64),
    act_inst_id_ varchar(64),
    name_ varchar(255) not null,
    var_type_ varchar(255),
    rev_ integer,
    time_ datetime(3) not null,
    bytearray_id_ varchar(64),
    double_ double,
    long_ bigint,
    text_ varchar(4000),
    text2_ varchar(4000),
    primary key (id_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

create table aos_wf_hi_comment (
    id_ varchar(64) not null,
    type_ varchar(255),
    time_ datetime(3) not null,
    user_id_ varchar(255),
    task_id_ varchar(64),
    proc_inst_id_ varchar(64),
    action_ varchar(255),
    message_ varchar(4000),
    full_msg_ longblob,
    primary key (id_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

create table aos_wf_hi_attachment (
    id_ varchar(64) not null,
    rev_ integer,
    user_id_ varchar(255),
    name_ varchar(255),
    description_ varchar(4000),
    type_ varchar(255),
    task_id_ varchar(64),
    proc_inst_id_ varchar(64),
    url_ varchar(4000),
    content_id_ varchar(64),
    time_ datetime(3),
    primary key (id_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

create table aos_wf_hi_identitylink (
    id_ varchar(64),
    group_id_ varchar(255),
    type_ varchar(255),
    user_id_ varchar(255),
    task_id_ varchar(64),
    proc_inst_id_ varchar(64),
    primary key (id_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;


create index aos_idx_hi_pro_inst_end on aos_wf_hi_procinst(end_time_);
create index aos_idx_hi_pro_i_buskey on aos_wf_hi_procinst(business_key_);
create index aos_idx_hi_act_inst_start on aos_wf_hi_actinst(start_time_);
create index aos_idx_hi_act_inst_end on aos_wf_hi_actinst(end_time_);
create index aos_idx_hi_detail_proc_inst on aos_wf_hi_detail(proc_inst_id_);
create index aos_idx_hi_detail_act_inst on aos_wf_hi_detail(act_inst_id_);
create index aos_idx_hi_detail_time on aos_wf_hi_detail(time_);
create index aos_idx_hi_detail_name on aos_wf_hi_detail(name_);
create index aos_idx_hi_detail_task_id on aos_wf_hi_detail(task_id_);
create index aos_idx_hi_procvar_proc_inst on aos_wf_hi_varinst(proc_inst_id_);
create index aos_idx_hi_procvar_name_type on aos_wf_hi_varinst(name_, var_type_);
create index aos_idx_hi_procvar_task_id on aos_wf_hi_varinst(task_id_);
create index aos_idx_hi_act_inst_procinst on aos_wf_hi_actinst(proc_inst_id_, aos_id_);
create index aos_idx_hi_act_inst_exec on aos_wf_hi_actinst(execution_id_, aos_id_);
create index aos_idx_hi_ident_lnk_user on aos_wf_hi_identitylink(user_id_);
create index aos_idx_hi_ident_lnk_task on aos_wf_hi_identitylink(task_id_);
create index aos_idx_hi_ident_lnk_procinst on aos_wf_hi_identitylink(proc_inst_id_);
create index aos_idx_hi_task_inst_procinst on aos_wf_hi_taskinst(proc_inst_id_);
