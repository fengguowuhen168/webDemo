package api;

import jodd.http.HttpRequest;
import jodd.http.HttpResponse;

public class httpPostTest {
    public static void main(String[] args) {
                 HttpResponse response =HttpRequest
                .post("https://oapi-qa.ebanma.com:20016/oapi/express/notifyTrackingInfo")
                .contentType("application/x-www-form-urlencoded", "UTF-8")
                .header("Authorization", "Bearer a3c741dc3114e7f6f2bf4e442d964d3")
                .form(
                        "goodsInfo", "粽子一箱",
                        "mobile", "17671756176",
                        "orderNo", "9891761137553",
                        "sendFrom", "北京市西城区永安路",
                        "sendTo", "江苏省宿迁市宿城区名人国际北区",
                        "status", "0",
                        "timestamp", "1529030628671",
                        "trackingNo", "9891761137553",
                        "postOrgNo","23803100"
                ).send();
                 System.out.println("返回值："+response.bodyText());
    }
}
