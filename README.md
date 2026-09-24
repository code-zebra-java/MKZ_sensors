This file contains a few commands to test the cameras separately, these are the commands included in the bash file that runs the rviz program. (Everything that needs to be sourced is already in the bashrc file, and sources automatically)

To run lucid camera nodes: 'ros2 run arena_camera_node start --ros-args -p serial:="'221202859'" -p qos_history:="'keep_last'" -p qos_history_depth:=10 -p qos_reliability:="'reliable'" -p topic:="imagesbl"'

'ros2 run arena_camera_node start --ros-args -p serial:="'221202846'" -p qos_history:="'keep_last'" -p qos_history_depth:=10 -p qos_reliability:="'reliable'" -p topic:="imagesbr"'

'ros2 run arena_camera_node start --ros-args -p serial:="'221202847'" -p qos_history:="'keep_last'" -p qos_history_depth:=10 -p qos_reliability:="'reliable'" -p topic:="imagesfl"'

'ros2 run arena_camera_node start --ros-args -p serial:="'221202855'" -p qos_history:="'keep_last'" -p qos_history_depth:=10 -p qos_reliability:="'reliable'" -p topic:="imagesfr"' (Change the serial number as necessary) serial numbers: 221202859(rear driver side) 221202846(rear passenger side) 221202847(front driver side) 221202855(front passenger side)

To run the usb camera node: 'ros2 run MKZ_cameras camera1' To run flir camera node: 'ros2 run flir_cam flir_cam'

How to start ouster lidar in ros: 'ros2 launch ouster_ros sensor.launch.xml' (This node launches rviz as well) sensor hostname/ serial number: os-992315000023 ouster ip address: 192.168.1.10 Network adapter address: 192.168.1.100 subnet:255.255.255.0 default gateway: 0.0.0.0

To run VLP-16 velodyne lidar node: 'ros2 launch velodyne velodyne-all-nodes-VLP16-launch.py device_ip:="'192.168.1.102'"' (Change the fixed frame from 'map' to 'velodyne', you'll need to type it in!) (Change the IP address as necessary) IP addresses: 192.168.1.102(LEFT) 192.168.1.103(RIGHT)

To run VLP-32 velodyne lidar node: 'ros2 launch velodyne velodyne-all-nodes-VLP32C-launch.py device_ip:="'192.168.1.101'"' (Change the fixed frame from 'map' to 'velodyne', you'll need to type it in!)

To run a smartmicro radar node: 'ros2 launch umrr_ros2_driver radar.launch.py'

TIPS: 
In case ouster outputs an error in vscode, add this to the include path: ~/Desktop/sensors_ws/ouster-ros-ros2/ouster-ros/ouster-sdk/ouster_client/include/ /usr/include/eigen3
Restart colcon build: rm -rf build/ install/ log/ and then colcon build

Ethernet positions on MKZ PC
enp0s31f6 - spectra moba left - Ibeo lidar 
enp9s0 - spectra moba right - empty 
enp10s0f2- right NIC top port - Lucid rear left 
enp10s0f0- right NIC second port - Lucid front left 
enp10s0f3- right NIC third port - Lucid rear right 
enp10s0f1- right NIC last port - Lucid front right 
enp3s0 - left NIC top port - netgear switch 
enp4s0 - left NIC second port -empty 
enp5s0 - left NIC third port - empty 
enp6s0 - left NIC last port - empty
