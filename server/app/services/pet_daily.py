from app.core.mysql import Service


# 宠物日常服务
class Pet_daily(Service):
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
                "table": "pet_daily",
                # 分页大小
                "size": 30,
                "page": 1,
            }
        super(Pet_daily , self).__init__(config_temp)
