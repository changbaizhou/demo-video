(function () {
  const video = document.getElementById("demo-video");
  const emptyState = document.getElementById("empty-state");

  if (!video || !emptyState) {
    return;
  }

  const videoSrc = video.dataset.videoSrc;

  function showEmptyState() {
    video.removeAttribute("src");
    video.hidden = true;
    emptyState.hidden = false;
  }

  function showVideo() {
    const source = document.createElement("source");
    source.src = videoSrc;
    source.type = "video/mp4";
    video.appendChild(source);
    video.hidden = false;
    emptyState.hidden = true;
    video.load();
  }

  if (!videoSrc) {
    showEmptyState();
    return;
  }

  fetch(videoSrc, { method: "HEAD", cache: "no-store" })
    .then((response) => {
      if (response.ok) {
        showVideo();
        return;
      }

      showEmptyState();
    })
    .catch(showEmptyState);
})();
