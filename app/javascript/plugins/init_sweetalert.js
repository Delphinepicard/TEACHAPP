import swal from 'sweetalert';

const initSweetalert = () => {
  const noticeElement = document.querySelector('#sweet-notice')
  if (noticeElement) {
    swal({
      title: "Affectation envoyée ! ",
      text:  noticeElement.dataset.message,
      icon: "success"
    });
  }
};

export { initSweetalert };
