
cd c:/workdir/emacs-src/

make uninstall

git pull

./autogen.sh

./configure --prefix=/usr/local --without-dbus --without-pop --with-native-compilation=aot --with-tree-sitter --without-compress-install

make -j8

make install
