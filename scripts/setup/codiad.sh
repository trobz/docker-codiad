echo 'clone the latest codiad version'

TARGET_DIR="/opt/codiad"

cd /opt && git clone https://github.com/Codiad/Codiad.git "$TARGET_DIR"

cp "/tmp/codiad.php" "$TARGET_DIR/config.php"
chown www-data:www-data "$TARGET_DIR" -R

