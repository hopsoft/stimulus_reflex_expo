import { Application } from 'stimulus'
import { definitionsFromContext } from 'stimulus/webpack-helpers'
import StimulusReflex from 'stimulus_reflex'
import consumer from '../channels/consumer'
import controller from './application_controller'
import debounced from 'debounced'

// import perform from 'cable_ready'

const application = Application.start()
const context = require.context('controllers', true, /_controller\.js$/)
application.consumer = consumer
application.load(definitionsFromContext(context))
StimulusReflex.initialize(application, { consumer, controller, debug: true })
debounced.initialize()

alert('hi there')
