package api.test;


import java.util.Optional;

public class TestStream {
    public static void main(String[] args) {

        Optional<String> option =Optional.of("hello");
        if (option.isPresent()){
            System.out.println("option.get():"+option.get());
        }
        Optional<String> s2=   Optional.ofNullable(null);
        if(s2.isPresent())
            System.out.println("s2.get():"+s2.get());
        System.out.println("s2:"+s2.get());
    }
}
