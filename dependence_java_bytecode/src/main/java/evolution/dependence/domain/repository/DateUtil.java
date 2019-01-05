package evolution.dependence.domain.repository;

import java.util.Date;

public class DateUtil {


    public static String getCurrentTime() {
        Date dt = new Date();
        java.text.SimpleDateFormat sdf =
                new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String currentTime = sdf.format(dt);
        return currentTime;
    }

}
