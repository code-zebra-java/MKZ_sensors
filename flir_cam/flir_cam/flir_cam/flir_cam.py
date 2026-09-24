#!/usr/bin/env python3
#from work so far, this interfaces with camera inside the vehicle
import rclpy
from rclpy.node import Node
import cv2
from cv_bridge import CvBridge
from sensor_msgs.msg import Image

class Camera2(Node):
    def __init__(self):
        super().__init__('camera_2')
        self.publisher_ = self.create_publisher(Image, 'camera2/image_raw', 10)
        self.timer = self.create_timer(1.0/30.0, self.timer_callback)
        self.cap = cv2.VideoCapture("/dev/video0")
        self.bridge = CvBridge()
        self.get_logger().info('Camera 2 Node has started')

    def timer_callback(self):
        ret, frame = self.cap.read()

        if ret:
            ros_image = self.bridge.cv2_to_imgmsg(frame, encoding="bgr8")
            ros_image.header.frame_id = 'frame'
            self.publisher_.publish(ros_image)
        else:
            self.get_logger().info('Failed to capture Camera2 image')
    
    def destroyNode(self):
        self.cap.release()

def main (args=None):
    rclpy.init(args=args)
    camera2Node = Camera2()
    try:
        rclpy.spin(camera2Node)
    except KeyboardInterrupt:
        camera2Node.destroyNode()
        rclpy.shutdown()

if __name__ == '__main__':
    main()