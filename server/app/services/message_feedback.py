from app.core.mysql import Service


# 留言反馈服务
class Message_feedback(Service):
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
                "table": "message_feedback",
                # 分页大小
                "size": 30,
                "page": 1,
            }
        super(Message_feedback , self).__init__(config_temp)
