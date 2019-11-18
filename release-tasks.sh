#!/bin/bash
sed '8s/^...//' app/javascript/controllers/bucket_lists_controller.js
wget -O InertiaPlugin.js $INERTIA_PLUGIN
wget -O VelocityTracker.js $VELOCITY_TRACKER
bundle exec rails db:migrate