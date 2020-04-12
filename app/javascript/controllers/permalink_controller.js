import { camelize } from 'inflected'

import ApplicationController from './application_controller'

/* This is the custom StimulusReflex controller for PermalinkReflex.
 * Learn more at: https://docs.stimulusreflex.com
 */

export default class extends ApplicationController {
  filter (e) {
    this.stimulate('PermalinkReflex#filter', e.target)
  }

  beforeReflex (element) {
    if (element.type === 'checkbox') {
      this.data.set(
        element.name,
        Array.from(document.querySelectorAll(`input[name=${element.name}]`))
          .filter(e => e.checked)
          .map(e => e.value)
          .join(',')
      )
    } else {
      this.data.set(element.name, element.value)
    }
  }

  afterReflex (element, reflex, error) {
    if (!error) {
      const camelizedIdentifier = camelize(this.identifier)
      const params = new URLSearchParams(window.location.search.slice(1))
      Object.keys(Object.assign({}, this.element.dataset))
        .filter(attr => attr.startsWith(camelizedIdentifier))
        .forEach(attr => {
          const paramName = attr.slice(camelizedIdentifier.length).toLowerCase()
          params.set(paramName, this.data.get(paramName))
        })

      history.pushState(
        {},
        '',
        `${window.location.pathname}?${params.toString()}`
      )
    }
  }
}
