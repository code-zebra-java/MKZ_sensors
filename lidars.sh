#!/bin/bash

echo "Launching Lidar Nodes..."
echo "Launching Ouster Node and rviz..."
ros2 launch ouster_ros sensor.launch.xml&
Ou=$!

echo "Launching VLP16 Nodes..."
ros2 launch velodyne velodyne-all-nodes-VLP16-launch.py device_ip:="'192.168.1.102'"&
Vl16A=$!
ros2 launch velodyne velodyne-all-nodes-VLP16-launch.py device_ip:="'192.168.1.103'"&
Vl16B=$!

echo "Launching VLP32 Node..."
ros2 launch velodyne velodyne-all-nodes-VLP32C-launch.py device_ip:="'192.168.1.101'"&
Vl32=$!

cleanup() {
kill -INT $Ou $Vl16A $Vl16B $Vl32 2>/dev/null
wait $Ou $Vl16A $Vl16B $Vl32 2>/dev/null
}

trap cleanup EXIT
trap "Ctrl C clicked, Killing all nodes." SIGINT 

echo "Launching Rviz"
rviz2



