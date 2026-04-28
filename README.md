# cursor-starter-kit

一个用于快速启动 AI/前端/全栈项目的生产级模板仓库。包含可被 curl 调用的一键初始化脚本、通用规则模板（.rules）、以及 VS Code devcontainer 配置。

快速开始：
```bash
# 示例：基于 universal 模板创建 my-new-project
curl -sL https://raw.githubusercontent.com/San-quan/cursor-starter-kit/main/setup.sh | bash -s -- universal . my-new-project
```

包含内容（初始）：
- setup.sh：初始化并注入模板文件
- templates/universal.rules：通用 AI 指令与 guardrails
- templates/python-ai.rules：Python AI 项目专用规则
- templates/web-react.rules：Next.js / Web 全栈专用规则
- .devcontainer/devcontainer.json：推荐的开发容器配置

许可：MIT（见 LICENSE)