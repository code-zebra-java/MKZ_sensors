import sys
if sys.prefix == '/usr':
    sys.real_prefix = sys.prefix
    sys.prefix = sys.exec_prefix = '/home/temis/Desktop/sensors_ws/src/flir_cam/install/flir_cam'
