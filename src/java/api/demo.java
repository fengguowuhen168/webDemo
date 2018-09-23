package api;

public class demo {
    private static demo ourInstance = new demo();
    public static demo getInstance() {
        return ourInstance;
    }
    private demo() {
    }
}
