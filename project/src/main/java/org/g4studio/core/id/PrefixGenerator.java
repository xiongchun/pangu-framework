package org.g4studio.core.id;

/**
 * InitSequenceGeneratorException
 * 前缀生成器
 * 因为创建的值用于作为ID的前缀，所以取名为PrefixGenerator.
 * 对于在集群环境部署的系统，通常需要给ID设置前缀，这样就不会出现主键冲突的情况.
 * PrefixGenerator 的实现要求线程序安全的 
 * 此代码源于开源项目E3,原作者：黄云辉
 * 
 * @author XiongChun
 * @since 2010-03-17
 */
public interface PrefixGenerator {
  public String create() throws CreatePrefixException;
}
 