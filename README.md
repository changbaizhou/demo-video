# 毕业设计演示视频二维码页面

这个文件夹是一个可以直接部署到 Render Static Site 的静态网页。二维码最终生成 Render 给出的网页地址即可。

## 文件结构

```text
video-qr-site/
  index.html
  assets/
  video/
    demo.mp4
  scripts/
  render.yaml
```

## 本地预览

```bash
cd video-qr-site
scripts/serve.sh
```

浏览器打开：

```text
http://localhost:4173
```

## 放入最终视频

剪辑完成后，导出 MP4，然后运行：

```bash
cd video-qr-site
scripts/add-video.sh /path/to/your-video.mp4
```

脚本会把它复制为：

```text
video/demo.mp4
```

也可以手动把视频放到 `video/` 文件夹并改名为 `demo.mp4`。

## 检查是否准备好

```bash
cd video-qr-site
scripts/check-ready.sh
```

## 首次推送到 GitHub

先在 GitHub 新建一个空仓库，然后运行：

```bash
cd video-qr-site
scripts/git-first-push.sh https://github.com/USER/REPO.git
```

把 `USER/REPO` 换成你的 GitHub 用户名和仓库名。

## Render 部署

推荐方式：

1. 打开 Render Dashboard
2. New -> Static Site
3. 连接这个 GitHub 仓库
4. Build Command 留空
5. Publish Directory 填 `.`
6. 部署完成后复制 `https://xxx.onrender.com`
7. 用这个网址生成二维码

仓库里已经包含 `render.yaml`，也可以在 Render 里用 Blueprint 方式部署。

## 答辩建议

二维码用于老师手机观看；PPT 和电脑本地仍建议保留一份视频，避免现场网络不稳定。
