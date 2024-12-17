from app.core.mysql import Service


# 宠物类型服务
class Type_of_pet(Service):
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
                "table": "type_of_pet",
                # 分页大小
                "size": 30,
                "page": 1,
            }
        super(Type_of_pet , self).__init__(config_temp)
