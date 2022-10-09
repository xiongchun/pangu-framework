package com.pulanit.pangu.admin.system.service;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeNodeConfig;
import cn.hutool.core.lang.tree.TreeUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.pulanit.pangu.admin.system.api.entity.DeptEntity;
import com.pulanit.pangu.admin.system.api.entity.ResourceEntity;
import com.pulanit.pangu.admin.system.api.service.ResourceService;
import com.pulanit.pangu.admin.system.dao.mapper.ResourceMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Slf4j
@Service(version = "1.0.0", group = "pangu-admin-system-app")
public class ResourceServiceImpl implements ResourceService {

    @Autowired
    private ResourceMapper resourceMapper;

    @Override
    public List<Tree<Integer>> listForManage() {
        List<ResourceEntity> resourceEntities = resourceMapper.selectList(Wrappers.emptyWrapper());
        TreeNodeConfig config = new TreeNodeConfig();
        List<Tree<Integer>> treeNodes = TreeUtil.build(resourceEntities, 0, config, (resourceEntity, treeNode) -> {
            fillTreeNode(treeNode, resourceEntity);
        });
        return treeNodes;
    }

    @Override
    public void add(ResourceEntity resourceEntity) {

    }

    @Override
    public void update(ResourceEntity resourceEntity) {

    }

    @Override
    public void delete(Long id) {

    }

    @Override
    public void batchDelete(List<Long> ids) {

    }

    private void fillTreeNode(Tree<Integer> treeNode, ResourceEntity resourceEntity){
        treeNode.setId(resourceEntity.getId().intValue());
        treeNode.setName(resourceEntity.getTitle());
        treeNode.setParentId(resourceEntity.getParentId().intValue());
        //树形结构构造器的排序字段
        treeNode.setWeight(resourceEntity.getSortNo());
        treeNode.putExtra("type", resourceEntity.getType());
    }
}
