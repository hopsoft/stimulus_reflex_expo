#!/bin/bash
sed '8s/^...//' /app/app/javascript/controllers/bucket_lists_controller.js > /app/tmp/bucket_lists_controller.js
mv /app/tmp/bucket_lists_controller.js /app/app/javascript/controllers/bucket_lists_controller.js
wget -O /app/node_modules/gsap/InertiaPlugin.js $INERTIA_PLUGIN
wget -O /app/node_modules/gsap/VelocityTracker.js $VELOCITY_TRACKER
