package api.test;

import java.util.*;
import java.util.stream.Collectors;

public class Student {
    private String name;
    private Integer age;

    public Student(String name, Integer age) {
        this.name = name;
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public Integer getAge() {
        return age;
    }

    public static void main(String[] args) {
        List<Student> l =new ArrayList<>();
        l.add(new Student("张三",10));
        l.add(new Student("wang",10));
        l.add(new Student("张",10));
        l.add(new Student("zhao",15));
        l.add(new Student("li",13));
        System.out.println("找出年龄为10的第一个学生：");
         Optional<Student>s= l.stream().filter(st ->st.getAge().equals(10) ).findFirst();
         if(s.isPresent()){
             System.out.println("=========:"+s.get().getName()+";"+s.get().getAge());
         }
        List<Student>ls= l.stream().filter(st ->st.getAge().equals(10) ).collect(Collectors.toList());
        for (Student sl:ls
             ) {
            System.out.println(""+sl.getName());
        }
       Map<Integer,List<Student>> map= l.stream().collect(Collectors.groupingBy(Student::getAge));
        Iterator< Map.Entry<Integer,List<Student>>> iter= map.entrySet().iterator();
        while(iter.hasNext()){
            Map.Entry<Integer,List<Student>> enty=   (Map.Entry<Integer,List<Student>>)iter.next();
            int age=    enty.getKey();
             List<Student> group=   enty.getValue();
             for (Student stu:group){
                 System.out.println(""+stu.getName());
             }
             System.out.println();
        }

    }
}
