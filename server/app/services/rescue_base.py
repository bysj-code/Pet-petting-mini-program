from app.core.mysql import Service


# 救助基地服务
class Rescue_base(Service):
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
                "table": "rescue_base",
                # 分页大小
                "size": 30,
                "page": 1,
            }
        super(Rescue_base , self).__init__(config_temp)
