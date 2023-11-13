package com.pulanit.pangu.admin.system.service;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeNodeConfig;
import cn.hutool.core.lang.tree.TreeUtil;
import cn.hutool.core.util.BooleanUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Assert;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.pulanit.pangu.admin.system.api.SystemConstants;
import com.pulanit.pangu.admin.system.api.domain.MenuMetaInfo;
import com.pulanit.pangu.admin.system.api.entity.ResourceEntity;
import com.pulanit.pangu.admin.system.api.param.ResourceForLoginOut;
import com.pulanit.pangu.admin.system.api.param.ResourceOut;
import com.pulanit.pangu.admin.system.api.service.ResourceService;
import com.pulanit.pangu.admin.system.dao.mapper.ResourceMapper;
import com.pulanit.pangu.admin.system.manager.ResourceManager;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Slf4j
@DubboService(version = "1.0.0", group = "pangu-admin-system")
public class ResourceServiceImpl implements ResourceService {

    @Autowired
    private ResourceMapper resourceMapper;
    @Autowired
    private ResourceManager resourceManager;
    private static final Long ROOT_ID = 0L;

    @Override
    public ResourceForLoginOut listForLogin(Long userId) {
        ResourceForLoginOut out = new ResourceForLoginOut();
        List<ResourceEntity> resourceEntities = resourceManager.listResourceEntitiesByUserId(userId);
        List<ResourceEntity> menuEntities = Collections.emptyList();;
        menuEntities.addAll(resourceEntities);
        CollectionUtil.filter(menuEntities, e -> !SystemConstants.ResourceType.BUTTON.equals(e.getType()));
        TreeNodeConfig config = new TreeNodeConfig();
        List<Tree<Integer>> treeNodes = TreeUtil.build(menuEntities, ROOT_ID.intValue(), config, (resourceEntity, treeNode) -> {
            fillHomeMenuTreeNode(treeNode, resourceEntity);
        });
        out.setMenu(treeNodes);
        CollectionUtil.filter(resourceEntities, e -> SystemConstants.ResourceType.BUTTON.equals(e.getType()));
        List<String> permissions = resourceEntities.stream().map(ResourceEntity::getResourceKey).collect(Collectors.toList());
        out.setPermissions(permissions);
        return out;
    }

    @Override
    public List<Tree<Integer>> listForManage() {
        List<ResourceEntity> resourceEntities = resourceMapper.selectList(Wrappers.emptyWrapper());
        TreeNodeConfig config = new TreeNodeConfig();
        List<Tree<Integer>> treeNodes = TreeUtil.build(resourceEntities, ROOT_ID.intValue(), config, (resourceEntity, treeNode) -> {
            fillTreeNode(treeNode, resourceEntity);
        });
        return treeNodes;
    }

    @Override
    public ResourceOut listForGrant(Long roleId) {
        ResourceOut resourceOut = new ResourceOut();
        List<ResourceEntity> resourceEntities = resourceMapper.selectList(Wrappers.emptyWrapper());
        TreeNodeConfig config = new TreeNodeConfig();
        List<Tree<Integer>> treeNodes = TreeUtil.build(resourceEntities, ROOT_ID.intValue(), config, (resourceEntity, treeNode) -> {
            fillSimpleTreeNode(treeNode, resourceEntity);
        });
        resourceOut.setMenuList(treeNodes);
        List<ResourceEntity> checkedResources = resourceManager.listResourceEntitiesByRoleId(roleId);
        List<Long> checkedIds = checkedResources.stream().map(ResourceEntity::getId).collect(Collectors.toList());
        resourceOut.setCheckedList(checkedIds);
        return resourceOut;
    }

    @Override
    public Long add(ResourceEntity resourceEntity) {
        if (Objects.isNull(resourceEntity.getParentId())) {
            resourceEntity.setParentId(ROOT_ID);
        }
        resourceEntity.setGmtCreated(DateUtil.date());
        resourceMapper.insert(resourceEntity);
        return resourceEntity.getId();
    }

    @Override
    public void update(ResourceEntity resourceEntity) {
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
        List<Long> deleteIds = Collections.emptyList();
        deleteIds.addAll(ids);
        while (CollUtil.isNotEmpty(ids)){
            QueryWrapper queryWrapper = Wrappers.query();
            queryWrapper.select("id");
            queryWrapper.in("parent_id", ids);
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


    @Override
    public List<Tree<Integer>> listAllResourcesByUserId(Long userId) {
        Assert.notNull(userId, "人员 ID 不能为空");
        List<ResourceEntity> resourceEntities = resourceManager.listResourceEntitiesByUserId(userId);
        TreeNodeConfig config = new TreeNodeConfig();
        List<Tree<Integer>> treeNodes = TreeUtil.build(resourceEntities, ROOT_ID.intValue(), config, (resourceEntity, treeNode) -> {
            fillSimpleTreeNode(treeNode, resourceEntity);
        });
        return treeNodes;
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
        treeNode.putExtra("color", resourceEntity.getColor());
    }

    private void fillSimpleTreeNode(Tree<Integer> treeNode, ResourceEntity resourceEntity) {
        treeNode.setId(resourceEntity.getId().intValue());
        treeNode.setParentId(resourceEntity.getParentId().intValue());
        //树形结构构造器的排序字段
        treeNode.setWeight(resourceEntity.getSortNo());
        treeNode.putExtra("type", resourceEntity.getType());
        treeNode.putExtra("title", resourceEntity.getTitle());
    }

    private void fillHomeMenuTreeNode(Tree<Integer> treeNode, ResourceEntity resourceEntity) {
        treeNode.setId(resourceEntity.getId().intValue());
        treeNode.setParentId(resourceEntity.getParentId().intValue());
        //树形结构构造器的排序字段
        treeNode.setWeight(resourceEntity.getSortNo());
        treeNode.putExtra("name", resourceEntity.getResourceKey());
        treeNode.putExtra("path", resourceEntity.getPath());
        treeNode.putExtra("component", resourceEntity.getComponent());
        MenuMetaInfo meta = new MenuMetaInfo();
        meta.setIcon(resourceEntity.getIcon());
        meta.setColor(resourceEntity.getColor());
        meta.setType(resourceEntity.getType());
        meta.setTitle(resourceEntity.getTitle());
        meta.setAffix(BooleanUtil.toBoolean(resourceEntity.getAffix()));
        meta.setFullpage(BooleanUtil.toBoolean(resourceEntity.getFullpage()));
        meta.setHidden(BooleanUtil.toBoolean(resourceEntity.getHidden()));
        treeNode.putExtra("meta", meta);
    }
}
