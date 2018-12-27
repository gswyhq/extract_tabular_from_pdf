
构建镜像：
`docker build -t gswyhq/extract_tabular_from_pdf -f Dockerfile  . `

使用构建的镜像提取pdf中的表格数据：
`docker run -p 5000:5000 --rm -it gswyhq/extract_tabular_from_pdf python3 arthur.py`

浏览器打开： http://localhost:5000/

[致谢](https://github.com/camelot-dev/excalibur)

