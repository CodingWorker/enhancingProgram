<?php
namespace pa{
    class a{};
    function aa(){}
    const MYCONST="CLASS_pa";
}

namespace pb{  //之后书写的多有代码如果没有新的命名空间定义，将都属于pb
    class a{}
    function aa(){}
    const MYCONST="CLASS_pb";
}
namespace{      #这样定义代表的是全局命名空间
    var_dump(MYCONST);     //输出pb,这样定义后所有的代码都必须在命名空间的花括号中
    var_dump(\pa\MYCONST); //pa
    var_dump(\pb\MYCONST); //pb
}