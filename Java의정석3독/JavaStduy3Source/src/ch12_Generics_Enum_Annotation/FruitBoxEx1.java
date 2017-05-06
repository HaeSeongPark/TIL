package ch12_Generics_Enum_Annotation;

import java.util.ArrayList;

interface Eatable {
}

class Fruit implements Eatable {
    String name;
    int weigth;

    public Fruit() {
    }

    public Fruit(String name, int weigth) {
        super();
        this.name = name;
        this.weigth = weigth;
    }


    public String toString() {
        return name + "(" + weigth + ")";
    }
}

class Apple extends Fruit {
    public Apple() {
    }

    public Apple(String name, int weigth) {
        super(name, weigth);
    }

}

class Grape extends Fruit {
    public Grape() {
    }

    public Grape(String name, int weigth) {
        super(name, weigth);
    }
}

class Toy {
    public String toString() {
        return "Toy";
    }
}

class FruitBox<T extends Fruit & Eatable> extends Box<T> {
}

class Box<T> {
    ArrayList<T> list = new ArrayList<T>();

    void add(T item) {
        list.add(item);
    }

    T get(int i) {
        return list.get(i);
    }

    int size() {
        return list.size();
    }

    ArrayList<T> getList() {
        return list;
    }

    public String toString() {
        return list.toString();
    }
}

public class FruitBoxEx1 {
    public static void main(String[] args) {
        Box<Fruit> fruitBox = new Box<Fruit>();
        Box<Apple> appleBox = new Box<Apple>();
        Box<Toy> toyBox = new Box<Toy>();
        // Box<Grape> grapeBox = new Box<Apple>(); Ÿ�� ����ġ ����

        fruitBox.add(new Fruit());
        fruitBox.add(new Apple());

        appleBox.add(new Apple());
        appleBox.add(new Apple());
        // appleBox.add(new Toy()); ����. Box<Apple>���� Apple�� ���� �� ����

        toyBox.add(new Toy());
        // toyBox.add(new Apple()); ����. Box<Toy>���� A

        System.out.println(fruitBox);
        System.out.println(appleBox);
        System.out.println(toyBox);
    }
}
