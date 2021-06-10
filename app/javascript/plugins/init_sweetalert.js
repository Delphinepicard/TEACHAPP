import swal from 'sweetalert';

const initSweetalert = () => {
  const noticeElement = document.querySelector('#sweet-notice')
  if (noticeElement) {
    swal({
      title: "Affectation confirmée !",
      text:  noticeElement.dataset.message,
      icon: "success"
    });
  }
};

export { initSweetalert };
