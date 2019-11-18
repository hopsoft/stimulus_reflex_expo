#!/bin/bash
sed '8s/^...//' app/javascript/controllers/bucket_lists_controller.js > tmp/bucket_lists_controller.js
mv tmp/bucket_lists_controller.js app/javascript/controllers/bucket_lists_controller.js
wget -O node_modules/gsap/InertiaPlugin.js $INERTIA_PLUGIN
wget -O node_modules/gsap/VelocityTracker.js $VELOCITY_TRACKER
bundle exec rails db:migrate