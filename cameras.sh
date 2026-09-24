
#!/bin/bash

echo "Launching all cameras"
echo "Launching lucid cameras"
ros2 run arena_camera_node start --ros-args -p serial:="'221202859'" -p qos_history:="'keep_last'" -p qos_history_depth:=10 -p qos_reliability:="'reliable'" -p topic:="imagesbl"&
LU1=$!
ros2 run arena_camera_node start --ros-args -p serial:="'221202846'" -p qos_history:="'keep_last'" -p qos_history_depth:=10 -p qos_reliability:="'reliable'" -p topic:="imagesbr"&
LU2=$!
ros2 run arena_camera_node start --ros-args -p serial:="'221202847'" -p qos_history:="'keep_last'" -p qos_history_depth:=10 -p qos_reliability:="'reliable'" -p topic:="imagesfl"&
LU3=$!
ros2 run arena_camera_node start --ros-args -p serial:="'221202855'" -p qos_history:="'keep_last'" -p qos_history_depth:=10 -p qos_reliability:="'reliable'" -p topic:="imagesfr"&
LU4=$!
echo "Launching FLIR camera"
ros2 run flir_cam flir_cam&
FL=$!


cleanup() {
kill -INT $LU1 $LU2 $LU3 $LU4 $FL 2>/dev/null
wait $LU1 $LU2 $LU3 $LU4 $FL 2>/dev/null
}

trap cleanup EXIT
trap "Ctrl C clicked, Killing all nodes." SIGINT 

echo "Launching Rviz"
rviz2
