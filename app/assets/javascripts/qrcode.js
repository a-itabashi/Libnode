$(function () {
  navigator.mediaDevices = navigator.mediaDevices || ((navigator.mozGetUserMedia || navigator.webkitGetUserMedia) ? {
    getUserMedia: function(c) {
      return new Promise(function(y, n) {
        (navigator.mozGetUserMedia ||
          navigator.webkitGetUserMedia).call(navigator, c, y, n);
      });
    }
  } : null);

  if (!navigator.mediaDevices) {
    console.log("getUserMedia() not supported.");
  }

  // Prefer camera resolution nearest to 1280x720.

  var constraints = { audio: true, video: { width: 300, height: 200 } };

  navigator.mediaDevices.getUserMedia(constraints)
  .then(function(stream) {
    var video = document.querySelector('video');
    video.srcObject = stream;
    localStream = stream;
    video.onloadedmetadata = function(e) {
      video.play();
    };
  })
  .catch(function(err) {
    console.error('mediaDevice.getUserMedia() error:', error);
  });

  function decodeImageFromBase64(data, callback){
      qrcode.callback = callback;
      qrcode.decode(data)
  }
  document.addEventListener("DOMContentLoaded", function(){
    document.getElementById("action").addEventListener('click',function(){
        if(localStream) {
            var canvas = document.getElementById('canvas');
            var ctx = canvas.getContext('2d');
            ctx.drawImage(video, 0, 0, this.width, this.height);
            var img = document.getElementById('img');

            var w = video.offsetWidth;
            var h = video.offsetHeight;

            canvas.setAttribute("width", w);
            canvas.setAttribute("height", h);

            //canvasにコピー
            ctx.drawImage(video, 0, 0, w, h);

            // デコード.
            decodeImageFromBase64(canvas.toDataURL('image/png'), function(decodedInformation){
                alert(decodedInformation);
            });
        }
    },false);
  },false);
})
