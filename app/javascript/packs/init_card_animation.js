const isElementInViewport = (el) => {


    const rect = el.getBoundingClientRect();

    return (
        rect.top >= 0 &&
        rect.left >= 0 &&
        rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) && /* or $(window).height() */
        rect.right <= (window.innerWidth || document.documentElement.clientWidth) /* or $(window).width() */
    );
}


const card_init = () => {

  Array.from(document.querySelectorAll('.school_card')).forEach((el) => {

    window.addEventListener('scroll', (e) => {
      if (isElementInViewport(el))
        el.classList.add('reveal')
    })
  })

}

export { card_init }

// position Y card < position Y du scroll ( window.pageYOffset )
