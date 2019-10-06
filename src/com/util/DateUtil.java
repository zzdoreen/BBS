package com.util;

import java.util.Date;

/**
 * 时间格式化工具类
 * 将时间格式化成几秒前，几分钟前，几小时前，几天前，几月前，几年前
 * @author YangJie
 * @createTime 2014年12月25日 下午6:36:11
 */
public class DateUtil {

	    private static final long ONE_MINUTE = 60000L;
	    private static final long ONE_HOUR = 3600000L;
	    private static final long ONE_DAY = 86400000L;
	    private static final long ONE_WEEK = 604800000L;

	    private static final String ONE_SECOND_AGO = "秒前";
	    private static final String ONE_MINUTE_AGO = "分钟前";
	    private static final String ONE_HOUR_AGO = "小时前";
	    private static final String ONE_DAY_AGO = "天前";
	    private static final String ONE_MONTH_AGO = "月前";
	    private static final String ONE_YEAR_AGO = "年前";


	    /**
	     * 格式化日期
	     * @param date java.util.Date类型
	     * @return
	     * @author YangJie
	     * @createTime 2014年12月25日 下午6:44:32
	     */
	    public static String format(Date date) {
	    	if (date == null) {
				return null;
			}
	        long delta = new Date().getTime() - date.getTime();
	        if (delta < 1L * ONE_MINUTE) {
	            long seconds = toSeconds(delta);
	            return (seconds <= 0 ? 1 : seconds) + ONE_SECOND_AGO;
	        }
	        if (delta < 45L * ONE_MINUTE) {
	            long minutes = toMinutes(delta);
	            return (minutes <= 0 ? 1 : minutes) + ONE_MINUTE_AGO;
	        }
	        if (delta < 24L * ONE_HOUR) {
	            long hours = toHours(delta);
	            return (hours <= 0 ? 1 : hours) + ONE_HOUR_AGO;
	        }
	        if (delta < 48L * ONE_HOUR) {
	            return "昨天";
	        }
	        if (delta < 30L * ONE_DAY) {
	            long days = toDays(delta);
	            return (days <= 0 ? 1 : days) + ONE_DAY_AGO;
	        }
	        if (delta < 12L * 4L * ONE_WEEK) {
	            long months = toMonths(delta);
	            return (months <= 0 ? 1 : months) + ONE_MONTH_AGO;
	        } else {
	            long years = toYears(delta);
	            return (years <= 0 ? 1 : years) + ONE_YEAR_AGO;
	        }
	    }

	    private static long toSeconds(long date) {
	        return date / 1000L;
	    }

	    private static long toMinutes(long date) {
	        return toSeconds(date) / 60L;
	    }

	    private static long toHours(long date) {
	        return toMinutes(date) / 60L;
	    }

	    private static long toDays(long date) {
	        return toHours(date) / 24L;
	    }

	    private static long toMonths(long date) {
	        return toDays(date) / 30L;
	    }

	    private static long toYears(long date) {
	        return toMonths(date) / 365L;
	    }


}
