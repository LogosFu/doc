folder=architecture
fileName=组合与聚合
imageHost=https://raw.githubusercontent.com/LogosFu/doc/main/src/$folder
rm -rf build
mkdir build

cat src/${folder}/${fileName}.md > build/output.md
echo "build md doc success!"
sed -i "" "s@./$fileName@$imageHost/$fileName@g" build/output.md
echo "get img success!"
sed -i "" "s@src=$fileName\"@src=\"$imageHost/$fileName@g" build/output.md
echo "build img success!"
pandoc -s build/output.md -w html --template=template/wechat_template.html -o build/wechat.html  --title-prefix email --highlight-style pygments

juice build/wechat.html build/wechat.html
