for i in {0..255}; do
    print -Pn "%F{$i}$(printf '%3d' $i)%f "
    (( (i + 1) % 16 == 0 )) && print
done

for i in {0..255}; do
    print -Pn "%K{$i}$(printf '%3d' $i)%k "
    (( (i + 1) % 16 == 0 )) && print
done
