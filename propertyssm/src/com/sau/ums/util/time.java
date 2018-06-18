package com.sau.ums.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class time {

    //字符串转时间戳
    public static long dateToStamp(String s) throws ParseException {
        //String res;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(
                "yyyy-MM-dd HH:mm:ss");
        Date date = simpleDateFormat.parse(s);
        long ts = date.getTime();
        // res = String.valueOf(ts);
        return ts;
    }

}
