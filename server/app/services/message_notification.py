from app.core.mysql import Service


# 消息通知服务
class Message_notification(Service):
    def __init__(self, *config):
        """
        构造函数
        @param {Object} config 配置参数
        """
        if config:
            config_temp = config[0]
        else:
            config_temp = {
                # 操作的表
                "table": "message_notification",
                # 分页大小
                "size": 30,
                "page": 1,
            }
        super(Message_notification , self).__init__(config_temp)
