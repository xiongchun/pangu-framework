package com.pulanit.pangu.admin.system.service;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeNodeConfig;
import cn.hutool.core.lang.tree.TreeUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.google.common.collect.Lists;
import com.pulanit.pangu.admin.system.api.entity.ResourceEntity;
import com.pulanit.pangu.admin.system.api.entity.RoleEntity;
import com.pulanit.pangu.admin.system.api.param.ResourceIn;
import com.pulanit.pangu.admin.system.api.service.ResourceService;
import com.pulanit.pangu.admin.system.dao.mapper.ResourceMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Slf4j
@Service(version = "1.0.0", group = "pangu-admin-system-app")
public class ResourceServiceImpl implements ResourceService {

    @Autowired
    private ResourceMapper resourceMapper;
    private static final Long ROOT_ID = 0l;

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
    public Long add(ResourceIn resourceIn) {
        ResourceEntity resourceEntity = new ResourceEntity();
        BeanUtil.copyProperties(resourceIn, resourceEntity);
        if (Objects.isNull(resourceEntity.getParentId())) {
            resourceEntity.setParentId(ROOT_ID);
        }
        resourceEntity.setGmtCreated(DateUtil.date());
        resourceMapper.insert(resourceEntity);
        return resourceEntity.getId();
    }

    @Override
    public void update(ResourceIn resourceIn) {
        ResourceEntity resourceEntity = new ResourceEntity();
        BeanUtil.copyProperties(resourceIn, resourceEntity);
        if (Objects.isNull(resourceEntity.getParentId())) {
            resourceEntity.setParentId(ROOT_ID);
        }
        resourceEntity.setGmtModified(DateUtil.date());
        resourceMapper.updateById(resourceEntity);
    }

    @Override
    public void delete(Long id) {
        resourceMapper.deleteById(id);
    }

    @Override
    public void batchDelete(List<Long> ids) {
        List<Long> deleteIds = Lists.newArrayList();
        deleteIds.addAll(ids);
        while (CollUtil.isNotEmpty(ids)){
            QueryWrapper queryWrapper = Wrappers.query();
            queryWrapper.select("id").in("parent_id", ids);
            ids = (List<Long>) resourceMapper.selectObjs(queryWrapper);
            deleteIds.addAll(ids);
        }
        deleteIds.stream().distinct().collect(Collectors.toList());
        resourceMapper.deleteBatchIds(deleteIds);
    }

    @Override
    public long validateResourceKey(String resourceKey, Long id) {
        long result = resourceMapper.selectCount(Wrappers.lambdaQuery(ResourceEntity.class).eq(ResourceEntity::getResourceKey, resourceKey));
        if (ObjectUtil.isNotNull(id)){
            ResourceEntity entity = resourceMapper.selectById(id);
            if (StrUtil.equalsIgnoreCase(resourceKey, entity.getResourceKey())){
                return 0;
            }
        }
        return result;
    }

    private void fillTreeNode(Tree<Integer> treeNode, ResourceEntity resourceEntity) {
        treeNode.setId(resourceEntity.getId().intValue());
        treeNode.setParentId(resourceEntity.getParentId().intValue());
        //树形结构构造器的排序字段
        treeNode.setWeight(resourceEntity.getSortNo());
        treeNode.putExtra("type", resourceEntity.getType());
        treeNode.putExtra("title", resourceEntity.getTitle());
        treeNode.putExtra("resourceKey", resourceEntity.getResourceKey());
        treeNode.putExtra("path", resourceEntity.getPath());
        treeNode.putExtra("component", resourceEntity.getComponent());
        treeNode.putExtra("icon", resourceEntity.getIcon());
        treeNode.putExtra("hidden", resourceEntity.getHidden());
        treeNode.putExtra("fullpage", resourceEntity.getFullpage());
        treeNode.putExtra("affix", resourceEntity.getAffix());
        treeNode.putExtra("sortNo", resourceEntity.getSortNo());

    }
}
