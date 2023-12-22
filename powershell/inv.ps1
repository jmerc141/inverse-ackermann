
function inv-ack([int64]$n)
{
    if ($n -le 4)
    {
        return $n
    }

    $a=inv-ack ($n-1)
    $b=inv-ack ($n-2)

    return $a+$b
}

inv-ack $args[0]