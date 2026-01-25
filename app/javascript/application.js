// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

document.addEventListener('show.bs.collapse', (e) => {
  const collapseId = e.target.id
  const button = document.querySelector(`[data-bs-target="#${collapseId}"]`)
  if (button) {
    button.classList.add('d-none')
  }
})

document.addEventListener('hide.bs.collapse', (e) => {
  const collapseId = e.target.id
  const button = document.querySelector(`[data-bs-target="#${collapseId}"]`)
  if (button) {
    button.classList.remove('d-none')
  }
})
