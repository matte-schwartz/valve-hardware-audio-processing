for i in src/faust/*.dsp; do
    [ -f "$i" ] || break
    filename="${i%.*}"
    echo "testing ${filename}..."
    faust2bench -vec "${filename}".dsp; ./"${filename}"
done
