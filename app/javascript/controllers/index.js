import { Application } from 'stimulus'
import { definitionsFromContext } from 'stimulus/webpack-helpers'
import debounced from 'debounced'
import StimulusReflex from 'stimulus_reflex'
import StreamFromController from 'cable_ready/javascript/controllers/stream_from_controller.js'
import ApplicationController from './application_controller'
import consumer from '../channels/consumer'

debounced.initialize()

const application = Application.start()
const context = require.context('controllers', true, /_controller\.js$/)
application.load(definitionsFromContext(context))

// CableReady setup
application.register('stream-from', StreamFromController)

// StimulusReflex setup
application.consumer = consumer // should we have StimulusReflex.initialize assign application.consumer?
StimulusReflex.initialize(application, {
  consumer,
  ApplicationController,
  debug: true
})
