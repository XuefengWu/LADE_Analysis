package me.analysis.pl.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

    private static final String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

    public static String getToday() {
        return today;
    }

    public static String getCurrentTime() {
        Date dt = new Date();
        java.text.SimpleDateFormat sdf =
                new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String currentTime = sdf.format(dt);
        return currentTime;
    }

}
