const textTags = ['INPUT', 'TEXTAREA']
const focusTags = textTags.concat(['SELECT'])
let lastFocusedElement

const onfocus = event => {
  if (!focusTags.includes(event.target.tagName)) return
  lastFocusedElement = event.target
}

const onblur = event => {
  if (event.target === lastFocusedElement) lastFocusedElement = null
}

const setFocus = () => {
  if (!lastFocusedElement) return
  if (lastFocusedElement === document.activeElement) return

  lastFocusedElement.focus()

  // shenanigans to ensure that the cursor is placed at the end of the existing value
  if (textTags.includes(lastFocusedElement.tagName)) {
    const value = lastFocusedElement.value
    lastFocusedElement.value = ''
    lastFocusedElement.value = value
  }
}

document.removeEventListener('focusin', onfocus, true)
document.addEventListener('focusin', onfocus, true)

document.removeEventListener('focusout', onblur, true)
document.addEventListener('focusout', onblur, true)

document.removeEventListener('cable-ready:after-morph', setFocus)
document.addEventListener('cable-ready:after-morph', setFocus)
