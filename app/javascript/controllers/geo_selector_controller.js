import ApplicationController from './application_controller'

export default class extends ApplicationController {
  static targets = [
    'subregionPlaceholder',
    'countryPlaceholder',
    'detailPlaceholder'
  ]

  beforeReflex (element, reflex) {
    super.beforeReflex(element, reflex)

    if (reflex === 'GeoSelectorReflex#select_region')
      this.subregionPlaceholderTarget.hidden = false

    if (reflex === 'GeoSelectorReflex#select_subregion')
      this.countryPlaceholderTarget.hidden = false

    if (reflex === 'GeoSelectorReflex#select_country')
      this.detailPlaceholderTarget.hidden = false
  }
}
