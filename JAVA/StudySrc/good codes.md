java.util.Arraylist
==
if ((size = elementData.length) != 0) {//直接在if里面赋值
            // c.toArray might (incorrectly) not return Object[] (see 6260652)
            if (elementData.getClass() != Object[].class)
                elementData = Arrays.copyOf(elementData, size, Object[].class);
} else {
            // replace with empty array.
            this.elementData = EMPTY_ELEMENTDATA;
}


将变量设置为null，从而使得gc在未来处理
elementData[--size] = null; // clear to let GC do its work






