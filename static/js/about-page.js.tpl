(function () {
  var aboutPage = document.querySelector(".about-page");
  if (!aboutPage) {
    return;
  }

  var mediaItems = aboutPage.querySelectorAll("[data-about-media]");

  Array.prototype.forEach.call(mediaItems, function (media) {
    var mediaCard = media.closest("[data-about-photo-card]");
    media.addEventListener("error", function () {
      if (mediaCard) {
        mediaCard.classList.add("is-missing");
        var playButton = mediaCard.querySelector("[data-about-play]");
        if (playButton) {
          playButton.textContent = "Video no disponible";
          playButton.disabled = true;
        }
      }
      media.hidden = true;
    });

    if (media.tagName === "IMG" && media.complete && !media.naturalWidth) {
      media.dispatchEvent(new Event("error"));
    }
  });

  var videos = aboutPage.querySelectorAll("[data-about-video]");
  if (!videos.length) {
    return;
  }

  var automaticVideos = aboutPage.querySelectorAll("[data-about-video]:not([data-about-manual])");
  var reduceMotion = window.matchMedia && window.matchMedia("(prefers-reduced-motion: reduce)").matches;
  var saveData = navigator.connection && navigator.connection.saveData;

  var hydrateVideo = function (video) {
    if (video.getAttribute("data-about-loaded") === "true") {
      return;
    }

    var source = video.querySelector("source[data-src]");
    if (!source) {
      return;
    }

    source.setAttribute("src", source.getAttribute("data-src"));
    source.removeAttribute("data-src");
    video.setAttribute("data-about-loaded", "true");
    video.load();
  };

  var playVideo = function (video) {
    hydrateVideo(video);
    var playPromise = video.play();
    if (playPromise && typeof playPromise.catch === "function") {
      playPromise.catch(function () {});
    }
  };

  Array.prototype.forEach.call(aboutPage.querySelectorAll("[data-about-play]"), function (button) {
    var mediaCard = button.closest("[data-about-photo-card]");
    var video = mediaCard && mediaCard.querySelector("[data-about-video][data-about-manual]");
    if (!video) {
      button.hidden = true;
      return;
    }

    button.addEventListener("click", function () {
      hydrateVideo(video);
      video.controls = true;
      var playPromise;
      try {
        playPromise = video.play();
      } catch (error) {
        video.dispatchEvent(new Event("error"));
        return;
      }
      if (playPromise && typeof playPromise.then === "function") {
        playPromise.then(function () {
          button.hidden = true;
        }).catch(function () {
          video.dispatchEvent(new Event("error"));
        });
      } else {
        button.hidden = true;
      }
    });
  });

  if (reduceMotion || saveData) {
    Array.prototype.forEach.call(automaticVideos, function (video) {
      video.setAttribute("data-about-static", "true");
      video.controls = false;
    });
    return;
  }

  if (!("IntersectionObserver" in window)) {
    Array.prototype.forEach.call(automaticVideos, hydrateVideo);
    return;
  }

  var observer = new IntersectionObserver(function (entries) {
    Array.prototype.forEach.call(entries, function (entry) {
      if (entry.isIntersecting) {
        playVideo(entry.target);
      } else {
        entry.target.pause();
      }
    });
  }, {
    rootMargin: "160px 0px",
    threshold: 0.2
  });

  Array.prototype.forEach.call(automaticVideos, function (video) {
    observer.observe(video);
  });
})();
