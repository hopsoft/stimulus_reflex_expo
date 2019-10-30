const textTags = ['INPUT', 'TEXTAREA']
const focusTags = textTags.concat(['SELECT'])
let initialized = false
let lastFocusedElement

const onfocus = event => {
  if (!focusTags.includes(event.target.tagName)) return
  lastFocusedElement = event.target
}

export const setFocus = () => {
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

const initialize = () => {
  if (initialized) return
  if (!document.body) return setTimeout(initialize, 100)
  initialized = true
  const observer = new MutationObserver(setFocus)
  observer.observe(document.body, { childList: true, subtree: true })
  document.removeEventListener('focusin', onfocus)
  document.addEventListener('focusin', onfocus)
}

initialize()
