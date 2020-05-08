import { Application } from 'stimulus'
import { definitionsFromContext } from 'stimulus/webpack-helpers'
import StimulusReflex from 'stimulus_reflex'
import consumer from '../channels/consumer'
import controller from './application_controller'

const application = Application.start()
const context = require.context('controllers', true, /_controller\.js$/)
const context_components = require.context(
  '../../components',
  true,
  /_controller.js$/
)
application.load(
  definitionsFromContext(context).concat(
    definitionsFromContext(context_components)
  )
)
StimulusReflex.initialize(application, { consumer, controller, debug: true })

// Import and register all TailwindCSS Components
import {
  Dropdown,
  Modal,
  Tabs,
  Popover,
  Toggle
} from 'tailwindcss-stimulus-components'
application.register('dropdown', Dropdown)
application.register('modal', Modal)
application.register('tabs', Tabs)
application.register('popover', Popover)
application.register('toggle', Toggle)
