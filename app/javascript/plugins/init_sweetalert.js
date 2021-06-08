import swal from 'sweetalert';

const initSweetalert = () => {
  const noticeElement = document.querySelector('#sweet-notice')
  if (noticeElement) {
    swal({
      title: "Mission Accomplie ! ",
      text:  noticeElement.dataset.message,
      icon: "success"
    });
  }
};

export { initSweetalert };
