window.dataLayer = window.dataLayer || []
function gtag() { dataLayer.push(arguments) }

gtag('js', new Date())

const trackGoogleAnalytics = (event) => {
  gtag('config', 'G-E35PRXQS0M', {
    'cookie_flags': 'max-age=7200;secure;samesite=none'
  })
}

document.addEventListener('turbolinks:load', trackGoogleAnalytics)