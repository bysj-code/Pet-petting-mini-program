from app.core import controller

controllerClass = getattr(controller, "Controller")

# 留言反馈
class Message_feedback(controllerClass):
    def __init__(self, config={}):
        """
        构造函数
        @param {Object} config 配置参数
        """
        config_init = {
            # 选择的模板那路径模板
            "tpl": "./message_feedback/",
            # 选择的服务
            "service": "message_feedback",
        }
        config_temp = config
        config_temp.update(config_init)
        super(Message_feedback , self).__init__(config_temp)


