# ShellPractice
shell脚本学习

## 环境设置
Sublime + Win10 Linux子系统

### Sublime配置linux环境:
-- Tools -> Build System ->New Build System 添加如下配置
```
{
  "cmd" : ["bash", "-c", "bash ${file_name}"],
  "shell": true,
  "working_dir": "${file_path}",
}
```
并以WSL-shell.sublime-build名称保存到 Data/Packages/User目录下

### Sublime配置文档格式为unix,防止换行符造成执行报错
-- Preferences -> Setting-User 添加如下配置;并保存
```
"default_line_ending": "unix",
```
-- View -> Line Endings -> unix


