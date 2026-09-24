cmake_minimum_required(VERSION 3.8)
project(mobileye_node)

find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(rclpy REQUIRED)
find_package(std_msgs REQUIRED)
find_package(rosidl_default_generators REQUIRED)
find_package(mobileye_msgs REQUIRED)

install(PROGRAMS
  scripts/mobileye_node.py
  DESTINATION lib/${PROJECT_NAME}
)

##install(DIRECTORY scripts/mobileye_node.launch
#  DESTINATION share/${PROJECT_NAME}
#)

ament_export_dependencies(rosidl_default_runtime)
ament_package()