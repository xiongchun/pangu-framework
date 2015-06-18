package org.g4studio.core.resource.support;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.core.resource.Cache;
import org.g4studio.core.resource.Resource;
import org.g4studio.core.resource.ResourceException;
import org.g4studio.core.resource.ResourceHandler;
import org.g4studio.core.resource.ResourceLoader;
import org.g4studio.core.resource.ResourceManager;

/**
 * AbstractResourceManager
 * 
 * @author HuangYunHui|XiongChun
 * @since 2010-2-5
 */
public abstract class AbstractResourceManager implements ResourceManager {
	  private final Log logger = LogFactory.getLog( this.getClass() );
	    
	    private Cache cache;
	    private CacheManager cacheManager = null;
	    /**
	     * 是否检查资源修改
	     */
	    private boolean checkModified = true;
	    
	    private Map keyLocks = new HashMap();
	    
	    private ResourceConfigMapping resourceConfigMapping;
	    private LoaderMapping loaderMapping;
	    private HandlerMapping handlerMapping;
	    
	    private final static Object LOCK = new Object();
	    
		/**
		 * 执行资源管理的初始化操作
		 * 只会被调用一次
		 * @throws ResourceException
		 */
		public void init() throws ResourceException{
			if ( cache != null ){
			   cache.init();
			}
		}
		
		  /**
	     * 执行清楚处理
		 * 只会被调用一次 
	     * @throws ResourceException
	     */
	    public void destroy() throws ResourceException{
	      if (cache != null ) {
	    	  cache.destroy();	
	      }
	    }
	    
	    
	    /**
	     * @param pUri
	     * @return
	     */
	    private Object getKeyLock(String pUri){
	    	Object result = keyLocks.get(pUri);
	    	if ( result == null ){
	    		result = new Object();
	    		keyLocks.put(pUri, result);
	    	}
	    	return result;
	    }
		public Resource get(String pUri) throws ResourceException {
			ResourceConfig resourceConfig = resourceConfigMapping.mapping(pUri);
			boolean isCache = false;
			if ( resourceConfig == null ){
				final String msg =
					"没有找到资源: " + pUri + " 对应的配置项目，请检查配置文件中是否存在与之匹配的uri模式!";
				logger.debug(msg);
				return null;
			}
			
			
			
			ResourceLoader loader = null;
			isCache = resourceConfig.isCache();
			loader = loaderMapping.mapping(resourceConfig.getLoaderName());
	
			Resource result = cacheManager.get(pUri);
		
			if ( result != null ){	
				if ( checkModified == false ){//不检查修改
					return result;
				}
				//检查资源是否已修改
				long lastModified = result.getLastModified();
				long newModified = loader.getLastModified(pUri);
				if ( newModified > lastModified){
					Object keyLock = null;
					synchronized( LOCK ){
						keyLock = getKeyLock(pUri); 
					}
					synchronized(keyLock){
						result = loadResource(loader, pUri);
						cacheManager.put(result);
					}

				}
				return result;
			}
		
			Object keyLock = null;
			synchronized( LOCK ){
				keyLock = getKeyLock(pUri); 
			}
			synchronized(keyLock){
				result = cacheManager.get(pUri);
				if ( result != null ){
					return result;
				}
				result = loadResource(loader, pUri);
				//如果cache 才需要把资源缓存起来
				if ( isCache ){
					cacheManager.put(result);	
				}
				
				return result;
			}
		}

		/**
		 * 负责装载资源，调用hanlder进行资源处理，
		 * 注意：对资源进行处理的过程中，如果有一个处理过程出错了，放弃整个处理，
		 * 返回最原始的导入的数据.
		 * @param pLoader
		 * @param pUri
		 * @return
		 */
		private Resource loadResource(ResourceLoader pLoader , String pUri){
			Resource res = null;
			ResourceConfig resourceConfig = resourceConfigMapping.mapping(pUri);
			if ( resourceConfig == null ){
				res = pLoader.load(pUri);
				return res;
			} else {
				res = pLoader.load( 
						newURI( pUri, 
								resourceConfig.getOldPrefix(), 
								resourceConfig.getNewPrefix()) );
			}
			String[] handlers = resourceConfig.getHandlerNames();

			for(int i=0; i<handlers.length; i++){
				String handerName = handlers[i];
				ResourceHandler handler = handlerMapping.mapping(handerName);
				if ( handler == null ){
					logger.warn("没有找到名为:" + handerName + "的资源处理器");
					continue;
				}
				try{				
				    handler.handle(res);
				}catch(Exception ex){
					logger.warn("对资源:" + pUri + "进行:" + handerName + " 处理时出现异常!", ex );
					continue;
				}
			}
			return res;
		}
		
		private static String newURI(String pUri, String pOldPrefix, String pNewPrefix ){
			if ( pUri == null ){
				return null;
			}
			if ( pOldPrefix == null || pNewPrefix == null ){
				return pUri;
			}
			if ( pUri.startsWith(pOldPrefix) ){
				return pNewPrefix + pUri.substring(pOldPrefix.length());
			} else {
				return pUri;
			}
		}
 
		public Cache getCache() {
			return cache;
		}
		public void setCache(Cache cache) {
			this.cache = cache;
			this.cacheManager = new CacheManager(cache);
		}
		public HandlerMapping getHandlerMapping() {
			return handlerMapping;
		}
		public void setHandlerMapping(HandlerMapping handlerMapping) {
			this.handlerMapping = handlerMapping;
		}
		public LoaderMapping getLoaderMapping() {
			return loaderMapping;
		}
		public void setLoaderMapping(LoaderMapping loaderMapping) {
			this.loaderMapping = loaderMapping;
		}
		public ResourceConfigMapping getResourceConfigMapping() {
			return resourceConfigMapping;
		}
		public void setResourceConfigMapping(ResourceConfigMapping resourceConfigMapping) {
			this.resourceConfigMapping = resourceConfigMapping;
		}

		public boolean isCheckModified() {
			return checkModified;
		}

		public void setCheckModified(boolean checkModified) {
			this.checkModified = checkModified;
		}

}
