$(function () {
  $(".decode-start-button").click(function(e) {
    navigator.mediaDevices = navigator.mediaDevices || ((navigator.mozGetUserMedia || navigator.webkitGetUserMedia) ? {
      getUserMedia: function(c) {
        return new Promise(function(y, n) {
          (navigator.mozGetUserMedia ||
            navigator.webkitGetUserMedia).call(navigator, c, y, n);
        });
      }
    } : null);

    let constraints = { audio: false, video: { width: 200, height: 200 } };

    navigator.mediaDevices.getUserMedia(constraints)
    .then(function(stream) {
      let video = e.target.parentElement.getElementsByTagName("video")[0]
      video.srcObject = stream;
      localStream = stream;

      if(localStream) {
        let canvas = document.getElementById('canvas');
        let ctx = canvas.getContext('2d');
        let w = video.offsetWidth;
        let h = video.offsetHeight;
        canvas.setAttribute("width", w);
        canvas.setAttribute("height", h);
        setInterval(() => {
          ctx.drawImage(video, 0, 0, w, h);
          const imageData = ctx.getImageData(0, 0, w, h);
          const code = jsQR(imageData.data, imageData.width, imageData.height);
          if (code) {
            $(".book-number").val(code.data)
            localStream.getTracks()[0].stop();
          }
        }, 500);
      }
    })
    .catch(function(err) {
      console.error('mediaDevice.getUserMedia() error:', error);
    });
  });
});
