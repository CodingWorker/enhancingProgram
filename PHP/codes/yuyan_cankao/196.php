<?php
namespace main{

}

namespace main\sub1{
    $data=1;
}
namespace main\sub2{
    echo $data;
    $data=2;
}

namespace main\sub1{
    echo $data;
    $data=1;
}

namespace {
    echo $data;
}