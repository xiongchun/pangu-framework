package com.pulanit.pangu.admin.web.util;

import cn.hutool.core.util.StrUtil;

/**
 * CommonUtils
 */
public class CommonUtils {

    private static final String LOG_STR_APPEND = "...<#.more.#>...";

    public static String lessStr(String rawStr, int halfLength) {
        String lessStr = "";
        if (rawStr != null) {
            if (rawStr.length() > halfLength * 2) {
                lessStr = StrUtil.subWithLength(rawStr, 0, halfLength) + LOG_STR_APPEND + StrUtil.subSufByLength(rawStr, halfLength);
            } else {
                lessStr = rawStr;
            }
        }
        return lessStr;
    }
}
