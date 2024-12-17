from app.core import controller

controllerClass = getattr(controller, "Controller")

# 消息通知
class Message_notification(controllerClass):
    def __init__(self, config={}):
        """
        构造函数
        @param {Object} config 配置参数
        """
        config_init = {
            # 选择的模板那路径模板
            "tpl": "./message_notification/",
            # 选择的服务
            "service": "message_notification",
        }
        config_temp = config
        config_temp.update(config_init)
        super(Message_notification , self).__init__(config_temp)


