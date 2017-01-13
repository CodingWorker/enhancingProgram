<?php
trait A  {
    public function  smallTalk () {
        echo  'a' ;
    }
    public function  bigTalk () {
        echo  'A' ;
    }
}

 trait B  {
    public function  smallTalk () {
        echo  'b' ;
    }
    public function  bigTalk () {
        echo  'B' ;
    }
}

class  Talker  {
    use  A ,  B  {     //加花括号来处理trait之间的冲突
         B :: smallTalk insteadof A ;    //使用B的而不是A的
         A :: bigTalk insteadof B ;      //使用A的而不是B的
    }
}

class  Aliased_Talker  {
    use  A ,  B  {
         B :: smallTalk insteadof A ;
         A :: bigTalk insteadof B ;      //即使后面有将B的方法as也要此代码
         B :: bigTalk  as  talk ;
    }
}
