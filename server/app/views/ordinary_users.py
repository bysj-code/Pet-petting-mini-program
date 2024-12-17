from app.core import controller

controllerClass = getattr(controller, "Controller")

# 普通用户
class Ordinary_users(controllerClass):
    def __init__(self, config={}):
        """
        构造函数
        @param {Object} config 配置参数
        """
        config_init = {
            # 选择的模板那路径模板
            "tpl": "./ordinary_users/",
            # 选择的服务
            "service": "ordinary_users",
        }
        config_temp = config
        config_temp.update(config_init)
        super(Ordinary_users , self).__init__(config_temp)


