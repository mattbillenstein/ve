ICU_MAJOR="74"
ICU_MINOR="2"
ICU_SRC="icu4c-${ICU_MAJOR}_${ICU_MINOR}-src.tgz"
ICU_SRC_SHA256SUM="68db082212a96d6f53e35d60f47d38b962e9f9d207a74cfac78029ae8ff5e08c"
ICU_DATA="icu4c-${ICU_MAJOR}_${ICU_MINOR}-data.zip"
ICU_DATA_SHA256SUM="c28c3ca5f4ba3384781797138a294ca360988d4322674ad4d51e52f5d9b0a2b6"

getpkg https://github.com/unicode-org/icu/releases/download/release-$ICU_MAJOR-$ICU_MINOR/$ICU_SRC $ICU_SRC_SHA256SUM
tar zxf $ICU_SRC
#getpkg https://github.com/unicode-org/icu/releases/download/release-$ICU_MAJOR-$ICU_MINOR/$ICU_DATA $ICU_DATA_SHA256SUM
#unzip $ICU_DATA

cd icu/source
./configure --prefix=$VENV
$PMAKE
make install

cd ../..
