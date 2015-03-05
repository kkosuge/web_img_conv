## Installation
```
git clone git://github.com/kkosuge/web_img_conv.git
cd web_img_conv
bundle
mv config/config.yml.sample config/config.yml
rackup
```

### original
```
http://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Onomichi_machinami.jpg/800px-Onomichi_machinami.jpg
```
![](https://raw.githubusercontent.com/kkosuge/web_img_conv/master/sample/800px-Onomichi_machinami.jpg)

### resize
```
http://localhost:9292/resize/350x200/http://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Onomichi_machinami.jpg/800px-Onomichi_machinami.jpg
```
![](https://raw.githubusercontent.com/kkosuge/web_img_conv/master/sample/resize-800px-Onomichi_machinami.jpg)

### resize_to_fill
```
http://localhost:9292/resize_to_fill/350x200/http://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Onomichi_machinami.jpg/800px-Onomichi_machinami.jpg
```
![](https://raw.githubusercontent.com/kkosuge/web_img_conv/master/sample/resize_to_fill-800px-Onomichi_machinami.jpg)
