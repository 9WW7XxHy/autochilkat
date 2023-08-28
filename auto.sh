wget https://github.com/9WW7XxHy/autochilkat/blob/main/chilkat_9_5_0.so
wget https://github.com/9WW7XxHy/autochilkat/blob/main/20-chilkat.ini

extension_dir=$(php -r 'echo ini_get("extension_dir");')
php_d_dir=$(php -i | grep 'Scan this dir for additional .ini files' | awk -F'=>' '{gsub(/^[ \t]+/, "", $2); print $2}')

if [ -z "$extension_dir" ]; then
    echo "Không thể tìm thấy đường dẫn thư mục extension."
    exit 1
fi

if [ -z "$php_d_dir" ]; then
    echo "Không thể tìm thấy đường dẫn thư mục php.d."
    exit 1
fi

if [ ! -f "chilkat_9_5_0.so" ] || [ ! -f "20-chilkat.ini" ]; then
    echo "Một trong hai tệp không tồn tại."
    exit 1
fi

cp chilkat_9_5_0.so "$extension_dir"
cp 20-chilkat.ini "$php_d_dir"
