package api;

import java.util.HashSet;
import java.util.Set;

public class TestThread {
    public static int a =0,b=0;
    public static int x=0,y=0;
    public static Set resultSet =new HashSet();

    public static void main(String[] args) {
        while(true){
            new Thread(new Runnable() {
                @Override
                public void run() {

                }
            });
        }
    }
}
