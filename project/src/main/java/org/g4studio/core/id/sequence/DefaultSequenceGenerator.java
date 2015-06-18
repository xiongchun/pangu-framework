package org.g4studio.core.id.sequence;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.core.id.CreateSequnceException;
import org.g4studio.core.id.InitSequenceGeneratorException;
import org.g4studio.core.id.SequenceGenerator;
import org.g4studio.core.id.SequenceStorer;
import org.g4studio.core.id.storer.FileSequenceStorer;

/**
 * DefaultSequenceGenerator
 * 此代码源于开源项目E3,原作者：黄云辉
 * 
 * @author XiongChun
 * @since 2010-03-17
 * @see SequenceGenerator
 */
public class DefaultSequenceGenerator implements SequenceGenerator {

	/**
	 * 序号最小值
	 */
	protected long minValue = 0L;
	/**
	 * 序号最大值
	 */
	protected long maxValue = Long.MAX_VALUE;
	/**
	 * cache大小，用于确定预分配序号数;cache越大，ＩＤ生成效率越高，但是当系统 关闭时，可能造成的ＩＤ浪费也会更多.
	 */
	protected int cache = 100;
	/**
	 * 是否循环生成，当cycle达到最大值时，是否循环，又从最小值开始生成
	 */
	protected boolean cycle = true;
	/**
	 * 用于存储／读取　已分配出去的最大序号
	 */
	protected SequenceStorer sequenceStorer = new FileSequenceStorer();

	protected long currCount = 0L;// 当前实际已分配序号最大值
	protected long maxCount = cache + currCount;// 可以分配最大序号值（
	protected String id = "anonymity";// 序号的标致符号
	protected boolean initiated = false;
	protected final Log logger = LogFactory
			.getLog(DefaultSequenceGenerator.class);

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public DefaultSequenceGenerator() {

	}

	public DefaultSequenceGenerator(String pId) {
		this.id = pId;
	}

	public void init() {
		initiated = true;
		long initValue = sequenceStorer.load(this.getId());
		initValue = java.lang.Math.max(initValue, minValue);

		if (initValue > maxValue) {
			if (this.cycle) {
				initValue = this.minValue;
			} else {
				final String msg = this.id + " 序号生成器的序号已经达到最大值:" + maxValue
						+ " 了！系统无法在分配序号！";
				logger.error(msg);
				throw new InitSequenceGeneratorException(msg);
			}
		}
		currCount = initValue;
		maxCount = currCount + cache;
		maxCount = java.lang.Math.min(maxCount, maxValue);
		sequenceStorer.updateMaxValueByFieldName(maxCount, this.getId());
	}

	public long next() throws CreateSequnceException {
		if (initiated == false) {
			init();
		}
		if (currCount == maxCount) {// 重新申请id
			long tmp = maxCount + cache;
			if (tmp >= maxValue) {
				if (this.cycle) {
					tmp = this.minValue;
				} else {
					final String msg = this.id + " 序号生成器的序号已经达到最大值:" + maxValue
							+ " 了！系统无法在分配序号！";
					logger.error(msg);
					throw new CreateSequnceException(msg);
				}
			}
			sequenceStorer.updateMaxValueByFieldName(tmp, this.getId());
			maxCount = tmp;
		}
		currCount++;
		return currCount;
	}

	public long getMinValue() {
		return minValue;
	}

	public void setMinValue(long minValue) {
		this.minValue = minValue;
	}

	public long getMaxValue() {
		return maxValue;
	}

	public void setMaxValue(long maxValue) {
		this.maxValue = maxValue;
	}

	public int getCache() {
		return cache;
	}

	public void setCache(int cache) {
		this.cache = cache;
	}

	public boolean isCycle() {
		return cycle;
	}

	public void setCycle(boolean cycle) {
		this.cycle = cycle;
	}

	public void setSequenceStorer(SequenceStorer sequenceStorer) {
		this.sequenceStorer = sequenceStorer;
	}

}
