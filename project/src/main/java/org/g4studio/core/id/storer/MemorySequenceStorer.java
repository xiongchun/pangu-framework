package org.g4studio.core.id.storer;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.core.id.SequenceStorer;
import org.g4studio.core.id.StoreSequenceException;

/**
 * MemorySequenceStorer
 * 此代码源于开源项目E3,原作者：黄云辉
 * 
 * @author XiongChun
 * @since 2010-03-17
 * @see SequenceStorer
 */
public class MemorySequenceStorer implements SequenceStorer {

	private final Log logger = LogFactory.getLog(MemorySequenceStorer.class);

	private Map cache = new HashMap();

	public void init() {
	}

	public long load(String sequenceID) throws StoreSequenceException {
		if (logger.isDebugEnabled()) {
			logger.debug("获取序号值,序号ＩＤ:" + sequenceID);
		}
		if (cache.containsKey(sequenceID) == false) {
			updateMaxValueByFieldName(0, sequenceID);
		}
		Long result = (Long) cache.get(sequenceID);
		return result.longValue();
	}

	public void updateMaxValueByFieldName(long sequence, String sequenceID)
			throws StoreSequenceException {
		if (logger.isDebugEnabled()) {
			logger.debug("保存序号,序号ＩＤ:[" + sequenceID + "]序号值:" + sequence);
		}
		cache.put(sequenceID, new Long(sequence));
	}

}
