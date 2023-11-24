package com.pulanit.pangu.admin.system.service;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.collection.ListUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeNodeConfig;
import cn.hutool.core.lang.tree.TreeUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.pulanit.pangu.admin.system.api.entity.DeptEntity;
import com.pulanit.pangu.admin.system.api.param.DeptIn;
import com.pulanit.pangu.admin.system.api.service.DeptService;
import com.pulanit.pangu.admin.system.dao.mapper.DeptMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Slf4j
@DubboService(version = "1.0.0", group = "pangu-admin-system")
public class DeptServiceImpl implements DeptService {

    @Autowired
    private DeptMapper deptMapper;

    private static final Long ROOT_ID = 0l;

    @Override
    public List<Tree<Integer>> list(DeptIn deptIn) {
        List<Tree<Integer>> treeNodes = null;
        if (ObjectUtil.isEmpty(deptIn.getName())){
            treeNodes = listAll();
        }else {
            treeNodes = listByName(deptIn.getName());
        }
        return treeNodes == null ? ListUtil.list(false) : treeNodes;
    }

    private List<Tree<Integer>> listAll() {
        List<DeptEntity> deptEntities = deptMapper.selectList(Wrappers.emptyWrapper());
        TreeNodeConfig config = new TreeNodeConfig();
        List<Tree<Integer>> treeNodes = TreeUtil.build(deptEntities, 0, config, (deptEntity, treeNode) -> {
            fillTreeNode(treeNode, deptEntity);
        });
        return treeNodes;
    }

    private List<Tree<Integer>> listByName(String name) {
        LambdaQueryWrapper<DeptEntity> queryWrapper = Wrappers.lambdaQuery();
        queryWrapper.like(ObjectUtil.isNotEmpty(name), DeptEntity::getName, name);
        List<DeptEntity> deptEntities = deptMapper.selectList(queryWrapper);
        List<Tree<Integer>> treeNodes = ListUtil.list(false);
        deptEntities.forEach(deptEntity -> {
            Tree<Integer> treeNode = new Tree<>();
            fillTreeNode(treeNode, deptEntity);
            treeNodes.add(treeNode);
        });
        return treeNodes;
    }

    private void fillTreeNode(Tree<Integer> treeNode, DeptEntity deptEntity){
        treeNode.setId(deptEntity.getId().intValue());
        treeNode.setName(deptEntity.getName());
        treeNode.setParentId(deptEntity.getParentId().intValue());
        //树形结构构造器的排序字段
        treeNode.setWeight(deptEntity.getSortNo());
        treeNode.putExtra("status", deptEntity.getStatus());
        treeNode.putExtra("gmtCreated", DateUtil.formatDateTime(deptEntity.getGmtCreated()));
        treeNode.putExtra("type", deptEntity.getType());
        treeNode.putExtra("bizCode", deptEntity.getBizCode());
        treeNode.putExtra("sortNo", deptEntity.getSortNo());
        treeNode.putExtra("remark", deptEntity.getRemark());
    }

    @Override
    public void add(DeptEntity deptEntity) {
        deptEntity.setGmtCreated(DateUtil.date());
        if (Objects.isNull(deptEntity.getParentId())){
            deptEntity.setParentId(ROOT_ID);
        }
        deptMapper.insert(deptEntity);
    }

    @Override
    public void update(DeptEntity deptEntity) {
        deptEntity.setGmtModified(DateUtil.date());
        if (Objects.isNull(deptEntity.getParentId())){
            deptEntity.setParentId(ROOT_ID);
        }
        deptMapper.updateById(deptEntity);
    }

    @Override
    public void delete(Long id) {
        deptMapper.deleteById(id);
    }


    @Transactional
    @Override
    public void batchDelete(List<Long> ids) {
        List<Long> deleteIds = ListUtil.list(false);
        deleteIds.addAll(ids);
        while (CollUtil.isNotEmpty(ids)){
            QueryWrapper queryWrapper = Wrappers.query();
            queryWrapper.select("id");
            queryWrapper.in("parent_id", ids);
            ids = (List<Long>) deptMapper.selectObjs(queryWrapper);
            deleteIds.addAll(ids);
        }
        deleteIds.stream().distinct().collect(Collectors.toList());
        deptMapper.deleteBatchIds(deleteIds);
    }


}
