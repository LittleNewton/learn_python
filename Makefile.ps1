# jupyter Notebook --> TeX 的配置选项
$config = ".\config\citations.tplx"
$srcFolder = ".\src\"
$texFolder = ".\tex\"




function To-PDF {
	# 获取所有 notebook
	$nbList = (Get-ChildItem $srcFolder *.ipynb).Name
	foreach ($item in $nbList) {

		# 导出为 LaTeX 文件
		jupyter nbconvert ($srcFolder + $item) --to latex --template $config

		# 移动 tex 文件到 tex 文件夹
		Move-Item .\src\*.tex .\tex
		
		# 编译 LaTeX
		# $fileName = [io.path]::GetFileNameWithoutExtension($item)
		# xelatex --synctex=-1 ($texFolder + $fileName + ".tex")
	}
}





To-PDF
