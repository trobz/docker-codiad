echo 'clone the latest codiad version'

TARGET_DIR="/opt/codiad"

cd /opt && git clone -b v.2.5.1 --single-branch https://github.com/Codiad/Codiad.git "$TARGET_DIR"

cp "/tmp/codiad.php" "$TARGET_DIR/config.php"
cp "/tmp/auth.php" "$TARGET_DIR/auth.php"
echo '<?php/*|[{"username":"default","password":null,"project":"default"}]|*/?>' > $TARGET_DIR/data/users.php

chown www-data:www-data "$TARGET_DIR" -R

