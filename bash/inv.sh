#!/bin/bash

inv(){
    if [ $1 -le 4 ]
    then
        echo $1
        return
    fi

    a=$(inv $(($1-1)))
    b=$(inv $(($1-2)))
    
    echo $(($a+$b))
}

inv $1
exit 0