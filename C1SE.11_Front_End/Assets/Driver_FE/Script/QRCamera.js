const startCameraButton = document.getElementById('startCamera');
const centeredDiv = document.getElementById('centeredDiv');
const closeButton = document.getElementById('closeModal');
const cameraView = document.getElementById('cameraView');
var videoSelect = document.querySelector('select#videoSource');

let stream = null; // Thêm biến global để theo dõi trạng thái camera

getDevices().then(gotDevices);

function getDevices() {
  // AFAICT in Safari this only gets default devices until gUM is called :/
  return navigator.mediaDevices.enumerateDevices();
}

function gotDevices(deviceInfos) {
  window.deviceInfos = deviceInfos; // make available to console
  console.log('Available input and output devices:', deviceInfos);
  for (const deviceInfo of deviceInfos) {
    const option = document.createElement('option');
    option.value = deviceInfo.deviceId;
    if (deviceInfo.kind === 'videoinput') {
      option.text = deviceInfo.label || `Camera ${videoSelect.length + 1}`;
      videoSelect.appendChild(option);
    }
  }
}

function startCamera() {
  if (stream) {
    return; // Nếu camera đã bật, không cần làm gì cả
  }

  const videoSource = videoSelect.value;
  const constraints = {
    video: { deviceId: videoSource ? { exact: videoSource } : undefined },
  };
  navigator.mediaDevices
    .getUserMedia(constraints)
    .then(gotStream)
    .catch(handleError);
}

function gotStream(newStream) {
  stream = newStream; // Lưu trạng thái của camera
  stream.stop = function () {
    this.getVideoTracks().forEach(function (track) {
      //in case... :)
      track.stop();
    });
  };
  videoSelect.selectedIndex = [...videoSelect.options].findIndex(
    (option) => option.text === stream.getVideoTracks()[0].label
  );
  cameraView.srcObject = stream;
}

function handleError(error) {
  console.error('Error: ', error);
}
function fetchSetSeatStatusData(coachId, seatNumber, status = 3) {
  const apiUrl = `http://localhost:9000/coaches/${coachId}/seats/status`;
  fetch(apiUrl, {
    method: 'PUT',
    body: JSON.stringify({
      seat_number: seatNumber,
      seat_status: status,
    }),
  })
    .then((response) => response.json())
    .then((data) => {
      console.log(data.data);
    })
    .catch((err) => {
      console.error('Error fetching data:', err);
    });
}

startCameraButton.addEventListener('click', async () => {
  startCamera(); // Bắt đầu camera khi nhấp vào nút
  centeredDiv.style.display = 'flex';

  const codeReader = new ZXingBrowser.BrowserQRCodeReader();
  const videoInputDevices =
    await ZXingBrowser.BrowserCodeReader.listVideoInputDevices();
  const selectedDeviceId = videoInputDevices[0].deviceId;

  console.log(`Started decode from camera with id ${selectedDeviceId}`);

  const controls = await codeReader.decodeFromVideoDevice(
    selectedDeviceId,
    cameraView,
    async (result, error, controls) => {
      if (result) {
        console.log(result);
        if (result.text.toString().includes('http')) {
          const match = result.text.match(/[?&]id=([^&]*)/);
          const idParam = match && match[1];
          fetch('http://localhost:9000/ticket/getTicket/' + idParam)
            .then((response) => response.json())
            .then(async (data) => {
              console.log(data.data);
              const seat_number = data.data.recordset[0].seat_number;
              const coach_id = data.data.recordset[0].coach_id;
              fetchSetSeatStatusData(coach_id, seat_number, 3);
            })
            .catch((err) => {
              console.error('Error fetching data:', err);
            });
          // open url in new tab
          setTimeout(window.open(result.text, '_blank'), 500);
          // close camera
          setTimeout(() => {
            if (stream) {
              const tracks = stream.getTracks();
              tracks.forEach((track) => track.stop());
              stream = null;
              cameraView.srcObject.getVideoTracks().forEach(function (track) {
                //in case... :)
                track.stop();
              });
              centeredDiv.style.display = 'none';
            }
          }, 1000);
        }
      }
    }
  );

  closeButton.addEventListener('click', function () {
    console.log(stream);
    if (stream) {
      stream.stop();
      stream = null; // Đặt stream thành null
    }

    // Close the modal
    console.log(cameraView.srcObject);
    cameraView.srcObject.getVideoTracks().forEach(function (track) {
      //in case... :)
      track.stop();
    });
    centeredDiv.style.display = 'none';
  });
});
