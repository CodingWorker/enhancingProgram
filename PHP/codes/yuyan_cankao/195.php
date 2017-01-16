<?php
namespace MyProject {
   class Person {}
}

namespace MyProject\People {
    class Adult extends ..\Person {}       #这样写是错误的
}
?> 