mkdir {1..5}o
for ((i=1; i<=5; i++)); do
    m=$((2 ** $i))
    echo $m
    for ((j=0; j<$m; j++)); do
        for ((k=0; k<$m; k++)); do
            p="${i}o/$j-$k.png"
            if [ ! -f $p ]; then
                echo $p
                url="http://www.zeldadungeon.net/Zelda16/Map/$p"
                curl $url -o $p
            fi
        done
    done;
done;